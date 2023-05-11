import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:offerte_lavoro_flutter_app/models/annuncio_freelance_model.dart';



class AnnuncioFreelanceRepository {

  static Future<List<AnnuncioFreelanceModel>> annunciFreelance() async {
    final url = Uri.parse(
        "https://api.notion.com/v1/databases/e6a8a6760e3d4430b20a15d16f75f92e/query");
    final response = await http.post(url, headers: {
      "Authorization":
          "Bearer secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ",
      "Notion-Version": "2022-06-28"
    });
    final jsonData = json.decode(response.body);
    return List.from(jsonData["results"]).map((annuncio) {
      return AnnuncioFreelanceModel.fromMap(annuncio);
    }).toList();
  }
}
