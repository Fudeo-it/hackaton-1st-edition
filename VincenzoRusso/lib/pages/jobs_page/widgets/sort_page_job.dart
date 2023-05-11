import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/models/enum/sort_type.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_and_sort_button.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

typedef SubmitSortCallback = Function(Sorts sorts);
typedef ChangeSortCallback = Function(SortType newValue);

class SortPageJob extends StatefulWidget {
  final SubmitSortCallback? onSubmitSort;
  final Sorts initialSorts;

  const SortPageJob({
    this.onSubmitSort,
    required this.initialSorts,
    super.key,
  });

  @override
  State<SortPageJob> createState() => _SortPageJobState();
}

class _SortPageJobState extends State<SortPageJob> {
  static const _teamKey = "Team";
  static const _nameKey = "Nome";
  static const _seniorityKey = "Seniority";
  static const _contractKey = "Contratto";
  static const _ralKey = "Retribuzione";

  Map<String, SortType> sortTitle = {
    _teamKey: SortType.descending,
    _nameKey: SortType.none,
    _seniorityKey: SortType.none,
    _contractKey: SortType.none,
    _ralKey: SortType.none,
  };

  @override
  void initState() {
    setState(() {
      sortTitle[_teamKey] = widget.initialSorts.team;
      sortTitle[_nameKey] = widget.initialSorts.name;
      sortTitle[_seniorityKey] = widget.initialSorts.seniority;
      sortTitle[_contractKey] = widget.initialSorts.contract;
      sortTitle[_ralKey] = widget.initialSorts.ral;
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
                      team: sortTitle[_teamKey] ?? SortType.none,
                      name: sortTitle[_nameKey] ?? SortType.none,
                      seniority: sortTitle[_seniorityKey] ?? SortType.none,
                      contract: sortTitle[_contractKey] ?? SortType.none,
                      ral: sortTitle[_ralKey] ?? SortType.none,
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
