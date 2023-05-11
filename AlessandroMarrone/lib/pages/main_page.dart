import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:offertelavoroflutter_it_app/blocs/job_offers/job_offers_bloc.dart';
import 'package:offertelavoroflutter_it_app/blocs/job_projects/job_projects_bloc.dart';
import 'package:offertelavoroflutter_it_app/blocs/splash_page_pref/splash_page_pref_bloc.dart';
import 'package:offertelavoroflutter_it_app/router/app_router.gr.dart';
import 'package:offertelavoroflutter_it_app/widgets/logo_fudeo_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/text_shadow.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashPagePrefBloc, SplashPagePrefState>(
      builder: (splashPagePrefContext, splashPagePrefState) {
        return BlocBuilder<JobProjectsBloc, JobProjectsState>(
          builder: (jobProjectsContext, jobProjectsState) =>
              BlocBuilder<JobOffersBloc, JobOffersState>(
            builder: (jobOffersContext, jobOffersState) {
              if ((jobProjectsState is NoJobProjectsFetched ||
                      jobProjectsState is JobProjectsFetched) &&
                  (jobOffersState is NoJobOffersFetched ||
                      jobOffersState is JobOffersFetched)) {
                if (splashPagePrefState is UndefinedSplashPagePrefState ||
                    (splashPagePrefState as LoadedSplashPagePrefState)
                        .showSplashPage) {
                  _replacePage(
                    context,
                    SplashPageRoute(
                      jobHiring: (jobOffersState as JobOffersFetched).jobs,
                      jobFreelance:
                          (jobProjectsState as JobProjectsFetched).jobs,
                    ),
                  );
                } else {
                  _replacePage(
                    context,
                    JobWrapperPageRoute(
                      jobHiring: (jobOffersState as JobOffersFetched).jobs,
                      jobFreelance:
                          (jobProjectsState as JobProjectsFetched).jobs,
                    ),
                  );
                }
              }
              return const SafeArea(
                child: Scaffold(
                  extendBodyBehindAppBar: true,
                  body: _LoadingMainWidget(),
                ),
              );
            },
          ),
        );
      },
    );
  }

  Future<void> _replacePage(BuildContext context, PageRouteInfo route) async {
    //context.router.popUntilRoot();
    await context.pushRoute(route);
  }
}

class _LoadingMainWidget extends StatefulWidget {
  const _LoadingMainWidget({Key? key}) : super(key: key);

  @override
  State<_LoadingMainWidget> createState() => _LoadingMainWidgetState();
}

class _LoadingMainWidgetState extends State<_LoadingMainWidget>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _logoController;
  late AnimationController _loadingController;

  @override
  void initState() {
    _logoController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _animation = Tween<double>(begin: 50, end: 200).animate(_logoController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _logoController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _logoController.forward();
        }
      });

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    _loadingController.repeat();
    _logoController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: K.primaryColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    ));
    return Container(
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
          Positioned(
            top: 100.0,
            left: 0.0,
            right: 0.0,
            child: ExcludeSemantics(
                child: _AnimatedFlutterLogo(animation: _animation)),
          ),
          Align(
            alignment: Alignment.center,
            child: Semantics(
              label:
                  AppLocalizations.of(context)?.semantic_label_loading_mainpage,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextShadow(
                    text: AppLocalizations.of(context)?.text_loading ??
                        "text_loading",
                    color: K.accentColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12.0,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: SpinKitThreeBounce(
                      size: 20,
                      color: K.accentColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  TextShadow(
                    text: AppLocalizations.of(context)?.text_portal ??
                        "text_portal",
                    semanticsLabel: AppLocalizations.of(context)?.text_portal ??
                        "text_portal",
                    color: K.accentColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const LogoFudeoWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedFlutterLogo extends AnimatedWidget {
  const _AnimatedFlutterLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: animation.value,
        height: animation.value,
        child: const FlutterLogo(),
      ),
    );
  }
}
