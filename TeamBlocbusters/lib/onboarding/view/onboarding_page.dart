import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fudeo_hackaton/onboarding/widget/proceed_button.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:fudeo_hackaton/widget/conditional_flex_fit.dart';
import 'package:job_offer_repository/job_offer_repository.dart';
import 'package:sized_context/sized_context.dart';
import 'package:url_launcher/url_launcher.dart';

class OnboardingPage extends StatelessWidget {
  OnboardingPage({
    super.key,
    required JobOfferRepository jobOfferRepository,
  }) {
    jobOfferRepository
      ..loadJobOffers()
      ..loadFreelanceProjects();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final largeScreen = context.diagonalInches >= 7;
    final smallScreen = context.diagonalInches < 4;
    final padding = largeScreen ? 64.0 : 28.0;
    final imageSize = smallScreen ? width * 0.6 : width * 0.8;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Builder(
        builder: (context) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: padding),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: padding),
                    child: SvgPicture.asset(
                      'assets/onboarding.svg',
                      width: imageSize,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ConditionalFlexFit(
                            wrapWithFlexFit: smallScreen,
                            child: const Text(
                              'Trova il tuo \nprossimo \nlavoro',
                              style: AppFonts.onboardingTitle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          ConditionalFlexFit(
                            wrapWithFlexFit: smallScreen,
                            child: Column(
                              children: [
                                const Text(
                                  'I migliori annunci di lavoro in Flutter \nselezionati per te da',
                                  textAlign: TextAlign.center,
                                  style: AppFonts.onboardingSubTitle,
                                ),
                                GestureDetector(
                                  onTap: () => launchUrl(
                                    Uri.parse(
                                      'https://offertelavoroflutter.it/',
                                    ),
                                  ),
                                  child: const Text(
                                    'Offertelavoroflutter.it',
                                    style: AppFonts.onboardingLink,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ConditionalFlexFit(
                            wrapWithFlexFit: smallScreen,
                            child: const ProceedButton(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
