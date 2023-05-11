import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/home/bloc/home_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/widget.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OpportunityCard extends StatelessWidget {
  const OpportunityCard({
    super.key,
    required this.opportunity,
    required this.onTap,
  });

  final Opportunity opportunity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            boxShadow: AppShadows.homeOpportunityCardShadows,
            color: AppColors.homeOpportunityCardBackground,
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          opportunity.title,
                          style: AppFonts.homeOpportunityCardTitle,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              PhosphorIcons.regular.buildings,
                              size: 18,
                              color: AppColors.extraDarkGrey,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                opportunity.workWithOrFor,
                                style: AppFonts.homeOpportunityCardSubtitle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  FavouriteCheckbox(
                    id: opportunity.id,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 8,
                children: [
                  for (var feature in opportunity.features)
                    feature == ''
                        ? Container()
                        : Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.lightGrey,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              feature,
                              style: AppFonts.homeOpportunityCardTag,
                            ),
                          )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OpportunityShimmerCard extends StatelessWidget {
  const OpportunityShimmerCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: AppShadows.homeOpportunityCardShadows,
        color: AppColors.homeOpportunityCardBackground,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 16,
                      width: 100,
                      color: Colors.grey[300],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 16,
                            width: 100,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                height: 32,
                width: 32,
                color: Colors.grey[300],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
