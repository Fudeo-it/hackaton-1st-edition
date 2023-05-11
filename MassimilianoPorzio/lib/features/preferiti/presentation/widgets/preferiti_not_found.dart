import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/app/presentation/cubit/navbar/navigation_cubit.dart';
import 'package:job_app/app/presentation/widgets/reusable_primary_button.dart';
import 'package:job_app/app/resources/app_consts.dart';
import 'package:job_app/app/resources/string_constants.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_filter_params.dart';
import 'package:job_app/features/preferiti/domain/usecases/preferiti_params.dart';
import 'package:job_app/features/preferiti/presentation/cubit/filters/preferiti_filters_cubit.dart';

import '../cubit/annunci/preferiti_cubit.dart';

class PreferitiNotFound extends StatelessWidget {
  const PreferitiNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scrollbar(
        thumbVisibility: orientation == Orientation.landscape,
        thickness: 4,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              orientation == Orientation.landscape
                  ? 'assets/images/sfondi/article_not_found-hor.png' //TODO ritagliare ancora sopra e sotto
                  : 'assets/images/sfondi/article_not_found.png',
              fit: BoxFit.fitWidth,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      orientation == Orientation.landscape
                          ? StringConsts.notHor
                          : StringConsts.not,
                      style: kTitleTextStyle,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40),
                      child: const Text(
                        StringConsts.found,
                        style: kTitleTextStyle,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Oops! Non sono presenti annunci preferiti.',
                  style: kSubtitleTextStyle.copyWith(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
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
                          case 1:
                            PreferitiFiltersParams params = context
                                .read<PreferitiFiltersCubit>()
                                .state
                                .paramsFromState;
                            context
                                .read<PreferitiCubit>()
                                .ottieniPreferiti(params);
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
