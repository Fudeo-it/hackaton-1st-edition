part of 'dependency_injector.dart';

List<BlocProvider> _blocs = [
  BlocProvider<ThemeCubit>(
    create: (context) => ThemeCubit(),
  ),
  BlocProvider<FavouriteJobBloc>(
    create: (context) => FavouriteJobBloc(
      context.read<FavouriteRepository>(),
    ),
  ),
];
