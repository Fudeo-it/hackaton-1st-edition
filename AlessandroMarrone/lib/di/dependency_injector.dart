import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';
import 'package:offertelavoroflutter_it_app/blocs/job_offers/job_offers_bloc.dart';
import 'package:offertelavoroflutter_it_app/blocs/job_projects/job_projects_bloc.dart';
import 'package:offertelavoroflutter_it_app/blocs/splash_page_pref/splash_page_pref_bloc.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmark_save_cubit.dart';
import 'package:offertelavoroflutter_it_app/cubits/bookmarks_retrieve/bookmarks_retrieve_cubit.dart';
import 'package:offertelavoroflutter_it_app/cubits/share_job_cubit.dart';
import 'package:offertelavoroflutter_it_app/cubits/show_splash_page/show_splash_page_cubit.dart';
import 'package:offertelavoroflutter_it_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_it_app/repositories/local_storage_repository.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/job_projects_mapper.dart';
import 'package:offertelavoroflutter_it_app/repositories/share_job_repository.dart';
import 'package:offertelavoroflutter_it_app/services/local/local_storage_preferences_service.dart';
import 'package:offertelavoroflutter_it_app/services/network/jobs_services.dart';
import 'package:offertelavoroflutter_it_app/services/network/share_job_service.dart';
import 'package:offertelavoroflutter_it_app/services/network/url_launch_service.dart';
import 'package:offertelavoroflutter_it_app/themes/cubits/theme/theme_cubit.dart';
import 'package:offertelavoroflutter_it_app/repositories/mappers/job_offers_mapper.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'blocs.dart';
part 'mappers.dart';
part 'providers.dart';
part 'repositories.dart';

class Dependencyinjector extends StatelessWidget {
  final Widget child;
  const Dependencyinjector({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => DependencyInjectorHelper(
        mappers: _mappers,
        providers: _providers,
        repositories: _repositories,
        blocs: _blocs,
        child: child,
      );
}
