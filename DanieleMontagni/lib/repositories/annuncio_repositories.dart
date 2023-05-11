import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:offerte_lavoro_flutter_app/models/annuncio_model.dart';


class AnnuncioRepository {

  static Future<List<AnnuncioModel>> annunci() async {
    final url = Uri.parse(
        "https://api.notion.com/v1/databases/283d2760f81548f0a7baca4b3e58d7d8/query");
    final response = await http.post(url, headers: {
      "Authorization":
          "Bearer secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ",
      "Notion-Version": "2022-06-28"
    });
    final jsonData = json.decode(response.body);
    return List.from(jsonData["results"]).map((annuncio) {
      return AnnuncioModel.fromMap(annuncio);
    }).toList();
  }
}
