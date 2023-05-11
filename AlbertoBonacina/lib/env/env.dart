import 'package:envied/envied.dart';

part 'env.g.dart';

//Here you can specify the path to your .env file
//  relative to the project root
@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'NOTION_BASE_URL', obfuscate: true)
  static final notionBaseUrl = _Env.notionBaseUrl;

  @EnviedField(varName: 'NOTION_SECRET_KEY', obfuscate: true)
  static final notionSecretKey = _Env.notionSecretKey;

  @EnviedField(varName: 'NOTION_DB_ANNUNCI', obfuscate: true)
  static final notionDBAnnunci = _Env.notionDBAnnunci;

  @EnviedField(varName: 'NOTION_DB_PROGETTI', obfuscate: true)
  static final notionDBProgetti = _Env.notionDBProgetti;

  @EnviedField(varName: 'NOTION_API_VERSION', obfuscate: true)
  static final notionApiVersion = _Env.notionApiVersion;
}
