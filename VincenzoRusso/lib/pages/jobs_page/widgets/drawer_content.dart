import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/theme/cubit/theme_cubit.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/theme/models/theme.dart';
import 'package:offertelavoroflutter_app/widgets/favourite_list.dart';

class DrawerContent extends StatelessWidget {
  const DrawerContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            height: 180,
            decoration: const BoxDecoration(
              gradient: AppColors.primaryGradient,
            ),
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/images/offertelavoroflutter_banner.png",
              color: AppColors.accent,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0,
                    ),
                    child: BlocBuilder<ThemeCubit, ThemeState>(
                      builder: (context, state) => Row(
                        children: [
                          Expanded(
                            child: Text(
                              state.theme.localize(context) ?? '',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          AnimatedToggleSwitch<ThemeType>.rolling(
                            current: state.theme,
                            values: const [
                              ThemeType.system,
                              ThemeType.light,
                              ThemeType.dark,
                            ],
                            borderColor: AppColors.primaryLight,
                            indicatorColor: AppColors.primaryLight,
                            onChanged: (i) {
                              context.read<ThemeCubit>().setTheme(i);
                            },
                            iconBuilder: (ThemeType value, Size iconSize,
                                bool foreground) {
                              IconData data = FontAwesomeIcons.circleHalfStroke;
                              if (value == ThemeType.system) {
                                data = FontAwesomeIcons.circleHalfStroke;
                              } else if (value == ThemeType.light) {
                                data = FontAwesomeIcons.sun;
                              } else if (value == ThemeType.dark) {
                                data = FontAwesomeIcons.moon;
                              }
                              return Icon(
                                data,
                                size: iconSize.shortestSide,
                                color: foreground
                                    ? AppColors.white
                                    : AppColors.primaryLight,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Le tue Offerte",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.primaryLight,
                              ),
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<FavouriteJobBloc, FavouriteJobState>(
                      builder: (context, state) {
                        if (state is LoadingFavouriteJobState) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "⚙️ Sto caricando i tuoi dati...",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        AppColors.primaryLight.withAlpha(200),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        if (state is LoadedFavouriteJobState) {
                          return FavouriteList(
                            favourites: state.favouriteJob,
                          );
                        }

                        if (state is NoFavouriteJobState) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "💾\nNessun lavoro salvato nella tua lista dei preferiti",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        AppColors.primaryLight.withAlpha(200),
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          );
                        }

                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
