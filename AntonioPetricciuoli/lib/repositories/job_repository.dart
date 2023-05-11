import 'package:offertelavoroflutter/misc/misc.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/services/network.dart';
import 'package:offertelavoroflutter/services/storage.dart';

class JobRepository {
  final Api api;
  final Storage storage;

  const JobRepository({
    required this.api,
    required this.storage,
  });

  Future<List<Freelance>> getFreelances() async {
    final List<String> savedIds =
        await storage.getStringList('SAVED_IDS') ?? [];

    final List<NotionObject>? freelanceResponse =
        await api.jobPostingsFreelance();
    List<Freelance> freelances = [];

    freelanceResponse?.map((e) {
      final id = e.id;

      final icon = e.icon?.emoji ?? '';

      final timing = e.propertiesObject?.timing?.richText?.isNotEmpty ?? false
          ? e.propertiesObject?.timing?.richText
              ?.map((e) => e.plainText)
              .toList()
              .join(' ')
          : '';

      final jobPosted =
          e.propertiesObject?.jobPosted?.createdTime?.isNotEmpty ?? false
              ? e.propertiesObject?.jobPosted?.createdTime
              : '';

      final howToApply =
          e.propertiesObject?.howToApply?.richText?.isNotEmpty ?? false
              ? e.propertiesObject?.howToApply?.richText
                  ?.map((e) => e.plainText)
                  .toList()
                  .join(' ')
              : '';

      final jobRequested =
          e.propertiesObject?.jobRequest?.richText?.isNotEmpty ?? false
              ? e.propertiesObject?.jobRequest?.richText
                  ?.map((e) => e.plainText)
                  .toList()
                  .join(' ')
              : '';

      final budget = e.propertiesObject?.budget?.richText?.isNotEmpty ?? false
          ? e.propertiesObject?.budget?.richText
              ?.map((e) => e.plainText)
              .toList()
              .join(' ')
          : '';

      final nda = e.propertiesObject?.nda?.select?.name?.isNotEmpty ?? false
          ? e.propertiesObject?.nda?.select?.name
          : '';

      final code = e.propertiesObject?.code?.title.isNotEmpty ?? false
          ? e.propertiesObject?.code?.title
              .map((e) => e.plainText)
              .toList()
              .join(' ')
          : '';

      final paymentTimes =
          e.propertiesObject?.paymentTimes?.richText?.isNotEmpty ?? false
              ? e.propertiesObject?.paymentTimes?.richText
                  ?.map((e) => e.plainText)
                  .toList()
                  .join(' ')
              : '';
      final projectDescription =
          e.propertiesObject?.projectDescription?.richText?.isNotEmpty ?? false
              ? e.propertiesObject?.projectDescription?.richText
                  ?.map((e) => e.plainText)
                  .toList()
                  .join(' ')
              : '';

      final relationType =
          e.propertiesObject?.relationType?.select?.name?.isNotEmpty ?? false
              ? e.propertiesObject?.relationType?.select?.name
              : '';

      final date =
          e.propertiesObject?.jobPosted?.createdTime?.isNotEmpty ?? false
              ? e.propertiesObject?.jobPosted?.createdTime
              : '';

      final freelance = Freelance(
        id: id,
        icon: icon,
        code: code,
        projectDescription: projectDescription,
        jobRequested: jobRequested,
        relationType: relationType,
        timing: timing,
        budget: budget,
        paymentTimes: paymentTimes,
        nda: nda,
        howToApply: howToApply,
        jobPosted: jobPosted,
        isSaved: savedIds.contains(id),
        date: Misc.parseDate(date ?? ''),
      );

      freelances.add(freelance);
    }).toList();

    return freelances;
  }

  Future<List<Recruitment>> getRecruitments() async {
    final List<String> savedIds =
        await storage.getStringList('SAVED_IDS') ?? [];
    final List<NotionObject>? recruitmentResponse =
        await api.jobPostingsRecruitment();

    List<Recruitment> recruitments = [];

    recruitmentResponse?.map((e) {
      final id = e.id;

      final icon = e.icon?.emoji ?? '';

      final name = e.propertiesObject?.name?.title.isNotEmpty ?? false
          ? e.propertiesObject?.name?.title
              .map((e) => e.plainText)
              .toList()
              .join(' ')
          : '';

      final company = e.propertiesObject?.company?.richText?.isNotEmpty ?? false
          ? e.propertiesObject?.company?.richText
              ?.map((e) => e.plainText)
              .toList()
              .join(' ')
          : '';

      final location =
          e.propertiesObject?.location?.richText?.isNotEmpty ?? false
              ? e.propertiesObject?.location?.richText
                  ?.map((e) => e.plainText)
                  .toList()
                  .join(' ')
              : '';

      final seniority =
          e.propertiesObject?.seniority?.select?.name?.isNotEmpty ?? false
              ? e.propertiesObject?.seniority?.select?.name
              : '';

      final ral = e.propertiesObject?.ral?.richText?.isNotEmpty ?? false
          ? e.propertiesObject?.ral?.richText
              ?.map((e) => e.plainText)
              .toList()
              .join(' ')
          : '';
      final contract =
          e.propertiesObject?.contract?.select?.name?.isNotEmpty ?? false
              ? e.propertiesObject?.contract?.select?.name
              : '';

      final team = e.propertiesObject?.team?.select?.name?.isNotEmpty ?? false
          ? e.propertiesObject?.team?.select?.name
          : '';

      final offerDescription =
          e.propertiesObject?.offerDescription?.richText?.isNotEmpty ?? false
              ? e.propertiesObject?.offerDescription?.richText
                  ?.map((e) => e.plainText)
                  .toList()
                  .join(' ')
              : '';
      final date =
          e.propertiesObject?.jobPosted?.createdTime?.isNotEmpty ?? false
              ? e.propertiesObject?.jobPosted?.createdTime
              : '';

      final howToApply =
          e.propertiesObject?.howToApply?.richText?.isNotEmpty ?? false
              ? e.propertiesObject?.howToApply?.richText
                  ?.map((e) => e.plainText)
                  .toList()
                  .join(' ')
              : '';

      final job = Recruitment(
        id: id,
        icon: icon,
        name: name,
        company: company,
        location: location,
        seniority: seniority,
        ral: ral,
        contract: contract,
        team: team,
        offerDescription: offerDescription,
        isSaved: savedIds.contains(id),
        howToApply: howToApply,
        date: Misc.parseDate(date ?? ''),
      );

      recruitments.add(job);
    }).toList();

    return recruitments;
  }
}
