import 'package:fudeo_api/src/models/deserializable.dart';
import 'package:fudeo_api/src/models/notion_page_fields.dart';

class NotionJobOfferPage extends Deserializable {
  NotionJobOfferPage.fromJson(super.json)
      : jobPosted = NotionPageCreatedTimeField.fromJson(
          json['Job Posted'] as Map<String, dynamic>,
        ),
        team = NotionPageSelectField.fromJson(
          json['Team'] as Map<String, dynamic>,
        ),
        contract = NotionPageSelectField.fromJson(
          json['Contratto'] as Map<String, dynamic>,
        ),
        seniority = NotionPageSelectField.fromJson(
          json['Seniority'] as Map<String, dynamic>,
        ),
        ral =
            NotionPageSelectField.fromJson(json['RAL'] as Map<String, dynamic>),
        name =
            NotionPageTitleField.fromJson(json['Name'] as Map<String, dynamic>),
        position = NotionPageRichTextField.fromJson(
          json['Qualifica'] as Map<String, dynamic>,
        ),
        salary = NotionPageRichTextField.fromJson(
          json['Retribuzione'] as Map<String, dynamic>,
        ),
        description = NotionPageRichTextField.fromJson(
          json['Descrizione offerta'] as Map<String, dynamic>,
        ),
        applicationProcess = NotionPageRichTextField.fromJson(
          json['Come candidarsi'] as Map<String, dynamic>,
        ),
        location = NotionPageRichTextField.fromJson(
          json['Località'] as Map<String, dynamic>,
        ),
        companyName = NotionPageRichTextField.fromJson(
          json['Nome azienda'] as Map<String, dynamic>,
        ),
        status = NotionPageRichTextField.fromJson(
          json['Stato di pubblicazione'] as Map<String, dynamic>,
        ),
        url = NotionPageUrlField.fromJson(
          json['URL sito web'] as Map<String, dynamic>,
        ),
        super.fromJson();
  NotionPageCreatedTimeField jobPosted;
  NotionPageSelectField team;
  NotionPageSelectField contract;
  NotionPageSelectField seniority;
  NotionPageSelectField ral;
  NotionPageTitleField name;
  NotionPageRichTextField position;
  NotionPageRichTextField salary;
  NotionPageRichTextField description;
  NotionPageRichTextField applicationProcess;
  NotionPageRichTextField location;
  NotionPageRichTextField companyName;
  NotionPageRichTextField status;
  NotionPageUrlField url;
}
