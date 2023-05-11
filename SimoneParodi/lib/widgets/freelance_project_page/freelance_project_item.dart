import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/blocs/freelance_project/freelance_project_bloc.dart';
import 'package:offertelavoroflutter/cubits/device_cubit.dart';
import 'package:offertelavoroflutter/cubits/selected_freelance_project_cubit.dart';
import 'package:offertelavoroflutter/extension/string_extension.dart';
import 'package:offertelavoroflutter/models/freelance_project.dart';
import 'package:offertelavoroflutter/pages/details_freelance_project_page.dart';
import 'package:offertelavoroflutter/services/share_service.dart';
import 'package:offertelavoroflutter/services/utils.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:offertelavoroflutter/themes/my_theme.dart';
import 'package:offertelavoroflutter/widgets/job_offer_item.dart';
import 'package:offertelavoroflutter/widgets/tag_widget.dart';

class FreelanceProjectItem extends StatelessWidget {
  final FreelanceProject? freelanceProject;
  const FreelanceProjectItem({
    required this.freelanceProject,
    super.key,
  });

  factory FreelanceProjectItem.shimmer() =>
      const FreelanceProjectItem(freelanceProject: null);

  void onFavorite(BuildContext context) {
    context
        .read<FreelanceProjectBloc>()
        .toogleFavoriteFreelanceProject(id: freelanceProject!.id);
    context.read<SelectedFreelanceProjectCubit>().select(
          freelanceProject!.copyWith(
            favorite: !freelanceProject!.favorite,
          ),
        );
  }

  void onShare() => ShareService.share(
        freelanceProject!.url,
        subject: freelanceProject!.title,
      );
  void onTap(
    BuildContext context, {
    required bool isPhone,
  }) {
    context.read<SelectedFreelanceProjectCubit>().select(freelanceProject!);
    if (isPhone) {
      Navigator.of(context).pushNamed(DetailsFreelanceProjectPage.route);
    }
  }

  @override
  Widget build(BuildContext context) => freelanceProject == null
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
              isFavorite: freelanceProject!.favorite,
              child: _body(context),
            );
          },
        );

  Widget _body(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(context),
          if (!freelanceProject!.budget.isNullOrEmpty) _budget(context),
          if (!freelanceProject!.timing.isNullOrEmpty) _timing(context),
          if (freelanceProject!.isNda) _nda(context)
        ],
      );

  Widget _title(BuildContext context) => Text(
        freelanceProject!.title,
        style: Theme.of(context).textTheme.titleMedium,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      );

  Widget _budget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: MyInsets.xs),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  freelanceProject!.budget,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _timing(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: MyInsets.s),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              FontAwesomeIcons.clock,
              color: Theme.of(context).colorScheme.secondary,
              size: 14,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: MyInsets.xs),
                child: Text(
                  freelanceProject!.timing,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  Widget _nda(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: MyInsets.s),
        child: TagWidget(
          color: Theme.of(context).colorScheme.primary,
          text: 'NDA',
        ),
      );

  Widget _shimmerBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.shimmerContainer(const Size(200, 24)),
        MyInsets.placeholderPaddingForShimmer,
        Utils.shimmerContainer(const Size(120, 16)),
        MyInsets.placeholderPaddingForShimmer,
        Utils.shimmerContainer(const Size(160, 16)),
        MyInsets.placeholderPaddingForShimmer,
        TagWidget(
          text: 'NDA',
          color: MyTheme.placeholderColorForShimmer,
        ),
      ],
    );
  }
}
