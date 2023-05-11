import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';

import '../../../../core/domain/entities/annuncio_args.dart';
import '../../domain/entities/annuncio_azienda.dart';
import '../pages/dettagli_annuncio_aziende.dart';

class AnnuncioActions extends StatefulWidget {
  const AnnuncioActions({
    super.key,
    required this.loggy,
    required this.annuncio,
    this.isFromPreferiti = false,
  });

  final Loggy<UiLoggy> loggy;
  final AnnuncioAzienda annuncio;
  final bool isFromPreferiti;

  @override
  State<AnnuncioActions> createState() => _AnnuncioActionsState();
}

class _AnnuncioActionsState extends State<AnnuncioActions>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
    )
      ..reverse()
      ..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            //per ora non lo uso
            widget.loggy.debug("${widget.annuncio.id} FAVORITO?");
          },
          icon: Icon(widget.annuncio.preferito
              ? Icons.bookmark
              : Icons.bookmark_outline),
        ),
        IconButton(
            onPressed: () {
              widget.loggy.debug("VAI AL DETTAGLIO");
              Navigator.of(context).pushNamed(DettaglioAnnunciAziende.routeName,
                  arguments: AnnuncioArguments(
                      annuncioId: widget.annuncio.id,
                      tipoAnnuncio: widget.annuncio.tipoAnnuncio,
                      isFromPreferiti: widget.isFromPreferiti));
            },
            // icon: const Icon(CupertinoIcons.ellipsis),
            icon: AnimatedIcon(
              icon: AnimatedIcons.search_ellipsis,
              progress: _animationController,
            )),
      ],
    );
  }
}
