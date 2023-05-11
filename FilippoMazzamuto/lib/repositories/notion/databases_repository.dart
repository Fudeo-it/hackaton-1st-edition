import 'package:offertelavoroflutter/errors/network_error.dart';
import 'package:offertelavoroflutter/errors/repository_error.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/repositories/notion/mappers/freelance_page_mapper.dart';
import 'package:offertelavoroflutter/repositories/notion/mappers/recruitment_page_mapper.dart';
import 'package:offertelavoroflutter/services/network/notion/databases_service.dart';
import 'package:offertelavoroflutter/utils/extensions/enum_extension.dart';

class DatabasesRepository {
  final DatabasesService databasesService;
  final RecruitmentPageMapper recruitmentPageMapper;
  final FreelancePageMapper freelancePageMapper;

  const DatabasesRepository({
    required this.databasesService,
    required this.recruitmentPageMapper,
    required this.freelancePageMapper,
  });

  Future<Pagination> getJobOffers({
    required String offerType,
    Map<String, dynamic> params = const {}
  }) async {
    try {
      final TargetJobOffer targetJobOffer = TargetJobOffer.values.byName(offerType);
      final response = await databasesService.pages(targetJobOffer.toShortString(), params: params);
      return Pagination(
        results: response.results.map(
          targetJobOffer == TargetJobOffer.recruitment
          ? recruitmentPageMapper.toModel
          : freelancePageMapper.toModel
        ).toList(growable: false),
        nextCursor: response.nextCursor,
        hasMore: response.hasMore,
      );
    } on NetworkError catch (e) {
      throw RepositoryError(e.reasonPhrase);
    } catch(e) {
      throw RepositoryError();
    }
  }
}