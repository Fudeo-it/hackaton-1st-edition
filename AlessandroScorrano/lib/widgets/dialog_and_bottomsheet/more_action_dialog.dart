import 'dart:io';
import 'package:annunci_lavoro_flutter/blocs/favourite_storage/bloc/favourites_storage_bloc.dart';
import 'package:annunci_lavoro_flutter/blocs/freelanceAds/bloc/freelance_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/blocs/jobAds/bloc/job_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/models/favourites_store_model.dart';
import 'package:annunci_lavoro_flutter/models/freelance_positions_model.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:annunci_lavoro_flutter/widgets/dialog_and_bottomsheet/freelance_ads_sheet.dart';
import 'package:annunci_lavoro_flutter/widgets/dialog_and_bottomsheet/job_ads_sheet.dart';
import 'package:annunci_lavoro_flutter/widgets/cards/freelance_ads_card.dart';
import 'package:annunci_lavoro_flutter/widgets/cards/job_ads_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MoreActionDialog extends StatefulWidget {
  ///
  /// Dialog mostrata dalla ui per le azioni rapide, visualizza la card dell'annuncio
  /// senza il bottone per i preferiti, e nella parte sottostante mostra un menù con
  /// le azioni rapide,il tutto sopra ad un effetto blur sullo schermo.
  ///
  final JobPosition? jobPosition;
  final FreeLancePosition? freeLancePosition;
  MoreActionDialog({
    super.key,
    required this.jobPosition,
    required this.freeLancePosition,
  });

  @override
  State<MoreActionDialog> createState() => _MoreActionDialogState();
}

