import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/app/presentation/cubit/navbar/navigation_cubit.dart';
import 'package:job_app/app/presentation/widgets/reusable_primary_button.dart';
import 'package:job_app/app/resources/app_consts.dart';
import 'package:job_app/app/resources/string_constants.dart';

import 'package:job_app/features/aziende/presentation/cubit/annunci/aziende_cubit.dart';
import 'package:job_app/features/aziende/presentation/cubit/filters/aziende_filter_cubit.dart';

import '../../domain/usecases/annunci_azienda_params.dart';

class AnnunciAzNotFound extends StatelessWidget {
  const AnnunciAzNotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              orientation == Orientation.landscape
                  ? 'assets/images/sfondi/article_not_found-hor.png'
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
                  'Oops! Non sono stati trovati\nannunci.',
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
                          case 0:
                            AnnunciAzParams params = context
                                .read<AziendeFilterCubit>()
                                .state
                                .paramsFromState;
                            context.read<AziendeCubit>().loadAnnunci(params);
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
