import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/info_tile.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';

class FreelanceJobOfferDetailInfo extends StatelessWidget {
  final FreelanceJobOffer freelanceJobOffer;
  const FreelanceJobOfferDetailInfo({Key? key, required this.freelanceJobOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding),
      child: Column(
        children: [
          InfoTile.styledText(AppLocalizations.of(context)!.descrizioneDelProgettoAttribute, freelanceJobOffer.descrizioneDelProgetto),
          InfoTile.styledText(AppLocalizations.of(context)!.richiestaDiLavoroAttribute, freelanceJobOffer.richiestaDiLavoro),
          InfoTile.styledText(AppLocalizations.of(context)!.tempisticheAttribute, freelanceJobOffer.tempistiche),
          InfoTile.selectOption(AppLocalizations.of(context)!.tipoDiRelazioneAttribute, freelanceJobOffer.tipoDiRelazione),
          InfoTile.styledText(AppLocalizations.of(context)!.budgetAttribute, freelanceJobOffer.budget),
          InfoTile.styledText(AppLocalizations.of(context)!.tempisticheDiPagamentoAttribute, freelanceJobOffer.tempisticheDiPagamento),
          InfoTile.selectOption(AppLocalizations.of(context)!.ndaAttribute, freelanceJobOffer.nda),
          InfoTile.styledText(AppLocalizations.of(context)!.comeCandidarsiAttribute, freelanceJobOffer.comeCandidarsi),
        ],
      ),
    );
  }
}
