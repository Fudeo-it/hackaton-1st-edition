import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/blocs/announcement/announcement_bloc.dart';
import 'package:offertelavoroflutter/cubits/device_cubit.dart';
import 'package:offertelavoroflutter/cubits/selected_announcement_cubit.dart';
import 'package:offertelavoroflutter/extension/date_time_extension.dart';
import 'package:offertelavoroflutter/services/share_service.dart';
import 'package:offertelavoroflutter/services/utils.dart';
import 'package:offertelavoroflutter/models/formatted_text.dart';
import 'package:offertelavoroflutter/models/announcement.dart';
import 'package:offertelavoroflutter/services/launch_url_service.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:offertelavoroflutter/widgets/courtesy_widget.dart';
import 'package:offertelavoroflutter/widgets/details_announcement_page/icon_title_widget.dart';
import 'package:offertelavoroflutter/widgets/tag_widget.dart';
import 'package:offertelavoroflutter/extension/string_extension.dart';

class DetailsAnnouncementPage extends StatelessWidget {
  static const route = '/job/announcement/details';

  const DetailsAnnouncementPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<SelectedAnnouncementCubit, Announcement?>(
        builder: (context, announcement) {
          if (announcement != null) {
            return Scaffold(
              appBar: _appBar(
                context,
                announcement: announcement,
              ),
              body: _body(
                context,
                announcement: announcement,
              ),
            );
          }
          return _noSelectedBody(context);
        },
      );

  Widget _body(
    BuildContext context, {
    required Announcement announcement,
  }) =>
      BlocBuilder<DeviceCubit, DeviceType>(
        builder: (context, deviceType) {
          return GestureDetector(
            onTap: deviceType == DeviceType.table
                ? () => Navigator.of(context).pushNamed(route)
                : null,
            child: Stack(
              children: [
                _announcement(
                  context,
                  announcement: announcement,
                ),
                _applyNowButton(
                  context,
                  howToAppy: announcement.howToApply,
                  announcementTitle: announcement.title,
                )
              ],
            ),
          );
        },
      );

  Widget _applyNowButton(
    BuildContext context, {
    required FormattedText howToAppy,
    required String announcementTitle,
  }) =>
      Positioned(
        bottom: 15,
        right: 36,
        left: 36,
        child: FilledButton(
          onPressed: () => Utils.jobApplyNow(
            context,
            formattedText: howToAppy,
            emailSubject: announcementTitle,
          ),
          child: const Text(
            'Candidati ora',
          ),
        ),
      );

  Widget _announcement(
    BuildContext context, {
    required Announcement announcement,
  }) =>
      ListView(
        padding: const EdgeInsets.symmetric(
          vertical: MyInsets.scaffoldVerticalPadding,
          horizontal: MyInsets.scaffoldHorizonatalPadding,
        ),
        children: [
          _companyName(
            context,
            companyName: announcement.companyName,
          ),
          _title(
            context,
            title: announcement.title,
          ),
          if (!announcement.location.isNullOrEmpty)
            _location(
              context,
              location: announcement.location!,
            ),
          if (announcement.team != null)
            _team(
              context,
              team: announcement.team.toString(),
            ),
          if (!announcement.webSiteUrl.isNullOrEmpty)
            _webSite(
              context,
              url: announcement.webSiteUrl!,
            ),
          if (!announcement.salary.isNullOrEmpty)
            _salary(
              context,
              salary: announcement.salary!,
            ),
          if (announcement.contract != null)
            _contract(
              context,
              contract: announcement.contract.toString(),
            ),
          if (announcement.seniority != null)
            _seniority(
              context,
              seniority: announcement.seniority.toString(),
            ),
          _jobPosted(
            context,
            date: announcement.postedOn.formatted,
          ),
          _description(
            context,
            descriptions: announcement.desription,
          ),
          const SizedBox(
            height: 52,
          ),
        ],
      );

  Widget _companyName(
    BuildContext context, {
    required String companyName,
  }) =>
      Text(
        companyName,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      );

  Widget _salary(
    BuildContext context, {
    required String salary,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.dollarSign,
        subTitle: salary,
        title: 'Stipendio',
      );

  Widget _contract(
    BuildContext context, {
    required String contract,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.clock,
        subTitle: contract,
        title: 'Contratto',
      );
  Widget _seniority(
    BuildContext context, {
    required String seniority,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.solidCircleUser,
        subTitle: seniority,
        title: 'Seniority',
      );

  Widget _webSite(
    BuildContext context, {
    required String url,
  }) =>
      GestureDetector(
        onTap: () => LaunchUrlService.launchWebUrl(url),
        child: IconTitleWidget(
          icon: FontAwesomeIcons.globe,
          subTitle: Uri.parse(url).authority,
          title: 'Sito web',
        ),
      );

  Widget _team(
    BuildContext context, {
    required String team,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: MyInsets.s),
        child: UnconstrainedBox(
          alignment: Alignment.topLeft,
          child: TagWidget(
            color: Theme.of(context).colorScheme.primary,
            text: team,
          ),
        ),
      );

  Widget _title(
    BuildContext context, {
    required String title,
  }) =>
      Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      );

  Widget _location(
    BuildContext context, {
    required String location,
  }) =>
      UnconstrainedBox(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(top: MyInsets.xs),
          child: TagWidget(
            color: Theme.of(context).colorScheme.tertiary,
            icon: Icons.location_on_outlined,
            text: location,
          ),
        ),
      );

  PreferredSizeWidget _appBar(
    BuildContext context, {
    required Announcement announcement,
  }) =>
      AppBar(
        title: Text(announcement.companyName),
        actions: [
          IconButton(
            onPressed: () => ShareService.share(
              announcement.url,
              subject: announcement.name,
            ),
            icon: Icon(
              Icons.share,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
          IconButton(
            onPressed: () {
              context.read<AnnouncementBloc>().toogleFavoriteAnnouncement(
                    id: announcement.id,
                  );
              context.read<SelectedAnnouncementCubit>().select(
                    announcement.copyWith(
                      favorite: !announcement.favorite,
                    ),
                  );
            },
            icon: Icon(
              announcement.favorite
                  ? FontAwesomeIcons.solidBookmark
                  : FontAwesomeIcons.bookmark,
              color: Theme.of(context).colorScheme.tertiary,
            ),
          ),
        ],
      );

  Widget _description(
    BuildContext context, {
    required List<FormattedText> descriptions,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: MyInsets.l),
        child: RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.bodySmall,
            children: descriptions
                .map(
                  (e) => TextSpan(
                    text: e.text,
                    style: TextStyle(
                      fontWeight: e.fontWeight,
                      fontStyle: e.fontStyle,
                      decoration: e.decoration,
                    ),
                  ),
                )
                .toList(growable: false),
          ),
        ),
      );

  Widget _jobPosted(
    BuildContext context, {
    required String date,
  }) =>
      IconTitleWidget(
        icon: FontAwesomeIcons.calendar,
        subTitle: date,
        title: 'Pubblicato il',
      );

  Widget _noSelectedBody(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const CourtesyWidget(
          title: 'Nessun annuncio selezionato',
          icon: FontAwesomeIcons.faceFrownOpen,
        ),
      );
}