class _MoreActionDialogState extends State<MoreActionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.easeOut,
      insetAnimationDuration: Duration(milliseconds: 500),
      insetPadding: EdgeInsets.all(4),
      backgroundColor: Colors.transparent,
      child: Container(
        height: 400,
        child: Column(
          children: [
            widget.jobPosition != null && widget.freeLancePosition == null
                ? JobAdsCard(
                    jobPosition: widget.jobPosition,
                    enabled: false,
                    tileMode: TileMode.dialogView,
                  )
                : widget.freeLancePosition != null && widget.jobPosition == null
                    ? FreelanceAdsCard(
                        enabled: false,
                        freeLancePosition: widget.freeLancePosition,
                        tileMode: TileMode.dialogView,
                      )
                    : SizedBox(),
            Container(
              margin: EdgeInsets.all(10),
              width: 220,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  widget.jobPosition != null && widget.freeLancePosition == null
                      ? _actionButton(
                          onTap: widget.jobPosition!.isFavourite
                              ? _removeJobPositionFromFavourite
                              : _addJobPositionToFavourite,
                          icon: widget.jobPosition!.isFavourite
                              ? FontAwesomeIcons.solidBookmark
                              : FontAwesomeIcons.bookmark,
                          text: widget.jobPosition!.isFavourite
                              ? 'elimina da salvati'
                              : 'Salva',
                        )
                      : widget.freeLancePosition != null &&
                              widget.jobPosition == null
                          ? _actionButton(
                              onTap: widget.freeLancePosition!.isFavourite
                                  ? _removeFreelanceFromFavourite
                                  : _addFreelanceToFavourite,
                              icon: widget.freeLancePosition!.isFavourite
                                  ? FontAwesomeIcons.solidBookmark
                                  : FontAwesomeIcons.bookmark,
                              text: widget.freeLancePosition!.isFavourite
                                  ? 'elimina da salvati'
                                  : 'Salva',
                            )
                          : SizedBox(),
                  _divider(),
                  _actionButton(
                    onTap: showAds,
                    icon: Icons.open_in_new,
                    text: 'Apri',
                  ),
                  _divider(),
                  _actionButton(
                      onTap: shareAds,
                      icon: Platform.isAndroid ? Icons.share : Icons.ios_share,
                      text: 'Condividi'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _divider() => Divider(
      thickness: 1,
      indent: 8,
      endIndent: 8,
      color: Theme.of(context).dividerColor);

  Widget _actionButton({
    Color? iconColor,
    required Function() onTap,
    required IconData icon,
    required String text,
  }) =>
      ListTile(
        onTap: onTap,
        trailing: Icon(
          icon,
          color: iconColor ?? null,
        ),
        title: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      );

  /// metodo che apre la bottomSheet dell'annuncio
  void showAds() {
    Navigator.pop(context);
    showCupertinoModalBottomSheet(
      topRadius: const Radius.circular(40),
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (context) =>
          widget.jobPosition != null && widget.freeLancePosition == null
              ? JobAdsSheet(
                  jobPosition: widget.jobPosition!,
                )
              : widget.freeLancePosition != null && widget.jobPosition == null
                  ? FreelanceAdsSheet(
                      freeLancePosition: widget.freeLancePosition!,
                    )
                  : SizedBox(),
    );
  }

  /// metodo per condvidere l'annuncio con app di terze parti.
  void shareAds() {
    Navigator.pop(context);
    if (widget.jobPosition != null && widget.freeLancePosition == null) {
      Share.share(widget.jobPosition!.adsUrl);
    } else if (widget.freeLancePosition != null && widget.jobPosition == null) {
      Share.share(widget.freeLancePosition!.adsUrl);
    }
  }

  /// metodo per aggiungere un oggetto di tipo JobAds ai preferiti.
  void _addJobPositionToFavourite() {
    widget.jobPosition!.isFavourite = true;
    setState(() {});
    BlocProvider.of<JobAdsBloc>(context)
        .jobAdsController
        .addToFavorite(widget.jobPosition!.metaData.id);
    BlocProvider.of<FavouritesStorageBloc>(context).addToFavourite(
        FavouriteStoreModel(
            dataBaseId: widget.jobPosition!.metaData.dataBaseId,
            id: widget.jobPosition!.metaData.id));
    Navigator.pop(context);
    _showSnackBar('Annuncio aggiunto ai preferiti');
  }

  /// metodo per rimuovere un oggetto di tipo JobAds ai preferiti.
  void _removeJobPositionFromFavourite() {
    widget.jobPosition!.isFavourite = false;
    setState(() {});
    BlocProvider.of<JobAdsBloc>(context)
        .jobAdsController
        .removeFromFavorite(widget.jobPosition!.metaData.id);
    BlocProvider.of<FavouritesStorageBloc>(context).removeFromFavourite(
        FavouriteStoreModel(
            dataBaseId: widget.jobPosition!.metaData.dataBaseId,
            id: widget.jobPosition!.metaData.id));
    Navigator.pop(context);

    _showSnackBar('Annuncio rimosso dai preferiti');
  }

  /// metodo per aggiungere un oggetto di tipo FreelanceAds ai preferiti.
  void _addFreelanceToFavourite() {
    widget.freeLancePosition!.isFavourite = true;
    setState(() {});
    BlocProvider.of<FreelanceAdsBloc>(context)
        .freeLanceAdsController
        .addToFavorite(widget.freeLancePosition!.metaData.id);
    BlocProvider.of<FavouritesStorageBloc>(context).addToFavourite(
        FavouriteStoreModel(
            dataBaseId: widget.freeLancePosition!.metaData.dataBaseId,
            id: widget.freeLancePosition!.metaData.id));
    Navigator.pop(context);
    _showSnackBar('Annuncio aggiunto ai preferiti');
  }

  /// metodo per rimuovere un oggetto di tipo FreelanceAds ai preferiti.
  void _removeFreelanceFromFavourite() {
    widget.freeLancePosition!.isFavourite = false;
    setState(() {});
    BlocProvider.of<FreelanceAdsBloc>(context)
        .freeLanceAdsController
        .removeFromFavorite(widget.freeLancePosition!.metaData.id);
    BlocProvider.of<FavouritesStorageBloc>(context).removeFromFavourite(
        FavouriteStoreModel(
            dataBaseId: widget.freeLancePosition!.metaData.dataBaseId,
            id: widget.freeLancePosition!.metaData.id));
    Navigator.pop(context);
    _showSnackBar('Annuncio rimosso dai preferiti');
  }

  /// metodo che mostra la SnackBar in alto quando si aggiunge o rimuove un annuncio dai preferiti
  void _showSnackBar(String text) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        iconPositionLeft: 8,
        icon: Icon(Icons.check_circle, color: Colors.green),
        iconRotationAngle: 0,
        backgroundColor: Theme.of(context).cardColor,
        message: text,
        textStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      displayDuration: Duration(seconds: 1),
    );
    HapticFeedback.heavyImpact();
  }
}
