import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import '../../features/aziende/domain/enums/contratto.dart';
import '../../features/aziende/domain/enums/seniority.dart';
import '../../features/aziende/domain/enums/team.dart';
import '../../features/freelancers/domain/enums/nda.dart';
import '../../features/freelancers/domain/enums/relazione.dart';

class ColorManager {
  static const Color primaryColor = Colors.blueGrey;
  static const Color darkRed = Color.fromARGB(255, 161, 1, 1);
  static const Color veryLightRed = Color.fromARGB(255, 228, 214, 214);

  static final defaultLightColorScheme =
      ColorScheme.fromSeed(seedColor: notionLightPrimary).harmonized();

  static final defaultDarkColorScheme = ColorScheme.fromSeed(
          seedColor: notionDarkPrimary, brightness: Brightness.dark)
      .harmonized();

  static const Color notionLightPrimary = Color(0xFF027DFD);
  static const Color notionDarkPrimary = Color(0xFF061D5C);

  //LIGHT WEB PAGE TAGS
  static const Color notionLightYellow = Color(0xfffdecc8);
  static const Color onNotionLightYellow = Color(0xff503c29);
  static const Color notionLightRed = Color(0xffffe2dd);
  static const Color onNotionLightRed = Color(0xff601b19);
  static const Color notionLightPurple = Color(0xffe8deee);
  static const Color onNotionLightPurple = Color(0xff402453);
  static const Color notionLightGreen = Color(0xffdbeddb);
  static const Color onNotionLightGreen = Color(0xff5c7565);
  static const Color notionLightBlue = Color(0xffd3e5ef);
  static const Color onNotionLightBlue = Color(0xff506879);
  static const Color notionLightGray = Color(0xffdfdfde);
  static const Color onNotionLightGray = Color(0xff606b83);
  static const Color notionLightBoxGray = Color(0xfff1f1ef);
  static const Color notionLightPink = Color(0xfff5e0e9);
  static const Color onNotionLightPink = Color(0xff50273b);

  //NDA si
  static const Color notionLightNDAsiGray = Color(0xffe3e2e0);
  static const Color notionLightNDAsiGrayBackground = Color(0xffefefef);
  static const Color onNotionLightNDAGray = Color(0xff595754);

  //NDA no
  static const Color notionLightNDAnoGray = Color(0xfff1f0ef);

  //Tipo di relazione
  //solo
  static const Color notionLightRelazioneSoloGray = Color(0xfff1f0ef);
  static const Color onNotionLightRelazioneSoloGray = Color(0xff484642);

  //con altri: vedi PINK

  //DARK WEB PAGE TAGS
  static const Color onNotionDark = Color(0xffe2d8ca);
  static const Color notionDarkYellow = Color(0xff89632a);
  static const Color notionDarkRed = Color(0xff6e3630);
  static const Color notionDarkPurple = Color(0xff492f64);
  static const Color notionDarkGreen = Color(0xff2b593f);
  static const Color notionDarkBlue = Color(0xff28456c);
  static const Color notionDarkGray = Color(0xff606b83);
  static const Color notionDarkPink = Color(0xff69314c);

  //NDA si
  static const Color notionDarkNDAsiGray = Color(0xff5a5a5a);
  static const Color notionDarkNDAsiGrayBackground = Color(0xff313131);

  //NDA no ==
  static const Color notionDarkNDAeRelazioneGray = Color(0xff373737);

  static getBackgroundColorFromTeam(Team team,
      {required ThemeMode mode, required BuildContext context}) {
    switch (team) {
      case Team.fullRemote:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkPurple
            : ColorManager.notionLightPurple;

      case Team.ibrido:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkYellow
            : ColorManager.notionLightYellow;

      case Team.inSede:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkRed
            : ColorManager.notionLightRed;

      default:
        return Theme.of(context).colorScheme.primaryContainer;
    }
  }

  static getBackgroundColorFromNDA(NDA nda,
      {required ThemeMode mode, required BuildContext context}) {
    switch (nda) {
      case NDA.no:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAeRelazioneGray
            : ColorManager.notionLightNDAsiGrayBackground;
      case NDA.si:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAsiGrayBackground
            : ColorManager.notionLightNDAsiGrayBackground; //TODO check colori
      default:
    }
  }

  static getBackgroundColorFromRelazione(Relazione relazione,
      {required ThemeMode mode, required BuildContext context}) {
    switch (relazione) {
      case Relazione.solo:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkNDAeRelazioneGray
            : ColorManager.notionLightRelazioneSoloGray;
      case Relazione.altri:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkPink
            : ColorManager.notionLightPink;
      default:
    }
  }

  static getBackgroundColorFromContratto(Contratto contratto,
      {required ThemeMode mode, required BuildContext context}) {
    switch (contratto) {
      case Contratto.fullTime:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkBlue
            : ColorManager.notionLightBlue;

      case Contratto.partTime:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkGray
            : ColorManager.notionLightGray;

      default:
        return Theme.of(context).colorScheme.primaryContainer;
    }
  }

  static getBackgroundColorFromSeniority(Seniority seniority,
      {required ThemeMode mode, required BuildContext context}) {
    switch (seniority) {
      case Seniority.junior:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkGreen
            : ColorManager.notionLightGreen;

      case Seniority.mid:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkYellow
            : ColorManager.notionLightYellow;

      case Seniority.senior:
        return mode == ThemeMode.dark
            ? ColorManager.notionDarkRed
            : ColorManager.notionLightRed;

      default:
        return Theme.of(context).colorScheme.primaryContainer;
    }
  }
}
