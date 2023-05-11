import 'dart:io';
import 'package:annunci_lavoro_flutter/blocs/freelanceAds/bloc/freelance_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/cubits/dark_mode_cubit.dart';
import 'package:annunci_lavoro_flutter/models/ads_description.dart';
import 'package:annunci_lavoro_flutter/models/favourites_store_model.dart';
import 'package:annunci_lavoro_flutter/models/freelance_positions_model.dart';
import 'package:annunci_lavoro_flutter/widgets/dialog_and_bottomsheet/link_error_dialog.dart';
import 'package:easy_rich_text/easy_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../blocs/favourite_storage/bloc/favourites_storage_bloc.dart';

class FreelanceAdsSheet extends StatefulWidget {
  ///
  /// bottomSheet che mostra i dettagli di un annuncio di tipo [FreeLancePosition]
  ///
  /// consente anche di salvare l'annuncio candidarsi, e condividerlo con app di terze parti.
  ///
  final FreeLancePosition freeLancePosition;
  const FreelanceAdsSheet({
    super.key,
    required this.freeLancePosition,
  });

  @override
  State<FreelanceAdsSheet> createState() => _FreelanceAdsSheetState();
}

class _FreelanceAdsSheetState extends State<FreelanceAdsSheet> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 48, left: 16, right: 16),
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Expanded(
              child: ListView(
                children: [
                  _adsTitle(),
                  _jobPosted(),
                  _buttons(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: Divider(
                      thickness: 2,
                    ),
                  ),
                  _infoColorWidget(
                      label: 'NDA',
                      data: _ndaInfo(),
                      icon: FontAwesomeIcons.peopleGroup),
                  _infoColorWidget(
                      label: 'Tipo di relazione',
                      data: _realtionshipInfo(),
                      icon: FontAwesomeIcons.peopleGroup),
                  _richTextDescription('Descrizione del progetto',
                      widget.freeLancePosition.adsDescription),
                  _richTextDescription('Richiesta di lavoro',
                      widget.freeLancePosition.jobRequest),
                  _richTextDescription(
                      'Tempistiche', widget.freeLancePosition.workTiming),
                  _richTextDescription(
                      'Budget', widget.freeLancePosition.budget),
                  _richTextDescription('Tempistiche di pagamento',
                      widget.freeLancePosition.paymentTimes),
                ],
              ),
            ),
          ),
          _topPills(),
          _shareButton(),
        ],
      ),
    );
  }

  Widget _topPills() => Positioned(
        top: 10,
        left: MediaQuery.of(context).size.width / 2 - 60,
        right: MediaQuery.of(context).size.width / 2 - 60,
        child: Container(
          width: 100,
          height: 5,
          decoration: BoxDecoration(
            color: Theme.of(context).dividerColor,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      );

  Widget _infoColorWidget({
    required String label,
    required Widget? data,
    required IconData? icon,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 26.0, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  size: 18,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).hintColor),
                ),
              ],
            ),
            const SizedBox(height: 8),
            data ??
                Text(
                  'Empty',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Theme.of(context).hintColor),
                ),
          ],
        ),
      );

  Widget _realtionshipInfo() => BlocBuilder<DarkModeCubit, bool>(
        builder: (context, darkMode) {
          return Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: widget.freeLancePosition.getRelationshipColor(
                  widget.freeLancePosition.realtionship, darkMode),
            ),
            child: Text(
              widget.freeLancePosition.mapRelationshipString(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
            ),
          );
        },
      );

  Widget _ndaInfo() => Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).dividerColor,
        ),
        child: Text(
          widget.freeLancePosition.nda.toString().split('.')[1].toUpperCase(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
        ),
      );

  Widget _adsTitle() => Text(
        widget.freeLancePosition.adsTitle,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 32),
      );

  Widget _jobPosted() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.clock,
              size: 18,
              color: Theme.of(context).hintColor,
            ),
            const SizedBox(width: 10),
            Text(
              'Publicato il : ',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Theme.of(context).hintColor),
            ),
            const SizedBox(width: 10),
            Text(
              DateFormat('dd MMMM yyyy')
                  .format(widget.freeLancePosition.postedDate),
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.green.shade700),
            ),
          ],
        ),
      );

  Widget _buttons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _applyButton(),
          _favouriteButton(),
        ],
      );

  /// bottone che indirizza direttamente al link della candidatura.
  Widget _applyButton() => Expanded(
        child: InkWell(
          onTap: _apply,
          child: Container(
            padding:
                const EdgeInsets.only(left: 26, right: 26, top: 6, bottom: 6),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Candidati',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    FontAwesomeIcons.briefcase,
                    size: 18,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ),
      );

  /// bottone che aggiunge o rimuove l'annuncio dai preferiti.
  Widget _favouriteButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Expanded(
          child: InkWell(
            onTap: () => widget.freeLancePosition.isFavourite
                ? _removeFromFavourite()
                : _addToFavourite(),
            child: Container(
              padding:
                  const EdgeInsets.only(left: 26, right: 26, top: 6, bottom: 6),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                border: Border.all(color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.freeLancePosition.isFavourite ? 'Salvato' : 'Salva',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(width: 6),
                  widget.freeLancePosition.isFavourite
                      ? Icon(
                          Icons.bookmark,
                          size: 18,
                          color: Theme.of(context).primaryColor,
                        )
                      : Icon(
                          Icons.bookmark_border,
                          size: 18,
                          color: Theme.of(context).primaryColor,
                        )
                ],
              ),
            ),
          ),
        ),
      );

  /// widget che visualizza un oggetto di tipo [RichTextDescription]
  Widget _richTextDescription(String label, RichTextDescription content) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 26.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  FontAwesomeIcons.list,
                  size: 18,
                  color: Theme.of(context).hintColor,
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Theme.of(context).hintColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            EasyRichText(
              content.descriptionText,
              textScaleFactor: 1.1,
              defaultStyle: Theme.of(context).textTheme.titleLarge,
              patternList: List.generate(
                content.descriptionAnnotations.length,
                (index) => EasyRichTextPattern(
                  hasSpecialCharacters: true,
                  targetString: content.descriptionAnnotations[index]['text'],
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontStyle: content.descriptionAnnotations[index]
                                  ['annotations']['italic'] ==
                              true
                          ? FontStyle.italic
                          : null,
                      fontSize: 20,
                      fontWeight: content.descriptionAnnotations[index]
                                  ['annotations']['bold'] ==
                              true
                          ? FontWeight.bold
                          : null),
                ),
              ),
            ),
          ],
        ),
      );

  /// bottone che permette all'utente di condividere l'annuncio tramite app di terze parti.
  Widget _shareButton() => Positioned(
        top: 6,
        right: 20,
        child: IconButton(
          onPressed: () => Share.share(widget.freeLancePosition.adsUrl),
          icon: Icon(
            Platform.isIOS ? Icons.ios_share : Icons.share,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
        ),
      );

  /// metodo che aggiunge l'annuncio ai preferiti.
  void _addToFavourite() {
    widget.freeLancePosition.isFavourite = true;
    setState(() {});
    BlocProvider.of<FreelanceAdsBloc>(context)
        .freeLanceAdsController
        .addToFavorite(widget.freeLancePosition.metaData.id);
    BlocProvider.of<FavouritesStorageBloc>(context).addToFavourite(
        FavouriteStoreModel(
            dataBaseId: widget.freeLancePosition.metaData.dataBaseId,
            id: widget.freeLancePosition.metaData.id));
    HapticFeedback.heavyImpact();
  }

  /// metodo che rimuove l'annuncio dai preferiti.
  void _removeFromFavourite() {
    widget.freeLancePosition.isFavourite = false;
    setState(() {});
    BlocProvider.of<FreelanceAdsBloc>(context)
        .freeLanceAdsController
        .removeFromFavorite(widget.freeLancePosition.metaData.id);
    BlocProvider.of<FavouritesStorageBloc>(context).removeFromFavourite(
        FavouriteStoreModel(
            dataBaseId: widget.freeLancePosition.metaData.dataBaseId,
            id: widget.freeLancePosition.metaData.id));
    HapticFeedback.heavyImpact();
  }

  /// metodo che apre la webview al link della candidatura.
  Future<void> _apply() async {
    final Uri _url = Uri.parse(widget.freeLancePosition.applyLink);
    if (!await launchUrl(_url)) {
      showDialog(
          context: context, builder: (context) => const LinkErrorDialog());
    }
  }
}
