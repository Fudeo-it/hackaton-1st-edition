import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/aziende/presentation/cubit/annunci/aziende_cubit.dart';

class AnnunciRecenti extends StatelessWidget {
  const AnnunciRecenti({
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
          horizontal: orientation == Orientation.portrait ? 10 : 0),
      width: orientation == Orientation.portrait ? 0.9 * mWidth : 0.1 * mWidth,
      child: Card(
        // color:
        //     Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.75),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.error.withOpacity(0.7),
                Theme.of(context).colorScheme.primary,
              ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: BlocBuilder<AziendeCubit, AziendeState>(
            builder: (context, state) {
              String stringAnnunci = "annunci\nrecenti";
              String num = "0";
              if (state.status == AziendeStateStatus.loaded) {
                num = state.numeroAnnunciRecenti;
              }
              if (int.parse(num) == 1) {
                stringAnnunci = "annuncio\nrecente";
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(num,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          )),
                  Text(
                    stringAnnunci,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontSize: orientation == Orientation.portrait ? 12 : 9,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
