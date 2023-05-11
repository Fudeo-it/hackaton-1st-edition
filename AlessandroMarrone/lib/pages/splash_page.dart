import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_it_app/blocs/splash_page_pref/splash_page_pref_bloc.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/router/app_router.gr.dart';

import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/widgets/text_shadow.dart';

class SplashPage extends StatefulWidget {
  final List<JobOfferModel>? jobHiring;
  final List<JobProjectModel>? jobFreelance;
  const SplashPage({Key? key, this.jobFreelance, this.jobHiring})
      : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  bool _isImageAnimated = false;
  bool _isButtonAnimated = false;
  bool _isChecked = false;

  late AnimationController _bodyTextController;
  late Animation<double> _animationBodyText;

  @override
  void initState() {
    Timer.periodic(const Duration(milliseconds: 150), (_) {
      setState(() {
        _isImageAnimated = true;
      });
    });

    _bodyTextController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animationBodyText = CurvedAnimation(
      parent: _bodyTextController,
      curve: Curves.easeIn,
    );

    Timer.periodic(const Duration(milliseconds: 350), (_) {
      _bodyTextController.forward();

      setState(() {
        _isButtonAnimated = true;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    _bodyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          body: _buildBodySplashPage(context),
        ),
      ),
    );
  }

  Widget _buildBodySplashPage(BuildContext context) => Semantics(
        label: AppLocalizations.of(context)?.semantic_label_splashpage,
        child: Container(
          padding: const EdgeInsets.all(24.0),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                K.primaryColor,
                K.secondaryColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Stack(
            children: [
              AnimatedPositioned(
                top: _isImageAnimated ? 0.0 : -500,
                left: 0.0,
                right: 0.0,
                duration: const Duration(milliseconds: 350),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 96.0, 0.0, 48.0),
                  child: Image.asset(
                    "assets/images/job_offers_welcome.png",
                    semanticLabel: AppLocalizations.of(context)
                        ?.semantic_label_image_splashpage,
                  ),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                bottom: MediaQuery.of(context).size.height * 0.33,
                child: Semantics(
                  label:
                      AppLocalizations.of(context)?.welcome_text_body_line1 ??
                          "welcome_text_body_line1",
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    pause: const Duration(milliseconds: 250),
                    animatedTexts: [
                      TypewriterAnimatedText(
                        AppLocalizations.of(context)?.welcome_text_body_line1 ??
                            "welcome_text_body_line1",
                        cursor: "",
                        speed: const Duration(milliseconds: 80),
                        textStyle: _getTextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            isAccentColor: true),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: MediaQuery.of(context).size.height * 0.18,
                left: 0.0,
                right: 0.0,
                child: FadeTransition(
                  opacity: _animationBodyText,
                  child: _richTextWidget(),
                ),
              ),
              AnimatedPositioned(
                bottom: _isButtonAnimated ? 8.0 : -500,
                left: 0.0,
                right: 0.0,
                duration: const Duration(milliseconds: 450),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Semantics(
                        label: AppLocalizations.of(context)
                            ?.semantic_label_action_explore_now,
                        child: BlocBuilder<SplashPagePrefBloc,
                            SplashPagePrefState>(
                          builder:
                              (splashPagePrefContext, splashPagePrefState) {
                            return ElevatedButton(
                              onPressed: () {
                                if (_isChecked) {
                                  splashPagePrefContext
                                      .read<SplashPagePrefBloc>()
                                      .hideSplashPageToStartup();
                                }
                                context.pushRoute(JobWrapperPageRoute(
                                    jobFreelance: widget.jobFreelance,
                                    jobHiring: widget.jobHiring));
                              },
                              child: Text(
                                AppLocalizations.of(context)
                                        ?.action_explore_now ??
                                    "action_explore_now",
                                style: const TextStyle(
                                    color: K.accentColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    _checkBoxWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  Widget _richTextWidget() => RichText(
        text: TextSpan(
          semanticsLabel:
              AppLocalizations.of(context)?.welcome_text_body_line2 ??
                  "welcome_text_body_line2",
          text: AppLocalizations.of(context)?.welcome_text_body_line2 ??
              "welcome_text_body_line2",
          style: _getTextStyle(),
          children: [
            TextSpan(
                semanticsLabel:
                    AppLocalizations.of(context)?.welcome_text_body_line3 ??
                        "welcome_text_body_line3",
                text: AppLocalizations.of(context)?.welcome_text_body_line3 ??
                    "welcome_text_body_line3",
                style: _getTextStyle(isAccentColor: true)),
            TextSpan(
                semanticsLabel:
                    AppLocalizations.of(context)?.welcome_text_body_line4 ??
                        "welcome_text_body_line4",
                text: AppLocalizations.of(context)?.welcome_text_body_line4 ??
                    "welcome_text_body_line4",
                style: _getTextStyle()),
            TextSpan(
                semanticsLabel:
                    AppLocalizations.of(context)?.welcome_text_body_line5 ??
                        "welcome_text_body_line5",
                text: AppLocalizations.of(context)?.welcome_text_body_line5 ??
                    "welcome_text_body_line5",
                style: _getTextStyle(isAccentColor: true)),
          ],
        ),
      );

  Widget _checkBoxWidget() => Semantics(
        label: AppLocalizations.of(context)
            ?.semantic_label_checkbox_hide_splashpage,
        checked: _isChecked,
        child: Row(
          children: [
            Checkbox(
              value: _isChecked,
              onChanged: (value) => setState(() {
                _isChecked = value!;
              }),
            ),
            TextShadow(
              text:
                  AppLocalizations.of(context)?.checkbox_label_hidden_screen ??
                      "checkbox_label_hidden_screen",
              color: _isChecked ? K.accentColor : Colors.white,
              fontWeight: _isChecked ? FontWeight.w500 : null,
            )
          ],
        ),
      );

  Shadow _getTextShadow() => const Shadow(
        offset: Offset(0, 1),
        blurRadius: 5.0,
        color: Color.fromARGB(150, 0, 0, 0),
      );

  TextStyle _getTextStyle({
    bool isAccentColor = false,
    double fontSize = 28.0,
    FontWeight fontWeight = FontWeight.w600,
  }) =>
      TextStyle(
        fontSize: fontSize,
        color: isAccentColor ? K.accentColor : Colors.white,
        fontWeight: FontWeight.w600,
        shadows: [_getTextShadow()],
      );
}
