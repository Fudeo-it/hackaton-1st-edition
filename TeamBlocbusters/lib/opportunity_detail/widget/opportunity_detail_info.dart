import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:sized_context/sized_context.dart';

class OpportunityInfoSubtitle extends StatelessWidget {
  const OpportunityInfoSubtitle({
    required this.icon,
    required this.text,
    this.addDividerAbove = true,
    super.key,
  });

  final IconData icon;
  final String text;
  final bool addDividerAbove;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (addDividerAbove)
          const Divider(
            height: 32,
            thickness: 1,
            color: AppColors.lightGrey,
          ),
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.greyDark,
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Text(
                text,
                style: AppFonts.jobDetailInfoSubtitle,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class OpportunityInfoCard extends StatelessWidget {
  const OpportunityInfoCard({
    required this.text,
    required this.icon,
    required this.filterText,
    super.key,
  });

  final String text;
  final IconData icon;
  final String filterText;

  @override
  Widget build(BuildContext context) {
    final smallScreen = context.diagonalInches < 5;
    final horizontalPadding = smallScreen
        ? 16.0
        : text == 'Full Remote'
            ? 16.0
            : 32.0;
    return SizedBox(
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.lightGrey),
          borderRadius: BorderRadius.circular(16),
          color: AppColors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 32,
            horizontal: horizontalPadding,
          ),
          child: Column(
            children: [
              Text(text, style: AppFonts.jobDetailInfoCard),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(icon, size: 12, color: AppColors.sky),
                  const SizedBox(width: 6),
                  Text(filterText, style: AppFonts.jobDetailInfoCardFilter),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OpportunityDescriptionTitle extends StatelessWidget {
  const OpportunityDescriptionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppFonts.jobDetailDescriptionTitle);
  }
}
