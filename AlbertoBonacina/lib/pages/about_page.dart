// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/localization/app_localizations_context.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/about_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/constants.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class AboutPage extends ConsumerWidget {
  const AboutPage({Key? key}) : super(key: key);

  Future<PackageInfo> getPackageInfo() async {
    return await PackageInfo.fromPlatform();
  }

  void _showAboutDialog(BuildContext context) async {
    PackageInfo packageInfo = await getPackageInfo();

    showAboutDialog(
      context: context,
      applicationVersion: packageInfo.version,
      applicationName: context.loc.aboutPageAppMoreInfoAppName,
      applicationLegalese: context.loc.aboutPageAppMoreInfoLegalese,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        title: Text(context.loc.aboutPageTitle),
      ),
      body: ListView(
        children: [
          AboutRow(
            icon: Icons.language,
            label: context.loc.aboutPageAppWebsiteLabel,
            callback: () => mutils.launchURL(Constants.websiteUrl),
          ),
          AboutRow(
            icon: Icons.contact_support,
            label: context.loc.aboutPageAppSupportLabel,
            callback: () => mutils.launchURL('mailto:${Constants.supportEmail}'
                '?subject=${context.loc.aboutPageAppSupportMailSubject}'),
          ),
          AboutRow(
            icon: Icons.info,
            label: context.loc.aboutPageAppMoreInfo,
            callback: () => _showAboutDialog(context),
          ),
          const SizedBox(
            height: 16,
          ),
          FutureBuilder<PackageInfo>(
            future: getPackageInfo(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasData) {
                return Text(
                  'Hackathon Fudeo ${snapshot.data!.version}'
                  '\nmade with ☕ and 💙'
                  '\nby Alberto Bonacina @ Soluzione1',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
