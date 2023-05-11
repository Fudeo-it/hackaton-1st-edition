// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/localization/app_localizations_context.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/models/progetto.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/filter_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/row_info_row.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/descrizione_section.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/pages/ui/share_bottom_link.dart';
import 'package:soluzione1_hackathon_fudeo_flutter/utils/utils.dart' as mutils;

class SingleProgettoPage extends StatelessWidget {
  const SingleProgettoPage({super.key, required this.progetto});

  final Progetto progetto;

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
              mutils.copyToClipboard(progetto.hrefProgetto);
              mutils.showToast(context.loc.labelLinkProgettoCopiato);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () => mutils.showModalShareLinkQrCode(
                  context, progetto.hrefProgetto),
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
                    progetto.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                RowInfoRow(
                  label: mutils.formatDatetimeToDisplay(
                      progetto.createdTime, "d MMMM yyyy"),
                  icon: Icons.schedule_outlined,
                  isWithIcon: true,
                  size: 18,
                ),
                const SizedBox(
                  height: 12,
                ),
                FilterRow(
                  icon: Icons.groups,
                  color: progetto.tipoRelazioneColor,
                  label: progetto.tipoRelazioneName,
                ),
                DescrizioneSection(
                  title: context.loc.descrizioneProgettoLabel,
                  rowsList: progetto.descrizioneList,
                ),
                DescrizioneSection(
                  title: context.loc.richiestaProgettoLabel,
                  rowsList: progetto.richiestaList,
                ),
                DescrizioneSection(
                  title: context.loc.tempisticheProgettoLabel,
                  rowsList: progetto.tempisticheList,
                ),
                DescrizioneSection(
                  title: context.loc.budgetProgettoLabel,
                  rowsList: progetto.budgetList,
                ),
                DescrizioneSection(
                  title: context.loc.tempistichePagamentoProgettoLabel,
                  rowsList: progetto.tempistichePagamentoList,
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
          ShareBottomLink(
            label: context.loc.linkProgettoBtn,
            urlToShare: progetto.hrefProgetto,
          ),
        ],
      ),
    );
  }
}
