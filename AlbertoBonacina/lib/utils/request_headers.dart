import 'dart:io';

import 'package:soluzione1_hackathon_fudeo_flutter/env/env.dart';

Map<String, String> getNotionHeaders() {
  return {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.authorizationHeader: 'Bearer ${Env.notionSecretKey}',
    'Notion-Version': Env.notionApiVersion
  };
}
