import 'annuncio_freelancers_model.dart';

class NotionResponseFreelancersDTO {
  bool hasMore;
  String? nextCursor;
  List<AnnuncioFreelancersModel> listaAnnunci;

  factory NotionResponseFreelancersDTO.empty() => NotionResponseFreelancersDTO(
        hasMore: false,
        listaAnnunci: [],
      );

  NotionResponseFreelancersDTO({
    this.hasMore = true,
    this.nextCursor,
    required this.listaAnnunci,
  });

  bool get isEmpty => listaAnnunci.isEmpty;
}
