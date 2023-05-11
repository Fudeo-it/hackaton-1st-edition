import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offerte_lavoro_flutter_app/cubits/dark_mode_cubit.dart';

class AppBarCustom extends StatelessWidget {
  final String content;
  const AppBarCustom(this.content, {super.key, bool darkModeEnabled = false});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, darkModeEnabled) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              padding: const EdgeInsets.all(8),
              child: const FlutterLogo(
                size: 30,
              ),
            ),
            Row(
              children: [
                Icon(
                  Icons.business_center_rounded,
                  size: 18,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    content,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondary,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: IconButton(
                  onPressed: () => context.read<DarkModeCubit>().toggle(),
                  icon: Icon(
                      darkModeEnabled ? Icons.wb_sunny : Icons.brightness_3),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
