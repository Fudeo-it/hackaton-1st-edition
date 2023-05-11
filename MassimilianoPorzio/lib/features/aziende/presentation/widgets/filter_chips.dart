import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:job_app/features/aziende/domain/enums/contratto.dart';
import 'package:job_app/features/aziende/domain/enums/seniority.dart';
import 'package:job_app/features/aziende/domain/enums/team.dart';

import '../../../../app/resources/color_manager.dart';

class FilterSeniorityChip extends StatelessWidget {
  const FilterSeniorityChip({
    Key? key,
    required this.seniority,
    required this.mode,
  }) : super(key: key);

  final Seniority seniority;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (seniority) {
      case Seniority.junior:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkGreen
            : ColorManager.notionLightGreen;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightGreen;
        break;
      case Seniority.mid:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkYellow
            : ColorManager.notionLightYellow;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightYellow;
        break;
      case Seniority.senior:
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
          '$seniority',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}

class FilterContrattoChip extends StatelessWidget {
  const FilterContrattoChip({
    Key? key,
    required this.contratto,
    required this.mode,
  }) : super(key: key);

  final Contratto contratto;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (contratto) {
      case Contratto.fullTime:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkBlue
            : ColorManager.notionLightBlue;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightBlue;
        break;
      case Contratto.partTime:
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
          '$contratto',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}

class FilterTeamChip extends StatelessWidget {
  const FilterTeamChip({
    Key? key,
    required this.team,
    required this.mode,
  }) : super(key: key);

  final Team team;
  final ThemeMode mode;

  @override
  Widget build(BuildContext context) {
    late final Color cardColor;
    late final Color textColor;

    switch (team) {
      case Team.fullRemote:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkPurple
            : ColorManager.notionLightPurple;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightPurple;
        break;
      case Team.ibrido:
        cardColor = mode == ThemeMode.dark
            ? ColorManager.notionDarkYellow
            : ColorManager.notionLightYellow;
        textColor = mode == ThemeMode.dark
            ? ColorManager.onNotionDark
            : ColorManager.onNotionLightYellow;
        break;
      case Team.inSede:
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
          '$team',
          style: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.w600, color: textColor),
        ),
      ),
    );
  }
}
