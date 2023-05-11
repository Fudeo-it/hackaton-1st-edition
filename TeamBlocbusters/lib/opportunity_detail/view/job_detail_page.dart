import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fudeo_hackaton/opportunity_detail/widget/widget.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class JobOfferDetailPage extends StatelessWidget {
  const JobOfferDetailPage({super.key, required this.jobOffer});

  final JobOffer jobOffer;

  @override
  Widget build(BuildContext context) {
    return DetailPageWrapper(
      id: jobOffer.id,
      applyUrl: jobOffer.applyUrl,
      applicationProcess: jobOffer.applicationProcess,
      children: [
        _HeaderSection(jobOffer: jobOffer),
        Stack(
          children: [
            _DescriptionSection(jobOffer: jobOffer),
            Positioned(
              top: 0,
              left: 18,
              right: 18,
              child: _InfoCards(jobOffer: jobOffer),
            ),
          ],
        ),
      ],
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection({
    required this.jobOffer,
  });

  final JobOffer jobOffer;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 64),
      padding: const EdgeInsets.only(
        top: 64,
        left: 18,
        right: 18,
        bottom: 92,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
        color: AppColors.blueShadesLight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const OpportunityDescriptionTitle(title: 'Descrizione'),
          const SizedBox(height: 4),
          Html(
            data: jobOffer.description,
            style: {
              'body': Style.fromTextStyle(AppFonts.jobDetailDescription),
            },
          ),
        ],
      ),
    );
  }
}

class _InfoCards extends StatelessWidget {
  const _InfoCards({
    required this.jobOffer,
  });

  final JobOffer jobOffer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (jobOffer.teamLocation != null)
          OpportunityInfoCard(
            text: stringFromTeamLocation(jobOffer.teamLocation),
            icon: PhosphorIcons.regular.coffee,
            filterText: 'Team',
          ),
        if (jobOffer.seniority != null)
          OpportunityInfoCard(
            text: stringFromSeniority(jobOffer.seniority!),
            icon: PhosphorIcons.regular.code,
            filterText: 'Seniority',
          ),
        if (jobOffer.contract != null)
          OpportunityInfoCard(
            text: stringFromContract(jobOffer.contract),
            icon: PhosphorIcons.regular.clock,
            filterText: 'Contratto',
          ),
      ],
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({
    required this.jobOffer,
  });

  final JobOffer jobOffer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreatedDate(date: jobOffer.publishDate),
          const SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  jobOffer.title,
                  style: AppFonts.jobDetailTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SocialShare(
                jobOfferId: jobOffer.id,
                isFreelance: false,
              ),
            ],
          ),
          const SizedBox(height: 32),
          OpportunityInfoSubtitle(
            icon: PhosphorIcons.regular.buildings,
            text: jobOffer.company,
            addDividerAbove: false,
          ),
          if (jobOffer.salary != null) ...[
            OpportunityInfoSubtitle(
              icon: PhosphorIcons.regular.currencyEur,
              text: jobOffer.salary!,
            ),
          ],
          if (jobOffer.location != '') ...[
            OpportunityInfoSubtitle(
              icon: PhosphorIcons.regular.mapPin,
              text: jobOffer.location,
            ),
          ],
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
