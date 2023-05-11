import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/constants/routes.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/app_preferences/repositories/app_preferences_repository.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/blocs/splash_screen_bloc.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_animation.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/progress_dots.dart';
import 'package:offertelavoroflutter_app/modules/onboarding/screens/onboarding_screen/bloc/onboarding_screen_bloc.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingScreenBloc(
        appPreferencesRepository: RepositoryProvider.of<AppPreferencesRepository>(context)
      )..add(const OnboardingScreenEvent.initialized()),
      child: const _OnboardingView(),
    );
  }
}

class _OnboardingView extends StatefulWidget {
  const _OnboardingView({Key? key}) : super(key: key);

  @override
  State<_OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<_OnboardingView> with TickerProviderStateMixin {
  late List<OnboardingStep> steps;

  @override
  void dispose() {
    for(OnboardingStep step in steps) {
      step.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _initSteps();
  }

  _initSteps() {
    steps = [];

    steps.add(OnboardingStep(
      getTitle: (context) => AppLocalizations.of(context)!.onboardingStep1Title,
      getText: (context) => AppLocalizations.of(context)!.onboardingStep1Text,
      background: Styles.primaryDark,
      textColor: Colors.white,
      imageAsset: 'assets/onboarding/step-1.png',
      contentAnimationController: _createContentAnimationController(),
      imageAnimationController: _createImageAnimationController()
    ));

    steps.add(OnboardingStep(
      getTitle: (context) => AppLocalizations.of(context)!.onboardingStep2Title,
      getText: (context) => AppLocalizations.of(context)!.onboardingStep2Text,
      background: Styles.accent,
      textColor: Styles.primaryDark,
      imageAsset: 'assets/onboarding/step-2.png',
      contentAnimationController: _createContentAnimationController(),
      imageAnimationController: _createImageAnimationController()
    ));

    steps.add(OnboardingStep(
      getTitle: (context) => AppLocalizations.of(context)!.onboardingStep3Title,
      getText: (context) => AppLocalizations.of(context)!.onboardingStep3Text,
      background: Styles.primaryLight,
      textColor: Colors.white,
      imageAsset: 'assets/onboarding/step-3.png',
      contentAnimationController: _createContentAnimationController(),
      imageAnimationController: _createImageAnimationController()
    ));

    steps.add(OnboardingStep(
      getTitle: (context) => AppLocalizations.of(context)!.onboardingStep4Title,
      getText: (context) => AppLocalizations.of(context)!.onboardingStep4Text,
      background: Styles.primaryDark,
      textColor: Colors.white,
      imageAsset: 'assets/onboarding/step-4.png',
      contentAnimationController: _createContentAnimationController(),
      imageAnimationController: _createImageAnimationController()
    ));
  }

  _createImageAnimationController() {
    return AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  }

  _createContentAnimationController() {
    return AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.primaryDark,
      body: BlocConsumer<OnboardingScreenBloc, OnboardingScreenState>(
        listener: (context, state) async {
          // when we receive the first event from the bloc, we remove the splash screen
          context.read<SplashScreenBloc>().add(const SplashScreenEvent.splashRemoved());

          if(state.status == OnboardingScreenStatus.inProgress) {
            int activeStepIndex = state.activeStepIndex;
            if(activeStepIndex > 0) {
              steps[activeStepIndex - 1].animateReverse();
              await Future.delayed(const Duration(milliseconds: 450), () {});
            }
            steps[activeStepIndex].animateForward();
          } else if([OnboardingScreenStatus.finished, OnboardingScreenStatus.alreadyDone].contains(state.status)) {
            Navigator.of(context).pushReplacementNamed(Routes.home);
          }
        },
        builder: (context, state) {
          if([OnboardingScreenStatus.initial, OnboardingScreenStatus.alreadyDone].contains(state.status)) {
            return const SizedBox();
          }

          return AnimatedContainer(
            color: steps[state.activeStepIndex].background,
            duration: const Duration(milliseconds: 1000),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  _buildTitle(steps[state.activeStepIndex].textColor),
                  Expanded(child: _buildImages()),
                  _buildContentCard(state, context)
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitle(Color textColor) {
    return AnimatedDefaultTextStyle(
      style: Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),
      duration: const Duration(milliseconds: 1000),
      child: Text(AppLocalizations.of(context)!.appName, textAlign: TextAlign.center)
    );
  }

  Widget _buildImages() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.translate(
        offset: const Offset(0, 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding),
          child: Stack(
            clipBehavior: Clip.antiAlias,
            children: steps.map(_buildImage).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(OnboardingStep step) {
    return MultiAnimation(
      controller: step.imageAnimationController,
      beginOffset: const Offset(0.1, 0),
      child: Image.asset(step.imageAsset)
    );
  }

  Widget _buildContentCard(OnboardingScreenState state, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30))
      ),
      constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.57),
      padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            ProgressDots(total: state.totalSteps, activeIndex: state.activeStepIndex),
            const SizedBox(height: 20),
            Stack(
              children: steps.map(_buildContent).toList(),
            ),
            const SizedBox(height: 10),
            const Spacer(),
            ElevatedButton(
              onPressed: () => context.read<OnboardingScreenBloc>().add(const OnboardingScreenEvent.nextStepRequested()),
              style: Styles.getAccentButtonTheme(context),
              child: Text(state.hasMoreSteps ? AppLocalizations.of(context)!.onboardingButtonNext : AppLocalizations.of(context)!.onboardingButtonEnd)
            ),
            SizedBox(height: MediaQuery.of(context).viewPadding.bottom + 20),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(OnboardingStep step) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 30),
        MultiAnimation(
          controller: step.contentAnimationController,
          beginOffset: const Offset(-0.05, 0),
          endInterval: 0.6,
          child: Text(step.getTitle(context),
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
        MultiAnimation(
          controller: step.contentAnimationController,
          beginOffset: const Offset(-0.05, 0),
          beginInterval: 0.4,
          child: Text(step.getText(context),
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

class OnboardingStep {
  final String Function(BuildContext context) getTitle;
  final String Function(BuildContext context) getText;
  final Color background;
  final Color textColor;
  final String imageAsset;
  final AnimationController contentAnimationController;
  final AnimationController imageAnimationController;

  OnboardingStep({required this.getTitle, required this.getText, required this.background,
    required this.textColor, required this.imageAsset, required this.contentAnimationController,
    required this.imageAnimationController});

  animateForward() {
    imageAnimationController.forward();
    contentAnimationController.forward();
  }

  animateReverse() {
    imageAnimationController.reverse();
    contentAnimationController.reverse();
  }

  dispose() {
    imageAnimationController.dispose();
    contentAnimationController.dispose();
  }
}

