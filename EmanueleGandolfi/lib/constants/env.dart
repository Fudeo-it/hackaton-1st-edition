import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static bool get isInitialized => dotenv.isInitialized;
  static String? notionApiKey = dotenv.env['NOTION_API_KEY'];
}