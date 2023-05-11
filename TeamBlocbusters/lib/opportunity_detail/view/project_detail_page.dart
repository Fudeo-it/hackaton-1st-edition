import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fudeo_hackaton/opportunity_detail/widget/widget.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProjectDetailPage extends StatelessWidget {
  const ProjectDetailPage({super.key, required this.project});

  final Freelance project;

  @override
  Widget build(BuildContext context) {
    return DetailPageWrapper(
      id: project.id,
      applyUrl: project.applyUrl,
      applicationProcess: project.applicationProcess,
      children: [
        Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _HeaderSection(project: project),
                  _DescriptionSection(project: project)
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection({
    required this.project,
  });

  final Freelance project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CreatedDate(date: project.publishDate),
          const SizedBox(height: 14),
          Row(
            children: [
              Flexible(
                child: Text(
                  project.title,
                  style: AppFonts.jobDetailTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SocialShare(
                jobOfferId: project.id,
                isFreelance: true,
              ),
            ],
          ),
          const SizedBox(height: 32),
          OpportunityInfoSubtitle(
            icon: PhosphorIcons.regular.buildings,
            text: project.workWith,
            addDividerAbove: false,
          ),
          OpportunityInfoSubtitle(
            icon: PhosphorIcons.regular.currencyEur,
            text: project.compensation,
          ),
          OpportunityInfoSubtitle(
            text: project.nda ? 'NDA previsto' : 'NDA non previsto',
            icon: PhosphorIcons.regular.warningDiamond,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _DescriptionSection extends StatelessWidget {
  const _DescriptionSection({
    required this.project,
  });

  final Freelance project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
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
          if (project.description != null) ...[
            const SizedBox(height: 8),
            const JobOfferDescriptionTitle(title: 'Descrizione progetto'),
            const SizedBox(height: 4),
            Html(
              data: project.description,
              style: {
                'body': Style.fromTextStyle(AppFonts.jobDetailDescription),
              },
            ),
          ],
          if (project.request != null) ...[
            const SizedBox(height: 8),
            const JobOfferDescriptionTitle(title: 'Richiesta di lavoro'),
            const SizedBox(height: 4),
            Html(
              data: project.request,
              style: {
                'body': Style.fromTextStyle(AppFonts.jobDetailDescription),
              },
            ),
          ],
          if (project.timeline != null) ...[
            const SizedBox(height: 8),
            const JobOfferDescriptionTitle(title: 'Tempistiche progetto'),
            const SizedBox(height: 4),
            Html(
              data: project.timeline,
              style: {
                'body': Style.fromTextStyle(AppFonts.jobDetailDescription),
              },
            ),
          ],
          if (project.payment != null) ...[
            const SizedBox(height: 8),
            const JobOfferDescriptionTitle(title: 'Tempistiche pagamento'),
            const SizedBox(height: 4),
            Html(
              data: project.payment,
              style: {
                'body': Style.fromTextStyle(AppFonts.jobDetailDescription),
              },
            ),
          ],
          const SizedBox(height: 92),
        ],
      ),
    );
  }
}

class JobOfferDescriptionTitle extends StatelessWidget {
  const JobOfferDescriptionTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppFonts.jobDetailDescriptionTitle);
  }
}
