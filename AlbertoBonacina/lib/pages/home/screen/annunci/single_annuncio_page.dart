// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/localization/app_localizations_context.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/annuncio.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/filter_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/row_info_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/descrizione_section.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/share_bottom_link.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class SingleAnnuncioPage extends StatelessWidget {
  const SingleAnnuncioPage({super.key, required this.annuncio});

  final Annuncio annuncio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.copy_outlined),
            onPressed: () {
              mutils.copyToClipboard(annuncio.hrefOfferta);
              mutils.showToast(context.loc.labelLinkAnnuncioCopiato);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => mutils.showModalShareLinkQrCode(
                  context, annuncio.hrefOfferta),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16,
                    bottom: 12,
                  ),
                  child: Text(
                    annuncio.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                RowInfoRow(
                  label: annuncio.aziendaName,
                  icon: Icons.domain,
                  isWithIcon: true,
                  size: 18,
                ),
                RowInfoRow(
                  label: annuncio.localita,
                  icon: Icons.location_on,
                  isWithIcon: true,
                  size: 18,
                ),
                RowInfoRow(
                  label: annuncio.retribuzione,
                  icon: Icons.payment_outlined,
                  isWithIcon: true,
                  size: 18,
                ),
                RowInfoRow(
                  label: mutils.formatDatetimeToDisplay(
                      annuncio.createdTime, "d MMMM yyyy"),
                  icon: Icons.schedule_outlined,
                  isWithIcon: true,
                  size: 18,
                ),
                const SizedBox(
                  height: 12,
                ),
                FilterRow(
                  icon: Icons.location_on,
                  color: annuncio.teamColor,
                  label: annuncio.teamName,
                ),
                FilterRow(
                  icon: Icons.work_history,
                  color: annuncio.contrattoColor,
                  label: annuncio.contrattoName,
                ),
                FilterRow(
                  icon: Icons.workspace_premium,
                  color: annuncio.seniorityColor,
                  label: annuncio.seniorityName,
                ),
                DescrizioneSection(
                  title: context.loc.descrizioneOffertaLabel,
                  rowsList: annuncio.descrizioneList,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          ShareBottomLink(
            label: context.loc.linkAnnuncioBtn,
            urlToShare: annuncio.hrefOfferta,
          ),
        ],
      ),
    );
  }
}
