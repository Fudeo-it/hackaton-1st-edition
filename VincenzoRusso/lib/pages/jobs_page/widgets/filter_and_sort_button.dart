import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/widgets/job_flutter_button.dart';

class FilterAndSortButton extends StatelessWidget {
  final GestureTapCallback? onSubmit;
  final String textSubmit;

  const FilterAndSortButton({
    super.key,
    required this.textSubmit,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
            child: JobFlutterButton(
              outlined: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                "Esci",
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryLight,
                    ),
              ),
              onPressed: () => context.router.pop(),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: JobFlutterButton(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              onPressed: onSubmit,
              child: Text(
                textSubmit,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
              ),
            ),
          ),
        ],
      );
}
