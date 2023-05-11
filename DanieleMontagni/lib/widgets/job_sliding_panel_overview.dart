import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:offerte_lavoro_flutter_app/blocs/bloc/annuncio_bloc.dart';
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';
import 'package:offerte_lavoro_flutter_app/util/share/share.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';
import 'package:offerte_lavoro_flutter_app/util/trasform_to_url.dart';
import 'package:offerte_lavoro_flutter_app/widgets/sliding_button.dart';
import 'package:url_launcher/url_launcher.dart';

class JobSlidingPanelOverview extends StatefulWidget {
  final AnnuncioModel annuncioModel;

  JobSlidingPanelOverview({required this.annuncioModel});

  @override
  State<JobSlidingPanelOverview> createState() =>
      _JobSlidingPanelOverviewState();
}

class _JobSlidingPanelOverviewState extends State<JobSlidingPanelOverview> {
  final ScrollController _firstController = ScrollController();

  var logger = Logger();

  Future<void> _launchUrl() async {
    if (!await launchUrl(
        TrasformToUrl.transformToUrl(widget.annuncioModel.comeCandidarsi))) {
      throw Exception('Could not launch ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
              height: SizeConfig.blockSizeVertical * 23,
              child: jobHeader(context)),
          SizedBox(
              height: SizeConfig.blockSizeVertical * 40,
              child: jobDescription()),
          SizedBox(
              height: SizeConfig.blockSizeVertical * 5, child: buttomSaveJob()),
        ],
      ),
    );
  }

  Widget jobHeader(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4.0),
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
              height: SizeConfig.blockSizeVertical * 0.8,
            ),
            _jobAction(context),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.annuncioModel.titolo,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 0.8,
            ),
            _jobLabel(context),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 0.8,
            ),
            _jobFactoryAndRal(),
          ],
        ),
      );

  Widget _jobAction(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal * 2),
            child: AutoSizeText(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "Data pubblicazione: " +
                  DateFormat("dd MMMM HH:MM")
                      .format(widget.annuncioModel.jobPosted),
            ),
          ),
          IconButton(
            icon: widget.annuncioModel.inFavoritePage
                ? Icon(
                    Icons.favorite_rounded,
                    color: Colors.red,
                  )
                : Icon(Icons.favorite_outline),
            onPressed: () {
              BlocProvider.of<AnnuncioBloc>(context)
                  .add(AnnuncioFavoriteEventToggle((widget.annuncioModel)));
              setState(() {});
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () => ShareClass.share(widget.annuncioModel.url!),
              icon: Icon(Icons.share),
            ),
          ),
        ],
      );

  Widget _jobLabel(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: widget.annuncioModel.seniority! == 'Junior'
                  ? Colors.green.shade100
                  : widget.annuncioModel.seniority! == 'Mid'
                      ? Colors.yellow.shade300
                      : widget.annuncioModel.seniority! == 'Senior'
                          ? Colors.red.shade200
                          : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.annuncioModel.seniority ?? " - ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeVertical * 1,
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: widget.annuncioModel.contratto! == 'Full time'
                  ? Colors.blue.shade100
                  : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.annuncioModel.contratto ?? " - ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.blockSizeVertical * 1,
          ),
          Container(
            width: 100,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: widget.annuncioModel.team == 'Full Remote'
                  ? Colors.purple.shade200
                  : widget.annuncioModel.team == 'Ibrido'
                      ? Colors.yellow.shade300
                      : Colors.red.shade200,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: AutoSizeText(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.annuncioModel.team ?? " - ",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
        ],
      );

  Widget _jobFactoryAndRal() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.factory_rounded),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 100,
                child: AutoSizeText(
                  widget.annuncioModel.nomeAzienda,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            SizedBox(
              width: SizeConfig.blockSizeHorizontal * 5,
            ),
            Icon(Icons.euro),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Container(
                width: 100,
                child: AutoSizeText(
                  widget.annuncioModel.retribuzione ?? ' - ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      );

  Widget jobDescription() => Padding(
        padding: const EdgeInsets.all(8),
        child: SizedBox(
          // height: SizeConfig.blockSizeVertical * 30,
          child: Scrollbar(
            thumbVisibility: true,
            controller: _firstController,
            child: ListView(
              controller: _firstController,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    "Descrizione offerta",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    widget.annuncioModel.descrizioneOfferta,
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
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      Clipboard.setData(ClipboardData(
                          text: widget.annuncioModel.comeCandidarsi));
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
                        widget.annuncioModel.comeCandidarsi,
                        style: TextStyle(
                            fontSize: 13, color: Colors.blue.shade700),
                      ),
                      leading: Icon(Icons.content_copy_rounded),
                    ),
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
