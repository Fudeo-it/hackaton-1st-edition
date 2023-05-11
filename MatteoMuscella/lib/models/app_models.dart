enum OfferType { none, hiring, freelance }

class JobOffer {
  DateTime createdAt;
  DateTime updatedAt;

  String salaryString;
  int minSalary;
  int maxSalary;

  String companyName;
  String jobName;
  String jobTitle;
  String location;
  String jobDescription;

  String urlToApply;
  String id;

  bool archived;

  OfferType offerType;

  Map<String, dynamic> props = {};

  JobOffer(
    this.createdAt,
    this.updatedAt,
    this.id, {
    this.salaryString = '',
    this.minSalary = 0,
    this.maxSalary = 0,
    this.companyName = '',
    this.jobName = '',
    this.jobTitle = '',
    this.location = '',
    this.jobDescription = '',
    this.urlToApply = '',
    this.archived = false,
    this.offerType = OfferType.none,
  });

  bool hasNoSalary() => salaryString.trim().isEmpty;

  bool hasNoLocation() => location.trim().isEmpty;
}

class DbModel {
  String id;
  bool active;
  String? nextCursor;
  bool hasMore;

  DbModel(this.id, {this.active = true, this.hasMore = true});
}

class NotionApiProp {
  String name;
  dynamic node;

  NotionApiProp(this.name, this.node);
}

enum PublishDate { none, thisWeek, lastWeek, lastMonth, last6Months }
