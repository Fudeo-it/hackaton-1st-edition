import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/blocs/announcement/announcement_bloc.dart';
import 'package:offertelavoroflutter/cubits/device_cubit.dart';
import 'package:offertelavoroflutter/cubits/selected_announcement_cubit.dart';
import 'package:offertelavoroflutter/extension/string_extension.dart';
import 'package:offertelavoroflutter/models/announcement.dart';
import 'package:offertelavoroflutter/pages/details_announcement_page.dart';
import 'package:offertelavoroflutter/services/share_service.dart';
import 'package:offertelavoroflutter/services/utils.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:offertelavoroflutter/themes/my_theme.dart';
import 'package:offertelavoroflutter/widgets/job_offer_item.dart';
import 'package:offertelavoroflutter/widgets/tag_widget.dart';

class AnnouncementItem extends StatelessWidget {
  final Announcement? announcement;
  const AnnouncementItem({
    required this.announcement,
    super.key,
  });

  factory AnnouncementItem.shimmer() =>
      const AnnouncementItem(announcement: null);

  void onFavorite(BuildContext context) {
    context
        .read<AnnouncementBloc>()
        .toogleFavoriteAnnouncement(id: announcement!.id);
    context.read<SelectedAnnouncementCubit>().select(
          announcement!.copyWith(
            favorite: !announcement!.favorite,
          ),
        );
  }

  void onShare() => ShareService.share(
        announcement!.url,
        subject: announcement!.name,
      );
  void onTap(
    BuildContext context, {
    required bool isPhone,
  }) {
    context.read<SelectedAnnouncementCubit>().select(announcement!);
    if (isPhone) {
      Navigator.of(context).pushNamed(DetailsAnnouncementPage.route);
    }
  }

  @override
  Widget build(BuildContext context) => announcement == null
      ? JobOfferItem.shimmer(
          child: _shimmerBody(),
        )
      : BlocBuilder<DeviceCubit, DeviceType>(
          builder: (context, deviceType) {
            return JobOfferItem(
              onTap: () => onTap(
                context,
                isPhone: deviceType == DeviceType.phone,
              ),
              onShare: () => onShare(),
              onFavorite: () => onFavorite(context),
              isFavorite: announcement!.favorite,
              child: _body(context),
            );
          },
        );

  Widget _body(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _companyName(context),
          _title(context),
          if (!announcement!.salary.isNullOrEmpty) _salary(context),
          if (!announcement!.location.isNullOrEmpty) _location(context),
          _tags(context)
        ],
      );

  Widget _companyName(BuildContext context) => Text(
        announcement!.companyName,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );

  Widget _title(BuildContext context) => Text(
        announcement!.title,
        style: Theme.of(context).textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );

  Widget _location(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: MyInsets.s),
        child: TagWidget(
          color: Theme.of(context).colorScheme.tertiary,
          icon: Icons.location_on_outlined,
          text: announcement!.location!,
        ),
      );

  Widget _salary(BuildContext context) => Row(
        children: [
          Icon(
            Icons.attach_money,
            color: Theme.of(context).colorScheme.secondary,
            size: 14,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: MyInsets.xs),
              child: Text(
                announcement!.salary!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      );

  Widget _tags(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: MyInsets.s),
        child: Wrap(
          children: [
            if (announcement!.team != null)
              TagWidget(
                color: Theme.of(context).colorScheme.primary,
                text: announcement!.team.toString(),
              ),
            if (announcement!.contract != null)
              TagWidget(
                color: Theme.of(context).colorScheme.primary,
                text: announcement!.contract.toString(),
              ),
            if (announcement!.seniority != null)
              TagWidget(
                color: Theme.of(context).colorScheme.primary,
                text: announcement!.seniority.toString(),
              ),
          ],
        ),
      );

  Widget _shimmerBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.shimmerContainer(const Size(200, 36)),
        MyInsets.placeholderPaddingForShimmer,
        Utils.shimmerContainer(const Size(120, 20)),
        MyInsets.placeholderPaddingForShimmer,
        TagWidget(
          text: 'Località',
          color: MyTheme.placeholderColorForShimmer,
          icon: Icons.location_on_outlined,
        ),
        MyInsets.placeholderPaddingForShimmer,
        Row(
          children: [
            TagWidget(
              text: 'Team',
              color: MyTheme.placeholderColorForShimmer,
            ),
            TagWidget(
              text: 'Contratto',
              color: MyTheme.placeholderColorForShimmer,
            ),
            TagWidget(
              text: 'Seniority',
              color: MyTheme.placeholderColorForShimmer,
            ),
          ],
        ),
      ],
    );
  }
}
