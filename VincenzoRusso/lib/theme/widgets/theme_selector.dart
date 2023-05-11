import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/theme/cubit/theme_cubit.dart';

typedef ThemeSelectorWidgetBuilder = Widget Function(
    BuildContext context, ThemeMode theme);

class ThemeSelector extends StatelessWidget {
  final ThemeSelectorWidgetBuilder builder;

  const ThemeSelector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) => BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) => builder(
          context,
          state.light
              ? ThemeMode.light
              : state.dark
                  ? ThemeMode.dark
                  : ThemeMode.system,
        ),
      );
}
