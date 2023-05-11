part of 'dependency_injector.dart';

List<SingleChildWidget> _providers = [
  Provider<Logger>(
    create: (_) => Logger(),
  ),
  if (kDebugMode)
    Provider<PrettyDioLogger>(
      create: (_) => PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        compact: true,
      ),
    ),
  Provider<FlutterSecureStorage>(
    create: (_) => const FlutterSecureStorage(),
  ),
  Provider<Dio>(
    create: (context) => Dio()
      ..interceptors.addAll([
        AuthInterceptor(),
        if (kDebugMode) context.read<PrettyDioLogger>(),
      ]),
  ),
  Provider<JobService>(
    create: (context) => JobService(
      context.read<Dio>(),
      baseUrl: K.baseUrl,
    ),
  )
];
