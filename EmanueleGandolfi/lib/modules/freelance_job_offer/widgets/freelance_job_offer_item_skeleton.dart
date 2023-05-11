import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/content_card.dart';
import 'package:skeletons/skeletons.dart';

class FreelanceJobOfferItemSkeleton extends StatelessWidget {
  const FreelanceJobOfferItemSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentCard(
      padding: EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: 3.11,
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            borderRadius: BorderRadius.circular(0)
          ),
        ),
      ),
    );
  }
}
