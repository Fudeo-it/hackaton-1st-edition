import 'dart:async';

import 'package:badges/badges.dart' as badges;
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/freelancers/domain/enums/nda.dart';

import 'package:job_app/features/freelancers/presentation/cubit/filters/freelancers_filters_cubit.dart';
import 'package:job_app/features/freelancers/presentation/widgets/filter_chips_freelancers.dart';
import 'package:loggy/loggy.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';
import '../../../../app/resources/string_constants.dart';

import '../../../../core/utils/sound_utils.dart';

import '../../domain/enums/relazione.dart';
import '../../domain/usecases/annunci_freelancer_params.dart';
import '../cubit/annunci/freelancers_cubit.dart';

class FreelancersSearchBar extends StatefulWidget with UiLoggy {
  const FreelancersSearchBar({
    super.key,
  });

  @override
  State<FreelancersSearchBar> createState() => _FreelancersSearchBarState();
}

class _FreelancersSearchBarState extends State<FreelancersSearchBar>
    with UiLoggy {
  late TextEditingController _searchController;
  Timer? _debounce;

  Future<void> _resetSearch(BuildContext context) {
    loggy.debug("...Riprendo la lista originaria...");
    return Future.value();
  }

  _doSearch(BuildContext context) async {
    loggy.debug("...TRIGGER SEARCH on Notion...");
    AnnunciFreelancersParams params =
        context.read<FreelancersFiltersCubit>().state.paramsFromState;
    await context.read<FreelancersCubit>().loadAnnunci(params);
    //
  }

  _refresh(BuildContext context) {
    context.read<FreelancersFiltersCubit>().reset();
    context.read<FreelancersCubit>().reset();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      height: orientation == Orientation.landscape ? 54 : 60,
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: TextField(
          onChanged: (value) {
            // setState(() {});
            loggy.debug("sto digitando");
            context.read<FreelancersFiltersCubit>().setSearchTerm(value);
          },
          onSubmitted: (value) {
            // setState(() {});
            loggy.debug('utente ha scritto');
            if (_debounce?.isActive ?? false) _debounce?.cancel();
            _debounce = Timer(const Duration(milliseconds: 700), () {
              // do something with query
              loggy.debug('ora chiamo il cubit');

              if (_searchController.text.isEmpty) {
                //dammi lista originaria?
                _resetSearch(context);
              } else {
                _doSearch(context);
              }
            });
          },
          controller: _searchController,
          obscureText: false,
          textAlign: TextAlign.start,
          maxLines: 1,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.normal,
            fontSize: orientation == Orientation.landscape ? 12 : 14,
            color: Theme.of(context).colorScheme.onBackground,
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 1,
              ),
            ),
            hintText: "Ricerca annunci",
            hintStyle: TextStyle(
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal,
                fontSize: 14,
                color: Theme.of(context).colorScheme.onBackground),
            filled: false,
            isDense: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            prefixIcon: Container(
              // color: Colors.amber,
              child: Icon(Icons.search,
                  size: orientation == Orientation.landscape ? 20 : 24),
            ),
            suffixIcon: SizedBox(
              width: 180,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: _searchController.text.isEmpty
                          ? null
                          : IconButton(
                              onPressed: () {
                                //pulisco il textfield controller
                                _searchController.clear();
                                //tolgo il focus così se ne va la tastiera
                                FocusManager.instance.primaryFocus?.unfocus();
                                // Call setState to update the UI
                                setState(() {});
                                context
                                    .read<FreelancersFiltersCubit>()
                                    .setSearchTerm("");
                                // chiamo cubit per lista originaria?
                              },
                              icon: Icon(Icons.clear,
                                  size: orientation == Orientation.landscape
                                      ? 20
                                      : 24),
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        playSound(file: 'refresh.mp3');
                        _refresh(context);
                      },
                      icon: Icon(Icons.refresh,
                          size: orientation == Orientation.landscape ? 20 : 24),
                    ),
                    IconButton(onPressed: () async {
                      //USO quello che torna da bottomSheet
                      final result = await showModalBottomSheet(
                        isScrollControlled: true,
                        isDismissible: true,
                        context: context,
                        builder: (context) {
                          return buildFreelancersFilterSheet(context);
                        },
                      );
                      // ).whenComplete(
                      //   () {},
                      // );
                      FocusManager.instance.primaryFocus?.unfocus();
                      loggy.info("result is $result");

                      if (result != null) {
                        AnnunciFreelancersParams params =
                            (result as FreelancersFiltersState).paramsFromState;
                        if (!mounted) return;

                        if (params.isEmpty) {
                          context.read<FreelancersFiltersCubit>().reset();

                          context
                              .read<FreelancersCubit>()
                              .recuperaListaNonFiltrata();
                        } else {
                          context.read<FreelancersCubit>().loadAnnunci(params);
                        }
                      }
                    }, icon: BlocBuilder<FreelancersFiltersCubit,
                        FreelancersFiltersState>(
                      builder: (context, state) {
                        return state.isEmpty
                            ? Icon(Icons.filter_alt_outlined,

                                // color: Theme.of(context).colorScheme.error,
                                size: orientation == Orientation.landscape
                                    ? 20
                                    : 24)
                            : badges.Badge(
                                badgeAnimation: badges.BadgeAnimation.scale(
                                  loopAnimation: !state.isEmpty,
                                ),
                                badgeContent: Container(
                                  margin: const EdgeInsets.all(2),
                                  child: Text(
                                    "${state.numberOfActiveFilters}",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onError),
                                  ),
                                ),
                                position: badges.BadgePosition.topEnd(
                                    top: -14, end: -10),
                                badgeStyle: badges.BadgeStyle(
                                    badgeColor: Colors.red.harmonizeWith(
                                        Theme.of(context)
                                            .colorScheme
                                            .background)),
                                child: Icon(Icons.filter_alt,
                                    // color: Theme.of(context).colorScheme.error,
                                    size: orientation == Orientation.landscape
                                        ? 20
                                        : 24),
                              );
                      },
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFreelancersFilterSheet(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return Container(
        color: Theme.of(context).colorScheme.background,
        height: MediaQuery.of(context).size.height * 0.8,
        child: BlocBuilder<DarkModeCubit, DarkModeState>(
          builder: (context, themeState) {
            return BlocBuilder<FreelancersFiltersCubit,
                FreelancersFiltersState>(
              builder: (context, state) {
                return ListView(
                  padding: const EdgeInsets.all(4),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(StringConsts.resetAll),
                        IconButton(
                            onPressed: () {
                              context
                                  .read<FreelancersFiltersCubit>()
                                  .resetFiltri();
                              Navigator.of(context)
                                  .pop(FreelancersFiltersState.initial());
                            },
                            icon: Icon(
                              Icons.close,
                              color: Colors.red.harmonizeWith(
                                  Theme.of(context).colorScheme.background),
                            ))
                      ],
                    ),
                    if (state.searchTerm.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            // color: Colors.lime,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  // color: Colors.amber,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(Icons.subject),
                                          Text("Termine di ricerca: "),
                                          SizedBox(
                                            width: 8,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                InputChip(
                                    tooltip: "termine di ricerca",
                                    onDeleted: () {
                                      _searchController.clear();
                                      context
                                          .read<FreelancersFiltersCubit>()
                                          .setSearchTerm("");
                                    },
                                    avatar: Icon(
                                      Icons.search,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                    ),
                                    visualDensity: const VisualDensity(
                                        vertical: -4, horizontal: -4),
                                    label: Text(
                                      state.searchTerm,
                                    )),
                              ],
                            ),
                          ),
                          const Divider(),
                        ],
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.business_center),
                        SizedBox(
                          width: 8,
                        ),
                        Text(StringConsts.notionNda,
                            style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        siNDAFilter(context, themeState, state),
                        noNDAFilter(context, themeState, state),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.receipt_long),
                        SizedBox(
                          width: 8,
                        ),
                        Text(StringConsts.notionRelazione,
                            style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                    if (orientation == Orientation.landscape)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          soloRelazioneFilter(context, themeState, state),
                          altriRelazioneFilter(context, themeState, state),
                        ],
                      )
                    else
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          soloRelazioneFilter(context, themeState, state),
                          altriRelazioneFilter(context, themeState, state),
                        ],
                      ),
                    const Divider(),
                    Center(
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(state);
                          },
                          child: const Text("filtra gli annunci")),
                    )
                  ],
                );
              },
            );
          },
        ));
  }

  FilterChip soloRelazioneFilter(BuildContext context, DarkModeState themeState,
      FreelancersFiltersState state) {
    return buildFilterChip(
      state: state,
      themeState: themeState,
      context: context,
      label:
          FilterRelazioneChip(relazione: Relazione.solo, mode: themeState.mode),
      selected: state.soloRelazioneFilter,
      onSelected: (value) {
        context.read<FreelancersFiltersCubit>().setSoloRelazioneFilter(value);
      },
    );
  }

  FilterChip altriRelazioneFilter(BuildContext context,
      DarkModeState themeState, FreelancersFiltersState state) {
    return buildFilterChip(
      state: state,
      themeState: themeState,
      context: context,
      label: FilterRelazioneChip(
          relazione: Relazione.altri, mode: themeState.mode),
      selected: state.altriRelazioneFilter,
      onSelected: (value) {
        context.read<FreelancersFiltersCubit>().setAltriRelazioneFilter(value);
      },
    );
  }

  FilterChip siNDAFilter(BuildContext context, DarkModeState themeState,
      FreelancersFiltersState state) {
    return buildFilterChip(
      context: context,
      label: FilterNDAChip(
        mode: themeState.mode,
        nda: NDA.si,
      ),
      state: state,
      selected: state.siNdaFilter,
      themeState: themeState,
      onSelected: (value) {
        context.read<FreelancersFiltersCubit>().setSiNdaFilter(value);
      },
    );
  }

  FilterChip noNDAFilter(BuildContext context, DarkModeState themeState,
      FreelancersFiltersState state) {
    return buildFilterChip(
      context: context,
      label: FilterNDAChip(
        mode: themeState.mode,
        nda: NDA.no,
      ),
      state: state,
      selected: state.noNdaFilter,
      themeState: themeState,
      onSelected: (value) {
        context.read<FreelancersFiltersCubit>().setNoNdaFilter(value);
      },
    );
  }

  FilterChip buildFilterChip({
    required FreelancersFiltersState state,
    required DarkModeState themeState,
    required BuildContext context,
    required Widget label,
    required bool selected,
    required void Function(bool)? onSelected,
  }) {
    return FilterChip(
      side: const BorderSide(
        color: Colors.transparent,
        width: 0.0,
      ),
      labelPadding: const EdgeInsets.all(4),
      shadowColor: Colors.transparent,
      visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      backgroundColor: Colors.transparent,
      selectedColor: Colors.transparent,
      selected: selected,
      label: label,
      onSelected: onSelected,
    );
  }
}
