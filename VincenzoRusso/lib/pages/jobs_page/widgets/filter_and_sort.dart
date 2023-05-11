import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_page_freelance.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_page_job.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/sort_page_freelance.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/sort_page_job.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';
import 'package:offertelavoroflutter_app/widgets/job_flutter_button.dart';

class FilterAndSort extends StatelessWidget {
  final SubmitFilterCallback? onSubmitFilter;
  final SubmitSortCallback? onSubmitSort;
  final Filters initialFilters;
  final Sorts initialSorts;
  final bool isFreelance;

  const FilterAndSort({
    super.key,
    this.onSubmitFilter,
    this.onSubmitSort,
    required this.initialFilters,
    required this.initialSorts,
    this.isFreelance = false,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                JobFlutterButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    "Filtra",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                  ),
                  onPressed: () => showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24.0),
                      ),
                    ),
                    context: context,
                    builder: (context) => isFreelance
                        ? FilterPageFreelance(
                            initialFilters: initialFilters,
                            onSubmitFilter: onSubmitFilter,
                          )
                        : FilterPageJob(
                            initialFilters: initialFilters,
                            onSubmitFilter: onSubmitFilter,
                          ),
                  ),
                ),
                const SizedBox(width: 8.0),
                JobFlutterButton(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 4.0,
                  ),
                  child: Text(
                    "Ordina",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.white,
                        ),
                  ),
                  onPressed: () => showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24.0),
                      ),
                    ),
                    context: context,
                    builder: (context) => isFreelance
                        ? SortPageFreelance(
                            initialSorts: initialSorts,
                            onSubmitSort: onSubmitSort,
                          )
                        : SortPageJob(
                            initialSorts: initialSorts,
                            onSubmitSort: onSubmitSort,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
