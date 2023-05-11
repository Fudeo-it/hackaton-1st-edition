import 'package:flutter/material.dart';
import 'package:job_app/app/resources/string_constants.dart';

const kDefaultPadding = 16.0;

const kNumeroDiAnnunciPerPagina = 2;
const kNumeroGiorniPerRecenti = 7;

const kTitleTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 25,
  letterSpacing: 1,
  fontWeight: FontWeight.w500,
);

const kSubtitleTextStyle = TextStyle(
  color: Colors.black38,
  fontSize: 16,
  letterSpacing: 1,
  fontWeight: FontWeight.w500,
);

class AppConsts {
  static const List<String> notionTeams = [
    StringConsts.notionTeamIbrido,
    StringConsts.notionTeamFullRemote,
    StringConsts.notionTeamInSede,
  ];
  static const int cacheDays = 1;
}
