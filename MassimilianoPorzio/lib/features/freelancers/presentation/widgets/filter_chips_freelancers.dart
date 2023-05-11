import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:job_app/features/freelancers/domain/enums/relazione.dart';

import '../../../../app/resources/color_manager.dart';
import '../../domain/enums/nda.dart';

class FilterNDAChip extends StatelessWidget {
  const FilterNDAChip({
    Key? key,
    required this.nda,
    required this.mode,
  }) : super(key: key);

  final NDA nda;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (nda) {
      case NDA.si:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAsiGray
            : ColorManager.notionLightNDAsiGray;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightNDAGray;
        break;
      case NDA.no:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAeRelazioneGray
            : ColorManager.notionLightNDAnoGray;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightNDAGray;
        break;

      default:
        cardColor = Theme.of(context).colorScheme.primaryContainer;
        textColor = Theme.of(context).colorScheme.onPrimaryContainer;
    }
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AutoSizeText(
          '$nda',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}

class FilterRelazioneChip extends StatelessWidget {
  const FilterRelazioneChip({
    Key? key,
    required this.relazione,
    required this.mode,
  }) : super(key: key);

  final Relazione relazione;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (relazione) {
      case Relazione.solo:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAeRelazioneGray
            : ColorManager.notionLightRelazioneSoloGray;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightRelazioneSoloGray;
        break;
      case Relazione.altri:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkPink
            : ColorManager.notionLightPink;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightPink;
        break;

      default:
        cardColor = Theme.of(context).colorScheme.primaryContainer;
        textColor = Theme.of(context).colorScheme.onPrimaryContainer;
    }
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AutoSizeText(
          '$relazione',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
