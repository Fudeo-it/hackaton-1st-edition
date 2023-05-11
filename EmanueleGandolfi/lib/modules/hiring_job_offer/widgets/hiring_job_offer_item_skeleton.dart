import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/content_card.dart';
import 'package:skeletons/skeletons.dart';

class HiringJobOfferItemSkeleton extends StatelessWidget {
  const HiringJobOfferItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      padding: EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: 2.11,
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            borderRadius: BorderRadius.circular(0)
          ),
        ),
      ),
    );
  }
}
