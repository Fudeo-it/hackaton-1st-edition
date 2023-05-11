import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmark_save_cubit.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmarks_retrieve/bookmarks_retrieve_cubit.dart';
import 'package:offertelavoroflutter_it_app/cubits/share_job_cubit.dart';
import 'package:offertelavoroflutter_it_app/models/job_project/job_project_model.dart';
import 'package:offertelavoroflutter_it_app/models/share_job_model.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/router/app_router.gr.dart';
import 'package:offertelavoroflutter_it_app/services/network/url_launch_service.dart';
import 'package:offertelavoroflutter_it_app/utilities/costants.dart';
import 'package:offertelavoroflutter_it_app/utilities/enums.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/app_localizations_no_context.dart';
import 'package:offertelavoroflutter_it_app/utilities/extensions/get_system_ui_overlay.dart';
import 'package:offertelavoroflutter_it_app/widgets/auto_size_text_widget.dart';
import 'package:offertelavoroflutter_it_app/widgets/header_sliver_appbar.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';

class JobFreelanceDetailsScreen extends StatefulWidget {
  final JobProjectModel jobFreelance;
  const JobFreelanceDetailsScreen({Key? key, required this.jobFreelance})
      : super(key: key);

  @override
  State<JobFreelanceDetailsScreen> createState() =>
      _JobFreelanceDetailsScreenState();
}

class _JobFreelanceDetailsScreenState extends State<JobFreelanceDetailsScreen> {
  final GlobalKey<CircularMenuState> _circularMenukey =
      GlobalKey<CircularMenuState>();
  bool _isOpenedShareMenu = false;

  void _jobApply() {
    final urlToApply = widget.jobFreelance.projectDetails.howToApply!.text;

    if (urlToApply.substring(0, 8) == K.https ||
        urlToApply.substring(0, 8) == K.http) {
      context.router.push(JobApplyPageRoute(url: urlToApply));
    } else {
      final splittedString = urlToApply.split(" ");
      final emailToApply =
          splittedString.firstWhere((element) => element.contains("@"));

      context.read<UrlLauunchService>().openMailClient(
          emailToApply, widget.jobFreelance.projectDetails.jobTitle!.text);
    }
  }

  void _onButtonTap(ShareType share) {
    final data = ShareJobModel(
      msg:
          "${AppLocalizations.of(context)?.text_sharing_job ?? "text_sharing_job"} \n ${widget.jobFreelance.projectDetails.jobTitle?.text}",
      url: widget.jobFreelance.postUrl,
    );

    context.read<ShareJobCubit>().shareJob(share, data: data);

    _circularMenukey.currentState?.reverseAnimation();
    setState(() {
      _isOpenedShareMenu = !_isOpenedShareMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        GetSystemUIOverlay.getSystemUIOverlayStyle(context));
    return BlocProvider<BookmarkSaveCubit>(
      create: (context) => BookmarkSaveCubit(
        jobRepository: context.read<JobRepository>(),
      )..checkBookmark(widget.jobFreelance.id),
      child: SafeArea(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: _buildJobDetailsWrapper,
        ),
      ),
    );
  }

