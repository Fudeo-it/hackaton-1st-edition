import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/models/enum/sort_type.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_and_sort_button.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/sort_page_job.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class SortPageFreelance extends StatefulWidget {
  final SubmitSortCallback? onSubmitSort;
  final Sorts initialSorts;

  const SortPageFreelance({
    this.onSubmitSort,
    required this.initialSorts,
    super.key,
  });

  @override
  State<SortPageFreelance> createState() => _SortPageFreelanceState();
}

class _SortPageFreelanceState extends State<SortPageFreelance> {
  static const _nameKey = "Nome";
  static const _ndaKey = "NDA";
  static const _relationshipKey = "Tipo di relazione";
  static const _timelinesKey = "Tempistiche";
  static const _paymentTimingKey = "Tempistiche di pagamento";
  static const _budgetKey = "Budget";

  Map<String, SortType> sortTitle = {
    _nameKey: SortType.none,
    _ndaKey: SortType.none,
    _relationshipKey: SortType.none,
    _timelinesKey: SortType.none,
    _paymentTimingKey: SortType.none,
    _budgetKey: SortType.none,
  };

  @override
  void initState() {
    setState(() {
      sortTitle[_nameKey] = widget.initialSorts.name;
      sortTitle[_ndaKey] = widget.initialSorts.nda;
      sortTitle[_relationshipKey] = widget.initialSorts.relationship;
      sortTitle[_timelinesKey] = widget.initialSorts.timelines;
      sortTitle[_paymentTimingKey] = widget.initialSorts.paymentTiming;
      sortTitle[_budgetKey] = widget.initialSorts.budget;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Ordina per:",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: AppColors.primaryLight,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
                IconButton(
                  onPressed: () => context.router.pop(),
                  icon: const FaIcon(
                    FontAwesomeIcons.solidCircleXmark,
                    color: AppColors.primaryLight,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sortTitle.length,
              itemBuilder: (context, index) => SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        sortTitle.keys.toList(growable: false)[index],
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: AppColors.primaryLight,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    _SortSwitch(
                      current: sortTitle.values.toList(growable: false)[index],
                      onChanged: (newValue) {
                        setState(() {
                          sortTitle[sortTitle.keys
                              .toList(growable: false)[index]] = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            FilterAndSortButton(
              textSubmit: "Ordina",
              onSubmit: () {
                if (widget.onSubmitSort != null) {
                  context.router.pop();
                  widget.onSubmitSort!(
                    Sorts(
                      name: sortTitle[_nameKey] ?? SortType.none,
                      nda: sortTitle[_ndaKey] ?? SortType.none,
                      relationship:
                          sortTitle[_relationshipKey] ?? SortType.none,
                      timelines: sortTitle[_timelinesKey] ?? SortType.none,
                      paymentTiming:
                          sortTitle[_paymentTimingKey] ?? SortType.none,
                      budget: sortTitle[_budgetKey] ?? SortType.none,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      );
}

class _SortSwitch extends StatelessWidget {
  static const double _heightSwitch = 40;

  final SortType current;
  final ChangeSortCallback onChanged;

  const _SortSwitch({
    required this.current,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => AnimatedToggleSwitch<SortType>.rolling(
        current: current,
        values: SortType.values,
        borderColor: AppColors.primaryLight,
        indicatorColor: AppColors.primaryLight,
        onChanged: onChanged,
        iconBuilder: (SortType value, Size iconSize, bool foreground) {
          IconData data = FontAwesomeIcons.circleHalfStroke;
          if (value == SortType.ascending) {
            data = FontAwesomeIcons.arrowUpLong;
          } else if (value == SortType.descending) {
            data = FontAwesomeIcons.arrowDownLong;
          } else if (value == SortType.none) {
            data = FontAwesomeIcons.xmark;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value.getString,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:
                          foreground ? AppColors.white : AppColors.primaryLight,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Icon(
                data,
                size: iconSize.shortestSide,
                color: foreground ? AppColors.white : AppColors.primaryLight,
              ),
            ],
          );
        },
        indicatorSize: const Size(
          double.infinity,
          _heightSwitch,
        ),
        height: _heightSwitch,
      );
}
