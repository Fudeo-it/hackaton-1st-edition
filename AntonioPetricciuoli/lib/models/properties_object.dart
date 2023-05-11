import 'package:equatable/equatable.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/models/property_url.dart';

class PropertiesObject extends Equatable {
  final PropertyTitle? name;
  final PropertySelect? team;
  final PropertySelect? contract;
  final PropertySelect? seniority;
  final PropertyRichText? timing;
  final PropertyRichText? jobRequest;
  final PropertyRichText? budget;
  final PropertySelect? nda;
  final PropertyTitle? code;
  final PropertyRichText? paymentTimes;
  final PropertyRichText? projectDescription;
  final PropertySelect? relationType;
  final PropertyRichText? ral;
  final PropertyCreatedTime? jobPosted;
  final PropertyRichText? qualification;
  final PropertyRichText? offerDescription;
  final PropertyRichText? howToApply;
  final PropertyRichText? location;
  final PropertyRichText? company;
  final PropertyUrl? website;

  const PropertiesObject({
    this.name,
    this.team,
    this.contract,
    this.seniority,
    this.timing,
    this.jobRequest,
    this.budget,
    this.nda,
    this.code,
    this.paymentTimes,
    this.projectDescription,
    this.relationType,
    this.ral,
    this.jobPosted,
    this.qualification,
    this.offerDescription,
    this.howToApply,
    this.location,
    this.company,
    this.website,
  });

  factory PropertiesObject.fromJson(Map<String, dynamic> json) {
    return PropertiesObject(
      name: json['Name'] != null
          ? PropertyTitle.fromJson(json['Name'] as Map<String, dynamic>)
          : null,
      team: json['Team'] != null
          ? PropertySelect.fromJson(json['Team'] as Map<String, dynamic>)
          : null,
      contract: json['Contratto'] != null
          ? PropertySelect.fromJson(json['Contratto'] as Map<String, dynamic>)
          : null,
      seniority: json['Seniority'] != null
          ? PropertySelect.fromJson(json['Seniority'] as Map<String, dynamic>)
          : null,
      timing: json['Tempistiche'] != null
          ? PropertyRichText.fromJson(
              json['Tempistiche'] as Map<String, dynamic>)
          : null,
      jobRequest: json['Richiesta di lavoro'] != null
          ? PropertyRichText.fromJson(
              json['Richiesta di lavoro'] as Map<String, dynamic>)
          : null,
      budget: json['Budget'] != null
          ? PropertyRichText.fromJson(json['Budget'] as Map<String, dynamic>)
          : null,
      nda: json['NDA'] != null
          ? PropertySelect.fromJson(json['NDA'] as Map<String, dynamic>)
          : null,
      code: json['Codice'] != null
          ? PropertyTitle.fromJson(json['Codice'] as Map<String, dynamic>)
          : null,
      paymentTimes: json['Tempistiche di pagamento'] != null
          ? PropertyRichText.fromJson(
              json['Tempistiche di pagamento'] as Map<String, dynamic>)
          : null,
      projectDescription: json['Descrizione del progetto'] != null
          ? PropertyRichText.fromJson(
              json['Descrizione del progetto'] as Map<String, dynamic>)
          : null,
      relationType: json['Tipo di relazione'] != null
          ? PropertySelect.fromJson(
              json['Tipo di relazione'] as Map<String, dynamic>)
          : null,
      ral: json['RAL'] != null
          ? PropertyRichText.fromJson(json['RAL'] as Map<String, dynamic>)
          : null,
      jobPosted: json['Job Posted'] != null
          ? PropertyCreatedTime.fromJson(
              json['Job Posted'] as Map<String, dynamic>)
          : null,
      qualification: json['Qualifica'] != null
          ? PropertyRichText.fromJson(json['Qualifica'] as Map<String, dynamic>)
          : null,
      offerDescription: json['Descrizione offerta'] != null
          ? PropertyRichText.fromJson(
              json['Descrizione offerta'] as Map<String, dynamic>,
            )
          : null,
      howToApply: json['Come candidarsi'] != null
          ? PropertyRichText.fromJson(
              json['Come candidarsi'] as Map<String, dynamic>)
          : null,
      location: json['Località'] != null
          ? PropertyRichText.fromJson(json['Località'] as Map<String, dynamic>)
          : null,
      company: json['Nome azienda'] != null
          ? PropertyRichText.fromJson(
              json['Nome azienda'] as Map<String, dynamic>)
          : null,
      website: json['URL sito web'] != null
          ? PropertyUrl.fromJson(json['URL sito web'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Name': name?.toJson(),
      'Team': team?.toJson(),
      'Contratto': contract?.toJson(),
      'Seniority': seniority?.toJson(),
      'Tempistiche': timing?.toJson(),
      'Richiesta di lavoro': jobRequest?.toJson(),
      'Budget': budget?.toJson(),
      'NDA': nda?.toJson(),
      'Codice': code?.toJson(),
      'Tempistiche di pagamento': paymentTimes?.toJson(),
      'Descrizione del progetto': projectDescription?.toJson(),
      'Tipo di relazione': relationType?.toJson(),
      'RAL': ral?.toJson(),
      'Job Posted': jobPosted?.toJson(),
      'Qualifica': qualification?.toJson(),
      'Descrizione offerta': offerDescription?.toJson(),
      'Come candidarsi': howToApply?.toJson(),
      'Località': location?.toJson(),
      'Nome azienda': company?.toJson(),
      'URL sito web': website?.toJson(),
    };
  }

  @override
  List<Object?> get props => [
        name,
        team,
        contract,
        seniority,
        timing,
        jobRequest,
        budget,
        nda,
        code,
        paymentTimes,
        projectDescription,
        relationType,
        ral,
        jobPosted,
        qualification,
        offerDescription,
        howToApply,
        location,
        company,
        website,
      ];
}
