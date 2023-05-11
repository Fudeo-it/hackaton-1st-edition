import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_app/constants/urls.dart';
import 'package:offertelavoroflutter_app/helpers/app_url_launcher.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/content_sheet.dart';

class FreelanceJobOfferSubscribeNewsletterSheet extends StatelessWidget {
  const FreelanceJobOfferSubscribeNewsletterSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContentSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.freelanceJobOfferSubscribeNewsletterTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
          Text(AppLocalizations.of(context)!.freelanceJobOfferSubscribeNewsletterText, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => AppUrlLauncher.openUrlInBrowser(Urls.freelanceJobOfferNewsletterForm),
            child: Text(AppLocalizations.of(context)!.subscribe)
          ),
          const SizedBox(height: 20),
        ]
      )
    );
  }
}
