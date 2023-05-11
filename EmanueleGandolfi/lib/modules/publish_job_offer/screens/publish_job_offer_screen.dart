import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_app/constants/urls.dart';
import 'package:offertelavoroflutter_app/helpers/app_url_launcher.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/base_app_bar.dart';

class PublishJobOfferScreen extends StatelessWidget {
  const PublishJobOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: Text(AppLocalizations.of(context)!.publishJobOfferScreenTitle)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(AppLocalizations.of(context)!.publishJobOfferScreenSubTitle, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.publishJobOfferScreenText, style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => AppUrlLauncher.openUrlInBrowser(Urls.publishHiringJobOfferForm),
                child: Text(AppLocalizations.of(context)!.publishHiringJobOfferButton, textAlign: TextAlign.center)
              ),
              const SizedBox(height: 15),
              Text(AppLocalizations.of(context)!.or, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () => AppUrlLauncher.openUrlInBrowser(Urls.publishFreelanceJobOfferForm),
                style: Styles.getAccentButtonTheme(context),
                child: Text(AppLocalizations.of(context)!.publishFreelanceJobOfferButton, textAlign: TextAlign.center)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
