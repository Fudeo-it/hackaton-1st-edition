import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/resources/styles_manager.dart';
import '../cubit/annunci/preferiti_cubit.dart';

class StatAnnunciPreferiti extends StatelessWidget {
  const StatAnnunciPreferiti({
    super.key,
    required this.orientation,
    required this.mWidth,
  });

  final Orientation orientation;
  final double mWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),

      // height: 0.15 * mHeight,
      // color: Colors.pink,
      width: orientation == Orientation.landscape ? 0.3 * mWidth : 0.6 * mWidth,

      child: BlocBuilder<PreferitiCubit, PreferitiState>(
        builder: (context, state) {
          String numAnnunci = "";
          if (state.status == PreferitiStatus.loaded) {
            numAnnunci = state.listaPreferiti.length.toString();
          }
          return Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            // color: Theme.of(context).colorScheme.primary,
            child: Container(
              margin: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.primary,
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 2, left: 10),
                    child: Text(
                      "Stats",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(numAnnunci,
                          style: StyleManager.getBoldStyle(
                              fontSize: 48,
                              color: Theme.of(context).colorScheme.onPrimary)),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            int.parse(numAnnunci) == 1 ? "annuncio" : "annunci",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                          Text(
                            "di assunzioni",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
