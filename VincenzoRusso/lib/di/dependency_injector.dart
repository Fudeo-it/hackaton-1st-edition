import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/favourite_job_bloc/favourite_job_bloc.dart';
import 'package:offertelavoroflutter_app/repositories/favourite_repository.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/filters_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/freelance_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/job_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/mapper/sorts_mapper.dart';
import 'package:offertelavoroflutter_app/repositories/url_launcher_repository.dart';
import 'package:offertelavoroflutter_app/services/network/interceptors/auth_interceptor.dart';
import 'package:offertelavoroflutter_app/services/network/job_service.dart';
import 'package:offertelavoroflutter_app/theme/cubit/theme_cubit.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:logger/logger.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:offertelavoroflutter_app/misc/constants.dart';

part 'blocs.dart';
part 'mappers.dart';
part 'providers.dart';
part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        mappers: _mappers,
        providers: _providers,
        repositories: _repositories,
        blocs: _blocs,
        child: child,
      );
}
