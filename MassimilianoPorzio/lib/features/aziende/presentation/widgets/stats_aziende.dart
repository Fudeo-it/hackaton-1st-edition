import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/aziende/presentation/cubit/annunci/aziende_cubit.dart';

class StatAziende extends StatelessWidget {
  const StatAziende({
    super.key,
    required this.mWidth,
    required this.orientation,
  });

  final double mWidth;
  final Orientation orientation;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: orientation == Orientation.landscape ? 0 : 10,
          vertical: 0),
      width: orientation == Orientation.portrait ? 0.9 * mWidth : 0.1 * mWidth,
      child: SizedBox(
        height: 70,
        child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    Theme.of(context).colorScheme.tertiaryContainer,
                  ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
              child: BlocBuilder<AziendeCubit, AziendeState>(
                  builder: (context, state) {
                String numAziende = "0";
                if (state.status == AziendeStateStatus.loaded) {
                  numAziende = (state).numeroAziende;
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BlocBuilder<AziendeCubit, AziendeState>(
                      builder: (context, state) {
                        return AutoSizeText(numAziende,
                            presetFontSizes: const [22],
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ));
                      },
                    ),
                    AutoSizeText(
                      int.parse(numAziende) == 1 ? "azienda" : "aziende",
                      presetFontSizes: [
                        orientation == Orientation.portrait ? 14 : 10,
                      ],
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              }),
            )),
      ),
    );
  }
}
