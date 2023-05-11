part of 'dependency_injector.dart';

final List<SingleChildWidget> _mappers = [
  Provider<JobOffersMapper>(
    create: (_) => JobOffersMapper(),
  ),
  Provider<JobProjectsMapper>(
    create: (_) => JobProjectsMapper(),
  ),
];
