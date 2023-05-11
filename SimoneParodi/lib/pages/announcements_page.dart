import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/blocs/announcement/announcement_bloc.dart';
import 'package:offertelavoroflutter/cubits/favorite_mode_cubit.dart';
import 'package:offertelavoroflutter/models/announcement.dart';
import 'package:offertelavoroflutter/services/utils.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:offertelavoroflutter/widgets/courtesy_widget.dart';
import 'package:offertelavoroflutter/widgets/announcement_page/announcement_item.dart';
import 'package:offertelavoroflutter/widgets/loading/shimmer_list.dart';

class AnnouncementPage extends StatelessWidget {
  static const route = '/job/announcement';
  const AnnouncementPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (context, state) {
        if (state is FetchedAnnouncementState) {
          return _announcementsList(
            context,
            announcements: state.announcements,
          );
        } else if (state is NoAnnouncementState) {
          return _noAnnouncement(context);
        } else if (state is ErrorAnnouncementState) {
          return _error(context, errorType: state.type);
        }
        return _loading();
      },
    );
  }

  Widget _announcementsList(
    BuildContext context, {
    required List<Announcement> announcements,
  }) =>
      RefreshIndicator(
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          context.read<AnnouncementBloc>().onFetch();
        },
        child: ListView.builder(
          padding: const EdgeInsets.only(
            top: MyInsets.scaffoldVerticalPadding,
            bottom: MyInsets.scaffoldBottomPaddingWithBubble,
            left: MyInsets.scaffoldHorizonatalPadding,
            right: MyInsets.scaffoldHorizonatalPadding,
          ),
          itemCount: announcements.length,
          itemBuilder: (builder, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: MyInsets.m),
            child: AnnouncementItem(
              announcement: announcements[index],
            ),
          ),
        ),
      );

  Widget _noAnnouncement(BuildContext context) =>
      BlocBuilder<FavoriteModeCubit, bool>(
        builder: (context, favoriteMode) {
          return CourtesyWidget(
            title: favoriteMode
                ? 'Nessun annuncio di lavoro salvato nei preferiti'
                : 'Nessun annuncio di lavoro',
            icon: FontAwesomeIcons.faceFrownOpen,
          );
        },
      );

  Widget _error(
    BuildContext context, {
    required ErrorType errorType,
  }) {
    switch (errorType) {
      case ErrorType.local:
        return CourtesyWidget.localError();
      case ErrorType.newtwork:
        return CourtesyWidget.networkError();
      case ErrorType.repository:
        return CourtesyWidget.repositoryError();
      case ErrorType.noConnectivity:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CourtesyWidget.noConnectivity(),
            TextButton(
              onPressed: () => context.read<AnnouncementBloc>().onFetch(),
              child: const Text(
                'Ricarica',
              ),
            ),
          ],
        );
    }
  }

  Widget _loading() => Padding(
        padding: const EdgeInsets.only(top: MyInsets.scaffoldVerticalPadding),
        child: ShimmerList(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: MyInsets.m),
            child: AnnouncementItem.shimmer(),
          ),
        ),
      );
}
