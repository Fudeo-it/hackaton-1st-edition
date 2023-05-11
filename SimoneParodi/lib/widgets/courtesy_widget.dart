import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';

class CourtesyWidget extends StatelessWidget {
  final String title;
  final String? subTitle;
  final IconData icon;
  final bool isError;

  const CourtesyWidget({
    required this.title,
    required this.icon,
    this.isError = false,
    this.subTitle,
    super.key,
  });

  factory CourtesyWidget.networkError() => const CourtesyWidget(
        title: 'Ops!',
        subTitle: 'Errore durante il caricamento degli annunci',
        icon: FontAwesomeIcons.circleExclamation,
        isError: true,
      );
  factory CourtesyWidget.localError() => const CourtesyWidget(
        title: 'Ops!',
        subTitle: 'Errore durante il caricamento dei dati',
        icon: FontAwesomeIcons.circleExclamation,
        isError: true,
      );

  factory CourtesyWidget.repositoryError() => const CourtesyWidget(
        title: 'Ops!',
        subTitle: 'Errore interno',
        icon: FontAwesomeIcons.circleExclamation,
        isError: true,
      );
  factory CourtesyWidget.noConnectivity() => const CourtesyWidget(
        title: 'Ops!',
        subTitle: 'Nessuna connessione a internet',
        icon: FontAwesomeIcons.circleExclamation,
        isError: true,
      );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(MyInsets.s),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isError
                  ? Theme.of(context).colorScheme.error.withOpacity(0.5)
                  : Theme.of(context).colorScheme.primary.withOpacity(0.5),
              size: 96,
            ),
            Padding(
              padding: const EdgeInsets.only(top: MyInsets.m),
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ),
            if (subTitle != null)
              Padding(
                padding: const EdgeInsets.only(top: MyInsets.xs),
                child: Text(
                  subTitle!,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
