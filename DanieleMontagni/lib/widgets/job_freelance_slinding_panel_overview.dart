import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:offerte_lavoro_flutter_app/blocs/freelanceBloc/bloc/annuncio_freelance_bloc.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';
import 'package:offerte_lavoro_flutter_app/util/share/share.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/util/trasform_to_url.dart';
import 'package:offerte_lavoro_flutter_app/widgets/sliding_button.dart';
import 'package:url_launcher/url_launcher.dart';

class JobFreelanceSlidingPanelOverview extends StatefulWidget {
  final AnnuncioFreelanceModel annuncioFreelanceModel;

  JobFreelanceSlidingPanelOverview({required this.annuncioFreelanceModel});

  @override
  State<JobFreelanceSlidingPanelOverview> createState() =>
      _JobFreelanceSlidingPanelOverviewState();
}

class _JobFreelanceSlidingPanelOverviewState
    extends State<JobFreelanceSlidingPanelOverview> {
  final ScrollController _firstController = ScrollController();

  var logger = Logger();

  Future<void> _launchUrl() async {
    if (!await launchUrl(
        TrasformToUrl.transformToUrl(
            widget.annuncioFreelanceModel.comeCandidarsi),
        mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              height: SizeConfig.blockSizeVertical * 15, child: jobHeader()),
          SizedBox(
              height: SizeConfig.blockSizeVertical * 45,
              child: jobDescription()),
          SizedBox(
              height: SizeConfig.blockSizeVertical * 5, child: buttomSaveJob()),
        ],
      ),
    );
  }

  Widget jobHeader() => Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeVertical * 1,
            ),
            _jobAction(),
            Text(
              widget.annuncioFreelanceModel.codice,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(
              width: SizeConfig.blockSizeVertical * 5,
            ),
          ],
        ),
      );

  Widget _jobAction() => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
            child: AutoSizeText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "Data pubblicazione: " +
                  DateFormat("dd MMMM HH:MM")
                      .format(widget.annuncioFreelanceModel.jobPosted),
            ),
          ),
          IconButton(
            icon: widget.annuncioFreelanceModel.inFavoritePage
                ? Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_outline),
            onPressed: () {
              BlocProvider.of<AnnuncioFreelanceBloc>(context).add(
                  AnnuncioFreelanceFavoriteEventToggle(
                      (widget.annuncioFreelanceModel)));
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () =>
                  ShareClass.share(widget.annuncioFreelanceModel.url!),
              icon: const Icon(Icons.share),
            ),
          ),
        ],
      );

  Widget jobDescription() => Padding(
        padding: EdgeInsets.all(32.0),
        child: SizedBox(
          height: SizeConfig.blockSizeVertical * 44,
          child: Scrollbar(
            thumbVisibility: true,
            controller: _firstController,
            child: ListView(
              controller: _firstController,
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Descrizione del progetto",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioFreelanceModel.descrizioneDelProgetto,
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Richiesta di lavoro",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioFreelanceModel.richiestaDiLavoro,
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Tipo di relazione",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioFreelanceModel.tipoDiRelazione ?? " - ",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Tempistiche",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioFreelanceModel.tempistiche ?? " - ",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Budget",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioFreelanceModel.budget ?? " - ",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "Tempistiche di pagamento",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioFreelanceModel.tempisticheDiPagamento ??
                        " - ",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 8.0, top: 16),
                  child: Text(
                    "NDA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioFreelanceModel.nda ?? " - ",
                    style: TextStyle(),
                    softWrap: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    "Come candidarsi",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(ClipboardData(
                        text: widget.annuncioFreelanceModel.comeCandidarsi));
                    final snackBar = SnackBar(
                      content: const Text('Copiato negli appunti'),
                      action: SnackBarAction(
                        label: 'Chiudi',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.only(right: 8),
                    title: Text(
                      widget.annuncioFreelanceModel.comeCandidarsi,
                      style:
                          TextStyle(fontSize: 13, color: Colors.blue.shade700),
                    ),
                    leading: Icon(Icons.content_copy_rounded),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buttomSaveJob() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SlidingButton(text: 'CANDIDATI', onPressed: () => _launchUrl()));
}
