import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../app/resources/color_manager.dart';
import '../../../../app/resources/string_constants.dart';
import '../../domain/entities/contratto_entity.dart';
import '../../domain/entities/seniority_enitity.dart';
import '../../domain/entities/team_entity.dart';

class SeniorityChip extends StatelessWidget {
  const SeniorityChip({
    Key? key,
    required this.seniorityEntity,
    required this.mode,
  }) : super(key: key);

  final SeniorityEntity seniorityEntity;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (seniorityEntity.backgroundColorString) {
      case StringConsts.notionGreen:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkGreen
            : ColorManager.notionLightGreen;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightGreen;
        break;
      case StringConsts.notionYellow:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkYellow
            : ColorManager.notionLightYellow;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightYellow;
        break;
      case StringConsts.notionRed:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkRed
            : ColorManager.notionLightRed;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightRed;
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
          '${seniorityEntity.seniority}',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}

class ContrattoChip extends StatelessWidget {
  const ContrattoChip({
    Key? key,
    required this.contrattoEntity,
    required this.mode,
  }) : super(key: key);

  final ContrattoEntity contrattoEntity;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (contrattoEntity.backgroundColorString) {
      case StringConsts.notionBlue:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkBlue
            : ColorManager.notionLightBlue;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightBlue;
        break;
      case StringConsts.notionGray:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkGray
            : ColorManager.notionLightGray;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightGray;
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
          '${contrattoEntity.contratto}',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}

class TeamChip extends StatelessWidget {
  const TeamChip({
    Key? key,
    required this.teamEntity,
    required this.mode,
  }) : super(key: key);

  final TeamEntity teamEntity;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (teamEntity.backgroundColorString) {
      case StringConsts.notionPurple:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkPurple
            : ColorManager.notionLightPurple;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightPurple;
        break;
      case StringConsts.notionYellow:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkYellow
            : ColorManager.notionLightYellow;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightYellow;
        break;
      case StringConsts.notionRed:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkRed
            : ColorManager.notionLightRed;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightRed;
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
          '${teamEntity.team}',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
