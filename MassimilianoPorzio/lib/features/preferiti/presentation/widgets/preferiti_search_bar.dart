import 'dart:async';

import 'package:badges/badges.dart' as badges;
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/freelancers/domain/enums/nda.dart';

import 'package:job_app/features/preferiti/domain/usecases/preferiti_filter_params.dart';
import 'package:job_app/features/preferiti/presentation/cubit/annunci/preferiti_cubit.dart';
import 'package:job_app/features/preferiti/presentation/cubit/filters/preferiti_filters_cubit.dart';
import 'package:loggy/loggy.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';
import '../../../../app/resources/string_constants.dart';

import '../../../../core/utils/sound_utils.dart';

class PreferitiSearchBar extends StatefulWidget with UiLoggy {
  const PreferitiSearchBar({
    super.key,
  });

  @override
  State<PreferitiSearchBar> createState() => _PreferitiSearchBarState();
}

class _PreferitiSearchBarState extends State<PreferitiSearchBar> with UiLoggy {
  late TextEditingController _searchController;
  Timer? _debounce;

  Future<void> _resetSearch(BuildContext context) {
    loggy.debug("...Riprendo la lista originaria...");
    return Future.value();
  }

  _doSearch(BuildContext context) async {
    loggy.debug("...TRIGGER SEARCH preferiti...");
    PreferitiFiltersParams params =
        context.read<PreferitiFiltersCubit>().state.paramsFromState;
    await context.read<PreferitiCubit>().ottieniPreferiti(params);
    //
  }

  _refresh(BuildContext context) {
    context.read<PreferitiFiltersCubit>().reset();
    context.read<PreferitiCubit>().reset();
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
            context.read<PreferitiFiltersCubit>().setSearchTerm(value);
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
                                    .read<PreferitiFiltersCubit>()
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
