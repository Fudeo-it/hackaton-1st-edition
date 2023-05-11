import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_it_app/models/job_offer/job_offer_model.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/job_freelance_details_screen.dart';
import 'package:offertelavoroflutter_it_app/pages/screens/job_offer_details_screen.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/get_system_ui_overlay.dart';
import 'package:offertelavoroflutter_it_app/widgets/blog_post_content.dart';
import 'package:offertelavoroflutter_it_app/widgets/cards/job_info_mini_card.dart';
import 'package:offertelavoroflutter_it_app/widgets/cards/job_project_mini_card.dart';
import 'package:offertelavoroflutter_it_app/widgets/header_sliver_appbar.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';
import 'package:offertelavoroflutter_it_app/widgets/open_container_wrapper.dart';
import 'package:offertelavoroflutter_it_app/widgets/search_sliver_bar.dart';

class JobOffersScreen extends StatelessWidget {
  final List<JobOfferModel>? jobHiring;
  final List<JobProjectModel>? jobFreelance;
  const JobOffersScreen({Key? key, this.jobHiring, this.jobFreelance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        GetSystemUIOverlay.getSystemUIOverlayStyle(context));
    return SafeArea(
      child: DefaultTabController(
        length: _getTabs().length,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: _buildBodyScreen(context),
        ),
      ),
    );
  }

  Widget _buildBodyScreen(BuildContext context) => Column(
        children: [
          Expanded(
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                HeaderSliverAppbar(
                  title:
                      AppLocalizations.of(context)?.title_job_offers_screen ??
                          "title_job_offers_screen",
                  actions: const [
                    IconItem(
                      icon: LucideIcons.refreshCw,
                      paddingHorizontal: 16.0,
                    ),
                  ],
                ),
                const SearchSliverBar(),
                const BlogPostContent(),
                SliverAppBar(
                  // tab container
                  automaticallyImplyLeading: false,
                  scrolledUnderElevation: 10,
                  elevation: 0.0,
                  pinned: true,
                  titleSpacing: 0.0,
                  leadingWidth: 0.0,
                  backgroundColor: Colors.white,
                  bottom: PreferredSize(
                    preferredSize: const Size(100, 0.0),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32.0),
                      decoration: BoxDecoration(
                        color: K.secondaryColor.withOpacity(0.10),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TabBar(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          indicator: BoxDecoration(
                            color: K.primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: _getTabs(),
                        ),
                      ),
                    ),
                  ),
                )
              ],
              body: Container(
                padding: const EdgeInsets.all(8.0),
                child: TabBarView(
                  physics: const BouncingScrollPhysics(),
                  children: _getTabContents(),
                ),
              ),
            ),
          ),
        ],
      );

  List<Widget> _getTabs() {
    List<String> tabNames = [
      AppLocalizationsNoContext.current.title_tab_jobs,
      AppLocalizationsNoContext.current.title_tab_projects,
    ];

    List<Widget> tabs = [];

    for (final tabName in tabNames) {
      tabs.add(
        Text(
          tabName,
        ),
      );
    }

    return tabs;
  }

  List<Widget> _getTabContents() {
    return [
      _HiringListWidget(
        jobHiring: jobHiring,
      ),
      _FreelanceListWidget(
        jobFreelance: jobFreelance,
      ),
    ];
  }
}

class _HiringListWidget extends StatelessWidget {
  final List<JobOfferModel>? jobHiring;
  const _HiringListWidget({Key? key, this.jobHiring}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return jobHiring != null && jobHiring!.isNotEmpty
        ? GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size < 350 ? 1 : 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: size < 350 ? 2 / 1 : 4 / 3,
            ),
            itemBuilder: (context, index) => OpenContainerWrapper(
              closedBuilder: (context, openContainer) => JobInfoMiniCard(
                jobHiring: jobHiring![index],
                openContainer: openContainer,
              ),
              transitionType: ContainerTransitionType.fadeThrough,
              child: JobOfferDetailsScreen(
                jobHiring: jobHiring![index],
              ),
            ),
            itemCount: jobHiring!.length,
          )
        : const _NoJobsWidget();
  }
}

class _FreelanceListWidget extends StatelessWidget {
  final List<JobProjectModel>? jobFreelance;
  const _FreelanceListWidget({Key? key, this.jobFreelance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;

    return jobFreelance != null && jobFreelance!.isNotEmpty
        ? GridView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: size < 350 ? 1 : 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: size < 350 ? 2 / 1 : 4 / 3,
            ),
            itemBuilder: (context, index) => OpenContainerWrapper(
              closedBuilder: (context, openContainer) => JobProjectMiniCard(
                jobProject: jobFreelance![index],
                openContainer: openContainer,
              ),
              transitionType: ContainerTransitionType.fadeThrough,
              child: JobFreelanceDetailsScreen(
                jobFreelance: jobFreelance![index],
              ),
            ),
            itemCount: jobFreelance!.length,
          )
        : const _NoJobsWidget();
  }
}

class _NoJobsWidget extends StatelessWidget {
  const _NoJobsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(AppLocalizations.of(context)?.text_no_jobs_available ??
          "text_no_jobs_available"),
    );
  }
}
