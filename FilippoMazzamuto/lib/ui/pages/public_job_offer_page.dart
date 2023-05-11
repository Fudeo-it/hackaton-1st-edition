import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/constants/urls.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/ui/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class PublicJobOfferPage extends StatelessWidget {
  const PublicJobOfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryDark,
        centerTitle: true,
        title: Text(l10n.website),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(height: 16,),
            Text(l10n.offerTextPublish,
              style: const TextStyle(
                fontSize: 24.00,
                fontWeight: FontWeight.w500
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.messagePublishOffer,
              style: const TextStyle(
                fontSize: 16.0,
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 40),
            // CTA Company Recruitment
            _cta(
              textButton: l10n.hireHimInTheCompany,
              pathUrl: Urls.publishOfferCompanyRecruitment
            ),
            const SizedBox(height: 30),
            Text(l10n.or),
            const SizedBox(height: 30),
            // CTA Freelance Project
            _cta(
              textButton: l10n.freelanceProject,
              pathUrl: Urls.publishOfferFreelanceProject
            ),
          ],
        ),
      ),
    );
  }

  Widget _cta({
    required String textButton,
    required String pathUrl,
  }) => TextButton(
    onPressed: () async {
      final Uri url = Uri.parse(pathUrl);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    },
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
    child: Text(
      textButton,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 18
      ),
    ),
  );
}