  Widget get _buildJobDetails => Stack(children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            HeaderSliverAppbar(
              pinned: true,
              leading: IconItem(
                onTap: () => context.router.pop(),
                icon: LucideIcons.chevronLeft,
                paddingHorizontal: 16.0,
              ),
              title: AppLocalizations.of(context)?.title_job_details ??
                  "title_job_details",
              actions: [
                BlocBuilder<BookmarkSaveCubit, bool>(
                  builder: (context, isSaved) {
                    return IconItem(
                      onTap: () => isSaved
                          ? context
                              .read<BookmarkSaveCubit>()
                              .deleteBookmark(widget.jobFreelance.id)
                          : context
                              .read<BookmarkSaveCubit>()
                              .saveBookmark(widget.jobFreelance.id),
                      icon: LucideIcons.bookmarkMinus,
                      paddingHorizontal: 16.0,
                      isTapped: isSaved,
                    );
                  },
                ),
              ],
            ),
            _buildHeaderDetailsJob,
            _buildSummaryJobWidget,
            _buildBodyDetailsJob,
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0.0,
          left: 0.0,
          right: 0.0,
          child: _buildApplyWidget,
        ),
      ]);

  Widget get _buildHeaderDetailsJob => SliverAppBar(
        floating: true,
        toolbarHeight: 80.0,
        automaticallyImplyLeading: false,
        expandedHeight: MediaQuery.of(context).size.height * 0.30,
        flexibleSpace: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                _buildFlutterLogo,
                _buildJobPosition,
              ],
            ),
          ),
        ),
      );

  Widget get _buildBodyDetailsJob => SliverToBoxAdapter(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
            child: Column(
              children: [
                _BuildSectionDetail(
                  titleSection: AppLocalizations.of(context)
                          ?.section_title_job_descproject ??
                      "section_title_job_descproject",
                  expanded: _expandedJobDescription,
                  controller: ExpandableController(initialExpanded: true),
                ),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection: AppLocalizations.of(context)
                            ?.section_title_job_requirement ??
                        "section_title_job_requirement",
                    expanded: _expandedJobRequirement),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection: AppLocalizations.of(context)
                            ?.section_title_job_relationship ??
                        "section_title_job_relationship",
                    expanded: _expandedJobRelationship),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection: AppLocalizations.of(context)
                            ?.section_title_job_timing ??
                        "section_title_job_timing",
                    expanded: _expandedJobTiming),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection: AppLocalizations.of(context)
                            ?.section_title_job_posted ??
                        "section_title_job_posted",
                    expanded: _expandedJobCreated),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection: AppLocalizations.of(context)
                            ?.section_title_job_budget ??
                        "section_title_job_budget",
                    expanded: _expandedJobBudget),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection: AppLocalizations.of(context)
                            ?.section_title_job_paymenttiming ??
                        "section_title_job_paymenttiming",
                    expanded: _expandedJobPaymentTiming),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection:
                        AppLocalizations.of(context)?.section_title_job_nda ??
                            "section_title_job_nda",
                    expanded: _expandedJobNDA),
                const SizedBox(height: 8.0),
                _BuildSectionDetail(
                    titleSection: AppLocalizations.of(context)
                            ?.section_title_job_howtoapply ??
                        "section_title_job_howtoapply",
                    expanded: _expandedJobHowApply),
              ],
            ),
          ),
        ),
      );

  Widget get _buildFlutterLogo => const FlutterLogo(size: 100);

  Widget get _buildJobPosition => AutoSizeTextWidget(
        widget.jobFreelance.projectDetails.jobTitle?.text ??
            widget.jobFreelance.projectDetails.jobTitle?.text.split("|")[0] ??
            AppLocalizations.of(context)?.text_empty_item ??
            "text_empty_item",
        textAlign: TextAlign.center,
        minFontSize: 10.0,
        maxFontSize: 16.0,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: K.secondaryColor,
        ),
      );

  Widget get _buildSummaryJobWidget => SliverAppBar(
        pinned: true,
        scrolledUnderElevation: 10.0,
        toolbarHeight: 130.0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBudget,
            _buildNDA,
            _buildRelationship,
          ],
        ),
      );

  Widget get _buildRelationship => Expanded(
        child: Column(
          children: [
            const IconItem(icon: LucideIcons.network),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.jobFreelance.projectDetails.employRelationship?.text ??
                  AppLocalizations.of(context)?.text_empty_item ??
                  "text_empty_item"
                      "",
              maxLines: 3,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: K.secondaryColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      );

  Widget get _buildBudget => Expanded(
        child: Column(
          children: [
            const IconItem(icon: LucideIcons.coins),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              // TODO: scommentare appena ci sono annunci reali
              "€ 70/ora" /*widget.jobFreelance.projectDetails.jobBudget?.text ??
                  AppLocalizations.of(context)?.text_empty_item ??
                  "text_empty_item"*/
              ,
              style: const TextStyle(color: K.secondaryColor, fontSize: 14.0),
            ),
          ],
        ),
      );

  Widget get _buildNDA => Expanded(
        child: Column(
          children: [
            const IconItem(icon: LucideIcons.venetianMask),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              widget.jobFreelance.projectDetails.nda?.text ??
                  AppLocalizations.of(context)?.text_empty_item ??
                  "text_empty_item",
              style: const TextStyle(color: K.secondaryColor, fontSize: 14.0),
            ),
          ],
        ),
      );

  Widget get _buildApplyWidget => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        height: 90,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconItem(
              icon: LucideIcons.share2,
              isTapped: _isOpenedShareMenu,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed:
                      widget.jobFreelance.projectDetails.howToApply?.text ==
                              null
                          ? null
                          : _jobApply,
                  style: widget.jobFreelance.projectDetails.howToApply?.text ==
                          null
                      ? ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              K.secondaryColor.withOpacity(0.10)))
                      : null,
                  child: Text(
                    AppLocalizations.of(context)?.action_apply_now ??
                        "action_apply_now",
                    style: TextStyle(
                        color: widget.jobFreelance.projectDetails.howToApply
                                    ?.text ==
                                null
                            ? Colors.grey
                            : K.accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  Widget get _buildJobDetailsWrapper => CircularMenu(
        alignment: Alignment.bottomLeft,
        backgroundWidget: _buildJobDetails,
        startingAngleInRadian: 1.5 * pi,
        endingAngleInRadian: 1.84 * pi,
        radius: 150,
        curve: Curves.easeInOutCirc,
        key: _circularMenukey,
        toggleButtonColor: Colors.transparent,
        toggleButtonIconColor: Colors.transparent,
        toggleButtonOnPressed: () => setState(() {
          _isOpenedShareMenu = !_isOpenedShareMenu;
        }),
        items: [
          CircularMenuItem(
            icon: LucideIcons.facebook,
            onTap: () => _onButtonTap(ShareType.facebook),
            color: K.primaryColor,
            iconColor: K.accentColor,
            iconSize: 24.0,
          ),
          CircularMenuItem(
            color: K.primaryColor,
            onTap: () => _onButtonTap(ShareType.twitter),
            icon: LucideIcons.twitter,
            iconColor: K.accentColor,
            iconSize: 24.0,
          ),
          CircularMenuItem(
            color: K.primaryColor,
            onTap: () => _onButtonTap(ShareType.whatsapp),
            icon: LucideIcons.messageCircle,
            iconColor: K.accentColor,
            iconSize: 24.0,
          ),
          CircularMenuItem(
            color: K.primaryColor,
            onTap: () => _onButtonTap(ShareType.share_system),
            icon: LucideIcons.monitorSmartphone,
            iconColor: K.accentColor,
            iconSize: 24.0,
          ),
        ],
      );

  Widget get _expandedJobDescription => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: widget
                .jobFreelance.projectDetails.jobDescription!.descriptionItems
                .map(
                  (item) => TextSpan(
                    text: item.text,
                    style: item.style,
                  ),
                )
                .toList(),
          ),
        ),
      );

  Widget get _expandedJobRequirement => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            children: widget
                .jobFreelance.projectDetails.jobRequirement.descriptionItems
                .map(
                  (item) => TextSpan(
                    text: item.text,
                    style: item.style,
                  ),
                )
                .toList(),
          ),
        ),
      );

  Widget get _expandedJobRelationship => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _buildSectionWidget(
            text: widget.jobFreelance.projectDetails.employRelationship?.text,
            color: widget
                .jobFreelance.projectDetails.employRelationship?.sectionColor),
      );

  Widget get _expandedJobTiming => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          widget.jobFreelance.projectDetails.timing?.text ??
              AppLocalizations.of(context)?.text_empty_item ??
              "text_empty_item",
          style: widget.jobFreelance.projectDetails.timing?.style,
        ),
      );

  Widget get _expandedJobBudget => Text(
        widget.jobFreelance.projectDetails.jobBudget?.text ??
            AppLocalizations.of(context)?.text_empty_item ??
            "text_empty_item",
        style: widget.jobFreelance.projectDetails.jobBudget?.style,
      );

  Widget get _expandedJobPaymentTiming => Text(
        widget.jobFreelance.projectDetails.paymentTimes?.text ??
            AppLocalizations.of(context)?.text_empty_item ??
            "text_empty_item",
        style: widget.jobFreelance.projectDetails.paymentTimes?.style,
      );

  Widget get _expandedJobNDA => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _buildSectionWidget(
            text: widget.jobFreelance.projectDetails.nda?.text,
            color: widget.jobFreelance.projectDetails.nda?.sectionColor),
      );

  Widget get _expandedJobCreated => Text(DateFormat(DateFormat.YEAR_MONTH_DAY,
          AppLocalizationsNoContext.current.localeName)
      .format(widget.jobFreelance.projectDetails.jobCreatedTime.created));

  Widget get _expandedJobHowApply =>
      Text(widget.jobFreelance.projectDetails.howToApply?.text ??
          AppLocalizations.of(context)?.text_empty_item ??
          "text_empty_item");

  Widget _buildSectionWidget({String? text, Color? color}) => Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
          color: color?.withOpacity(0.10) ?? Colors.transparent,
        ),
        child: Text(text ??
            AppLocalizations.of(context)?.text_empty_item ??
            "text_empty_item"),
      );
}

class _BuildSectionDetail extends StatelessWidget {
  final String titleSection;
  final bool? isExpanded;
  final Widget? collapsed;
  final Widget expanded;
  ExpandableController? controller;

  _BuildSectionDetail(
      {Key? key,
      required this.titleSection,
      required this.expanded,
      this.isExpanded,
      this.collapsed,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      controller: controller,
      header: Text(
        titleSection,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      collapsed: collapsed ?? Container(),
      expanded: expanded,
    );
  }
}
