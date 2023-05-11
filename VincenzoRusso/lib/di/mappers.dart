part of 'dependency_injector.dart';

List<SingleChildWidget> _mappers = [
  Provider<JobMapper>(
    create: (_) => JobMapper(),
  ),
  Provider<FreelanceMapper>(
    create: (_) => FreelanceMapper(),
  ),
  Provider<FiltersMapper>(
    create: (_) => FiltersMapper(),
  ),
  Provider<SortsMapper>(
    create: (_) => SortsMapper(),
  )
];
