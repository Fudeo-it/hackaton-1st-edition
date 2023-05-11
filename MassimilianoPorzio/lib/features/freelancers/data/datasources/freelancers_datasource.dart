import 'package:job_app/features/freelancers/data/models/notion_response_dto_freelancers.dart';
import 'package:job_app/features/freelancers/domain/usecases/annunci_freelancer_params.dart';

abstract class FreelancersDatasource {
  Future<NotionResponseFreelancersDTO> fetchPrimaPaginaAnnunciFreelancers(
      AnnunciFreelancersParams params);
  Future<NotionResponseFreelancersDTO> fetchProssimaPaginaAnnunciFreelancers(
      String startCursor, AnnunciFreelancersParams params);
  Future<NotionResponseFreelancersDTO> fetchAnnuncioFreelancers(
      String annuncioId);
}
