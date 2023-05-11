import 'dart:async';

import 'package:badges/badges.dart' as badges;
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/aziende/domain/usecases/annunci_azienda_params.dart';
import 'package:loggy/loggy.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';
import '../../../../app/resources/string_constants.dart';

import '../../../../core/utils/sound_utils.dart';
import '../../domain/enums/contratto.dart';
import '../../domain/enums/seniority.dart';
import '../../domain/enums/team.dart';
import '../cubit/annunci/aziende_cubit.dart';
import '../cubit/filters/aziende_filter_cubit.dart';
import 'filter_chips.dart';

class AziendeSearchBar extends StatefulWidget with UiLoggy {
  const AziendeSearchBar({
    super.key,
  });

  @override
  State<AziendeSearchBar> createState() => _AziendeSearchBarState();
}

class _AziendeSearchBarState extends State<AziendeSearchBar> with UiLoggy {
  late TextEditingController _searchController;
  Timer? _debounce;

  Future<void> _resetSearch(BuildContext context) {
    loggy.debug("...Riprendo la lista originaria...");
    return Future.value();
  }

  _doSearch(BuildContext context) async {
    loggy.debug("...TRIGGER SEARCH on Notion...");
    AnnunciAzParams params =
        context.read<AziendeFilterCubit>().state.paramsFromState;
    await context.read<AziendeCubit>().loadAnnunci(params);
    //
  }

  _refresh(BuildContext context) {
    context.read<AziendeFilterCubit>().reset();
    context.read<AziendeCubit>().reset();
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
            context.read<AziendeFilterCubit>().setSearchTerm(value);
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
                                    .read<AziendeFilterCubit>()
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
                        isDismissible: true,
                        context: context,
                        builder: (context) {
                          return buildAziendeFilterSheet(context);
                        },
                      );
                      // ).whenComplete(
                      //   () {},
                      // );
                      FocusManager.instance.primaryFocus?.unfocus();
                      loggy.info("result is $result");

                      if (result != null) {
                        AnnunciAzParams params =
                            (result as AziendeFilterState).paramsFromState;
                        if (!mounted) return;

                        if (params.isEmpty) {
                          context.read<AziendeFilterCubit>().reset();

                          context
                              .read<AziendeCubit>()
                              .recuperaListaNonFiltrata();
                        } else {
                          context.read<AziendeCubit>().loadAnnunci(params);
                        }
                      }
                    }, icon:
                        BlocBuilder<AziendeFilterCubit, AziendeFilterState>(
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

  Widget buildAziendeFilterSheet(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        height: MediaQuery.of(context).size.height,
        child: BlocBuilder<DarkModeCubit, DarkModeState>(
          builder: (context, themeState) {
            return BlocBuilder<AziendeFilterCubit, AziendeFilterState>(
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
                              context.read<AziendeFilterCubit>().resetFiltri();
                              Navigator.of(context)
                                  .pop(AziendeFilterState.initial());
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
                                          .read<AziendeFilterCubit>()
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
                        Text("Seniority",
                            style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        juniorFilter(context, themeState, state),
                        midFilter(context, themeState, state),
                        seniorFilter(context, themeState, state),
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
                        Text("Contratto",
                            style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        fullTimeFilter(context, themeState, state),
                        partTimeFilter(context, themeState, state),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.home_work),
                        SizedBox(
                          width: 8,
                        ),
                        Text("Team",
                            style: TextStyle(fontWeight: FontWeight.w600))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        inSedeFilter(context, themeState, state),
                        ibridoFilter(context, themeState, state),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        fullRemoteFilter(context, themeState, state),
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

  FilterChip inSedeFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      state: state,
      themeState: themeState,
      context: context,
      label: FilterTeamChip(team: Team.inSede, mode: themeState.mode),
      selected: state.inSedeFilter,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setInSedeFilter(value);
      },
    );
  }

  FilterChip ibridoFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      state: state,
      themeState: themeState,
      context: context,
      label: FilterTeamChip(team: Team.ibrido, mode: themeState.mode),
      selected: state.ibridoFilter,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setIbridoFilter(value);
      },
    );
  }

  FilterChip fullRemoteFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      state: state,
      themeState: themeState,
      context: context,
      label: FilterTeamChip(team: Team.fullRemote, mode: themeState.mode),
      selected: state.fullRemoteFilter,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setFullRemoteilter(value);
      },
    );
  }

  FilterChip fullTimeFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      state: state,
      themeState: themeState,
      context: context,
      label: FilterContrattoChip(
          contratto: Contratto.fullTime, mode: themeState.mode),
      selected: state.fullTimeFilter,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setFullTimeFilter(value);
      },
    );
  }

  FilterChip partTimeFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      state: state,
      themeState: themeState,
      context: context,
      label: FilterContrattoChip(
          contratto: Contratto.partTime, mode: themeState.mode),
      selected: state.partTimeFilter,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setPartTimeFilter(value);
      },
    );
  }

  FilterChip juniorFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      context: context,
      label: FilterSeniorityChip(
        mode: themeState.mode,
        seniority: Seniority.junior,
      ),
      state: state,
      selected: state.juniorSeniorityFilter,
      themeState: themeState,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setJuniorSeniorityFilter(value);
      },
    );
  }

  FilterChip midFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      context: context,
      label: FilterSeniorityChip(
        mode: themeState.mode,
        seniority: Seniority.mid,
      ),
      state: state,
      selected: state.midSeniorityFilter,
      themeState: themeState,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setMidSeniorityFilter(value);
      },
    );
  }

  FilterChip seniorFilter(BuildContext context, DarkModeState themeState,
      AziendeFilterState state) {
    return buildFilterChip(
      context: context,
      label: FilterSeniorityChip(
        mode: themeState.mode,
        seniority: Seniority.senior,
      ),
      selected: state.seniorSeniorityFilter,
      state: state,
      themeState: themeState,
      onSelected: (value) {
        context.read<AziendeFilterCubit>().setSeniorSeniorityFilter(value);
      },
    );
  }

  FilterChip buildFilterChip({
    required AziendeFilterState state,
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
      // label: Text(
      //   "${Seniority.junior}",
      //   style: Theme.of(context)
      //       .textTheme
      //       .labelSmall!
      //       .copyWith(
      //           fontWeight:
      //               FontWeight.w600,
      //           color: Colors.black),
      // ),
      onSelected: onSelected,
    );
  }
}
