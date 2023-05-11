import 'package:fudeo_api/src/models/deserializable.dart';
import 'package:fudeo_api/src/models/notion_page_fields.dart';

class NotionFreelanceProjectPage extends Deserializable {
  NotionFreelanceProjectPage.fromJson(super.json)
      : schedule = NotionPageRichTextField.fromJson(
          json['Tempistiche'] as Map<String, dynamic>,
        ),
        jobPosted = NotionPageCreatedTimeField.fromJson(
          json['Job Posted'] as Map<String, dynamic>,
        ),
        applicationProcess = NotionPageRichTextField.fromJson(
          json['Come candidarsi'] as Map<String, dynamic>,
        ),
        request = NotionPageRichTextField.fromJson(
          json['Richiesta di lavoro'] as Map<String, dynamic>,
        ),
        budget = NotionPageRichTextField.fromJson(
          json['Budget'] as Map<String, dynamic>,
        ),
        nda = NotionPageSelectField.fromJson(
          json['NDA'] as Map<String, dynamic>,
        ),
        code = NotionPageTitleField.fromJson(
          json['Codice'] as Map<String, dynamic>,
        ),
        paymentTiming = NotionPageRichTextField.fromJson(
          json['Tempistiche di pagamento'] as Map<String, dynamic>,
        ),
        description = NotionPageRichTextField.fromJson(
          json['Descrizione del progetto'] as Map<String, dynamic>,
        ),
        relationship = NotionPageSelectField.fromJson(
          json['Tipo di relazione'] as Map<String, dynamic>,
        ),
        super.fromJson();

  NotionPageRichTextField schedule;
  NotionPageCreatedTimeField jobPosted;
  NotionPageRichTextField applicationProcess;
  NotionPageRichTextField request;
  NotionPageRichTextField budget;
  NotionPageSelectField nda;
  NotionPageTitleField code;
  NotionPageRichTextField paymentTiming;
  NotionPageRichTextField description;
  NotionPageSelectField relationship;
}
