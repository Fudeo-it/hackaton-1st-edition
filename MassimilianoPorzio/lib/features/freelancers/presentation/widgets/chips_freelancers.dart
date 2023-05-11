import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:job_app/features/freelancers/domain/entities/relazione_entity.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/string_constants.dart';
import '../../domain/entities/nda_entity.dart';
import '../../domain/enums/nda.dart';

class NDAChip extends StatelessWidget {
  const NDAChip({
    Key? key,
    required this.ndaEntity,
    required this.mode,
  }) : super(key: key);

  final NdaEntity ndaEntity;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;
    //TODO andrebbe fatto in base al colore letto da notion ma non ho i vari casi
    // non c'erano esempi
    switch (ndaEntity.nda) {
      case NDA.si:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAsiGray
            : ColorManager.notionLightNDAsiGrayBackground;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightNDAGray;
        break;
      case NDA.no: //NON CI SONO ESEMPI SU NOTION...
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAsiGrayBackground
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
          '${ndaEntity.nda}',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}

class RelazioneChip extends StatelessWidget {
  const RelazioneChip({
    Key? key,
    required this.relazioneEntity,
    required this.mode,
  }) : super(key: key);

  final RelazioneEntity relazioneEntity;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (relazioneEntity.backgroundColorString) {
      //TODO gray e pink ? qui basato su notion (se cambiano i colori la app va di conseguenza)
      case StringConsts.notionGray:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAeRelazioneGray
            : ColorManager.notionLightRelazioneSoloGray;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightRelazioneSoloGray;
        break;
      case StringConsts.notionDefault:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAeRelazioneGray
            : ColorManager.notionLightRelazioneSoloGray;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightRelazioneSoloGray;
        break;
      case StringConsts.notionPink:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkPink
            : ColorManager.notionLightPink;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightPink;
        break;

      default:
        // cardColor = Theme.of(context).colorScheme.primaryContainer;
        cardColor = Theme.of(context).colorScheme.primaryContainer;
        textColor = Theme.of(context).colorScheme.onPrimaryContainer;
    }
    return Card(
      color: cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: AutoSizeText(
          '${relazioneEntity.relazione}',
          textAlign: TextAlign.justify,
          minFontSize: 12,
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
