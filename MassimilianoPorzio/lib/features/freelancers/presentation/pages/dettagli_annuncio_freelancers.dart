import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:intl/intl.dart';
import 'package:job_app/core/data/utils/snackbars.dart';

import 'package:loggy/loggy.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:job_app/app/resources/string_constants.dart';
import 'package:job_app/core/domain/entities/typedefs.dart';
import 'package:job_app/features/freelancers/domain/entities/annuncio_freelancer.dart';
import 'package:job_app/features/freelancers/presentation/widgets/chips_freelancers.dart';
import 'package:job_app/features/preferiti/domain/entities/preferito.dart';
import 'package:job_app/features/preferiti/presentation/cubit/annunci/preferiti_cubit.dart';

import '../../../../app/presentation/cubit/dark_mode/dark_mode_cubit.dart';
import '../../../../core/domain/entities/annuncio_args.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/rich_text_utils.dart';
import '../cubit/annunci/freelancers_cubit.dart';

class DettaglioAnnunciFreelancers extends StatelessWidget with UiLoggy {
  final bool isFromPreferiti;
  static const String routeName = "dettaglioAnnuncioFreelancers";
  const DettaglioAnnunciFreelancers({
    Key? key,
    this.isFromPreferiti = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mode = context.read<DarkModeCubit>().state.mode;
    final args =
        ModalRoute.of(context)!.settings.arguments as AnnuncioArguments;
    if (args.isFromPreferiti) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        showSnackbarInfo(context, "L'annuncio potrebbe non essere aggiornato");
      });
    }

    return BlocSelector<FreelancersCubit, FreelancersState,
        AnnuncioFreelancers>(
      selector: (state) {
        var annuncio = state.listaAnnunci
            .firstWhere((element) => element.id == args.annuncioId);
        return annuncio;
      }, //prova per fare il rebuild se cambia solo l'annuncio
      builder: (context, annuncio) {
        return Scaffold(
          appBar: AppBar(
            title: AutoSizeText(
              annuncio.titolo,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height,

              width: MediaQuery.of(context).size.width,
              child: Scrollbar(
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (annuncio.emoji != null)
                          Text(
                            sl<EmojiParser>().get(annuncio.emoji).code,
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontSize: 28),
                          ),
                        if (annuncio.emoji == null)
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                          ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  loggy.debug("SHARING ANNUNCIO...");
                                  String textToShare = annuncio.urlAnnuncio !=
                                          null
                                      ? annuncio.urlAnnuncio!.content
                                      : annuncio
                                          .plainDescrizioneProgetto; //progetto
                                  Share.share(textToShare);
                                },
                                icon: const Icon(Icons.share)),
                            IconButton(
                                iconSize: 28,
                                onPressed: () {
                                  loggy.debug("TOGGLE FAVORITO");
                                  context
                                      .read<FreelancersCubit>()
                                      .togglePreferito(annuncio.id);
                                  if (annuncio.preferito) {
                                    //RIMUOVI
                                    loggy.debug("TOLGO DA LISTA PREFERITI");
                                    context
                                        .read<PreferitiCubit>()
                                        .rimuoviPreferito(
                                            Preferito.fromAnnuncioFreelancers(
                                                annuncio));
                                  } else {
                                    loggy
                                        .debug("AGGIUNGO ALLA LISTA PREFERITI");
                                    context
                                        .read<PreferitiCubit>()
                                        .aggiungiPreferito(
                                            Preferito.fromAnnuncioFreelancers(
                                                annuncio));
                                  }
                                },
                                icon: Icon(annuncio.preferito
                                    ? Icons.bookmark_added
                                    : Icons.bookmark_add_outlined)),
                          ],
                        )
                      ],
                    ),
                    AutoSizeText(
                      annuncio.titolo,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        RigaDettaglio(
                          annuncio: annuncio,
                          iconData: Icons.schedule,
                          descrizione: "Job posted",
                          valore: Text(
                            DateFormat('dd/MM/yyyy HH:mm')
                                .format(annuncio.jobPosted),
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                        RigaDettaglio(
                          annuncio: annuncio,
                          iconData: Icons.subject,
                          descrizione: "Come candidarsi",
                          valore: LinkText(
                            text: annuncio.comeCandidarsi.content,
                            url: annuncio.comeCandidarsi.url ?? "",
                          ),
                        ),

                        const Divider(),

                        RigaDettaglio(
                          annuncio: annuncio,
                          iconData: Icons.arrow_drop_down_circle_outlined,
                          descrizione: "NDA",
                          valore: annuncio.nda == null
                              ? const Text("")
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: NDAChip(
                                      ndaEntity: annuncio.nda!, mode: mode),
                                ),
                        ), //seniority
                        RigaDettaglio(
                          annuncio: annuncio,
                          iconData: Icons.arrow_drop_down_circle_outlined,
                          descrizione: "Tipo di relazione",
                          valore: annuncio.relazione == null
                              ? const Text("")
                              : Align(
                                  alignment: Alignment.centerLeft,
                                  child: RelazioneChip(
                                    relazioneEntity: annuncio.relazione!,
                                    mode: mode,
                                  ),
                                ),
                        ),

                        const Divider(),
                        RichTextUI(
                          richTextList: annuncio.descrizioneProgetto,
                          titolo: StringConsts.notionDescrizioneProgetto,
                          isFreelancers: true,
                        ),
                        const Divider(),
                        RichTextUI(
                          richTextList: annuncio.richiestaDiLavoro,
                          titolo: StringConsts.notionRichiestaDiLavoro,
                          isFreelancers: true,
                        ),
                        const Divider(),
                        RichTextUI(
                          richTextList: annuncio.tempistiche,
                          titolo: StringConsts.notionTempistiche,
                          isFreelancers: true,
                        ),
                        const Divider(),
                        RichTextUI(
                          richTextList: annuncio.budget,
                          titolo: StringConsts.notionBudget,
                          isFreelancers: true,
                        ),
                        const Divider(),
                        RichTextUI(
                          richTextList: annuncio.tempistichePagamento,
                          titolo: StringConsts.notionTempisticheDiPagamento,
                          isFreelancers: true,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class RichTextUI extends StatelessWidget {
  const RichTextUI({
    Key? key,
    required this.titolo,
    required this.richTextList,
    this.isFreelancers = false,
  }) : super(key: key);

  final String titolo;
  final RichTextList richTextList;
  final bool isFreelancers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.subject),
            Text(titolo),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          // color: Colors.purple,
          child: SingleChildScrollView(
              child: getWidgetFromRichTextEntity(richTextList, isFreelancers)),
        ),
      ],
    );
  }
}

class LinkText extends StatelessWidget {
  final String text;
  final String url;

  const LinkText({
    super.key,
    required this.text,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        launchUrl(Uri.parse(url));
      },
      child: AutoSizeText(
        text,
        maxFontSize: 12,
        style: const TextStyle(
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class RigaDettaglio extends StatelessWidget {
  final IconData iconData;
  final String descrizione;
  final Widget valore;

  const RigaDettaglio({
    super.key,
    required this.annuncio,
    required this.iconData,
    required this.descrizione,
    required this.valore,
  });

  final AnnuncioFreelancers annuncio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    iconData,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  AutoSizeText(descrizione, maxFontSize: 12, maxLines: 3),
                ],
              )),
          Expanded(
            flex: 6,
            child: Padding(
              padding: EdgeInsets.zero,
              child: valore,
            ),
          )
        ],
      ),
    );
  }
}
