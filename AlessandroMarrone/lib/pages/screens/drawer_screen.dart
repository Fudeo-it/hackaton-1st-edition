import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/blocs/splash_page_pref/splash_page_pref_bloc.dart';
import 'package:offertelavoroflutter_it_app/cubits/show_splash_page/show_splash_page_cubit.dart';
import 'package:offertelavoroflutter_it_app/themes/cubits/theme/theme_cubit.dart';
import 'package:offertelavoroflutter_it_app/themes/theme_type.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/auto_size_text_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/logo_fudeo_widget.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            )),
        width: MediaQuery.of(context).size.width * 0.90,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              _builDrawerHeader(context),
              _buildDrawerBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _builDrawerHeader(BuildContext context) => Expanded(
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                K.primaryColor,
                K.secondaryColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              const FlutterLogo(
                size: 100,
              ),
              AutoSizeTextWidget(
                AppLocalizations.of(context)?.welcome_text_body_line1 ??
                    "welcome_text_body_line1",
                maxFontSize: 24.0,
                minFontSize: 12.0,
                style: const TextStyle(
                  color: K.accentColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0, 1),
                      blurRadius: 5.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    ),
                  ],
                ),
              ),
              const LogoFudeoWidget(),
            ],
          ),
        ),
      );

  Widget _buildDrawerBody(BuildContext context) => Expanded(
        flex: 2,
        child: Container(
          margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 16.0),
          color: Theme.of(context).scaffoldBackgroundColor,
          child: ExpandablePanel(
            header: Row(
              children: [
                const Icon(
                  LucideIcons.settings,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  AppLocalizations.of(context)?.title_settings_menu ??
                      "title_settings_menu",
                  style: const TextStyle(fontWeight: FontWeight.w600),
                )
              ],
            ),
            collapsed: Container(),
            expanded: Column(
              children: [
                _darkMode,
                _showSplashPageItem,
              ],
            ),
          ),
        ),
      );

  Widget get _darkMode => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (themeCubitContext, themeCubitState) {
          return Container(
            padding: const EdgeInsets.only(left: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(themeCubitContext)?.label_switch_dark ??
                        "label_switch_dark",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoSwitch(
                    value: themeCubitState.dark,
                    activeColor: K.primaryColor,
                    trackColor: K.secondaryColor.withOpacity(0.10),
                    onChanged: (value) {
                      themeCubitContext
                          .read<ThemeCubit>()
                          .setTheme(value ? ThemeType.dark : ThemeType.light);
                    },
                  ),
                )
              ],
            ),
          );
        },
      );

  Widget get _showSplashPageItem =>
      BlocBuilder<SplashPagePrefBloc, SplashPagePrefState>(
        builder: (splashPageContext, splashPageState) {
          return Container(
            padding: const EdgeInsets.only(left: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(AppLocalizations.of(splashPageContext)
                          ?.label_switch_show_splash_page ??
                      "label_switch_show_splash_page"),
                ),
                BlocBuilder<ShowSplashPageCubit, ShowSplashPageState>(
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoSwitch(
                        value: state.enableSpashPage,
                        activeColor: K.primaryColor,
                        trackColor: K.secondaryColor.withOpacity(0.10),
                        onChanged: (value) {
                          value
                              ? context
                                  .read<SplashPagePrefBloc>()
                                  .showSplashPageToStartup()
                              : context
                                  .read<SplashPagePrefBloc>()
                                  .hideSplashPageToStartup();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
}
