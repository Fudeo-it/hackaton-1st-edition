import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/app/presentation/widgets/reusable_primary_button.dart';
import 'package:job_app/app/resources/string_constants.dart';
import 'package:job_app/features/aziende/presentation/cubit/annunci/aziende_cubit.dart';

import '../../resources/app_consts.dart';
import '../cubit/navbar/navigation_cubit.dart';

class CertainError extends StatelessWidget {
  final String message;
  const CertainError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/sfondi/certain_error.png',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  StringConsts.oops,
                  style: kTitleTextStyle,
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  message,
                  style: kSubtitleTextStyle.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                BlocBuilder<NavigationCubit, NavigationState>(
                  builder: (context, state) {
                    return ReusablePrimaryButton(
                      childText: StringConsts.tryAgain,
                      buttonColor: Colors.green.harmonizeWith(
                          Theme.of(context).colorScheme.background),
                      childTextColor:
                          Theme.of(context).colorScheme.onBackground,
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
    );
  }
}
