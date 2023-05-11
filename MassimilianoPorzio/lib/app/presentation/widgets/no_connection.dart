import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/features/aziende/presentation/cubit/annunci/aziende_cubit.dart';

import '../../resources/app_consts.dart';
import '../cubit/navbar/navigation_cubit.dart';
import 'reusable_primary_button.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              OrientationBuilder(
                builder: (context, orientation) => Image.asset(
                  orientation == Orientation.landscape
                      ? 'assets/images/sfondi/connection_failed-hor.png'
                      : 'assets/images/sfondi/connection_failed.png',
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'No Connection',
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    'Controlla la tua connessione a Internet e riprova.',
                    style: kSubtitleTextStyle.copyWith(color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  BlocBuilder<NavigationCubit, NavigationState>(
                    builder: (context, state) {
                      return ReusablePrimaryButton(
                        childText: 'Riprova',
                        buttonColor: Theme.of(context).colorScheme.error,
                        childTextColor: Theme.of(context).colorScheme.onError,
                        onPressed: () {
                          int pageIndex = state.selectedIndex;
                          switch (pageIndex) {
                            case 0:
                              context.read<AziendeCubit>().fetchAnnunci();
                              break;
                            default:
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
