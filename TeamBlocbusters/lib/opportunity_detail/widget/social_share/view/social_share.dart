import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_detail/widget/social_share/bloc/social_share_bloc.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:social_share_repository/social_share_repository.dart';

class SocialShare extends StatelessWidget {
  const SocialShare({
    required this.jobOfferId,
    required this.isFreelance,
    super.key,
  });

  final String jobOfferId;
  final bool isFreelance;

  @override
  Widget build(BuildContext context) {
    final jobOfferTitle = isFreelance
        ? context.read<JobOfferRepository>().getFreelanceById(jobOfferId).title
        : context.read<JobOfferRepository>().getJobOfferById(jobOfferId).title;
    return BlocProvider(
      create: (context) => SocialShareBloc(
        socialShareRepository: context.read<SocialShareRepository>(),
        jobOfferId: jobOfferId,
        jobOfferTitle: jobOfferTitle,
      ),
      child: const ShareButton(),
    );
  }
}

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialShareBloc, SocialShareState>(
      bloc: context.read<SocialShareBloc>(),
      builder: (context, state) => Padding(
        padding: const EdgeInsets.only(left: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.sky),
            borderRadius: BorderRadius.circular(99),
          ),
          child: IconButton(
            icon: Icon(
              PhosphorIcons.light.shareNetwork,
              color: AppColors.sky,
            ),
            padding: const EdgeInsets.all(16),
            onPressed: () => context
                .read<SocialShareBloc>()
                .add(const PressedSocialShareButton()),
          ),
        ),
      ),
    );
  }
}
