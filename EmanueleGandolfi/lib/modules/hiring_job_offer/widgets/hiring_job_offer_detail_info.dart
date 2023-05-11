import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/info_tile.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';

class HiringJobofferDetailInfo extends StatelessWidget {
  final HiringJobOffer hiringJobOffer;
  const HiringJobofferDetailInfo({Key? key, required this.hiringJobOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding),
      child: Column(
        children: [
          InfoTile.styledText(AppLocalizations.of(context)!.qualificaAttribute, hiringJobOffer.qualifica),
          InfoTile.selectOption(AppLocalizations.of(context)!.teamAttribute, hiringJobOffer.team),
          InfoTile.selectOption(AppLocalizations.of(context)!.contrattoAttribute, hiringJobOffer.contratto),
          InfoTile.selectOption(AppLocalizations.of(context)!.seniorityAttribute, hiringJobOffer.seniority),
          InfoTile.styledText(AppLocalizations.of(context)!.retribuzioneAttribute, hiringJobOffer.retribuzione),
          InfoTile.styledText(AppLocalizations.of(context)!.descrizioneOffertaAttribute, hiringJobOffer.descrizioneOfferta),
          InfoTile.url(AppLocalizations.of(context)!.urlSitoWebAttribute, hiringJobOffer.urlSitoWeb),
          InfoTile.styledText(AppLocalizations.of(context)!.comeCandidarsiAttribute, hiringJobOffer.comeCandidarsi),
          // TODO is this useful? _buildStyledTextInfo(AppLocalizations.of(context)!.statoDiPubblicazioneAttribute, hiringJobOffer.statoDiPubblicazione, context),
        ],
      ),
    );
  }
}
