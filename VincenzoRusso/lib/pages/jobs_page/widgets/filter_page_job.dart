import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/models/enum/contract_type.dart';
import 'package:offertelavoroflutter_app/models/enum/seniority.dart';
import 'package:offertelavoroflutter_app/models/enum/team_location.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_and_sort_button.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

typedef SubmitFilterCallback = Function(Filters filters);

class FilterPageJob extends StatefulWidget {
  final SubmitFilterCallback? onSubmitFilter;
  final Filters initialFilters;

  const FilterPageJob({
    super.key,
    this.onSubmitFilter,
    required this.initialFilters,
  });

  @override
  State<FilterPageJob> createState() => _FilterPageJobState();
}

class _FilterPageJobState extends State<FilterPageJob> {
  List<TeamLocation> _teamFilter = [];
  List<Seniority> _seniorityFilter = [];
  List<ContractType> _contractFilter = [];

  List<TeamLocation> get teamValues => TeamLocation.values
      .where((e) => e != TeamLocation.undefined)
      .toList(growable: false);
  List<Seniority> get seniorityValues => Seniority.values
      .where((e) => e != Seniority.undefined)
      .toList(growable: false);
  List<ContractType> get contractValues => ContractType.values
      .where((e) => e != ContractType.undefined)
      .toList(growable: false);

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    setState(() {
      if (widget.initialFilters.textFilter.isNotEmpty) {
        searchController.text = widget.initialFilters.textFilter;
      }

      if (widget.initialFilters.teamFilter.isNotEmpty) {
        _teamFilter = widget.initialFilters.teamFilter;
      }

      if (widget.initialFilters.seniorityFilter.isNotEmpty) {
        _seniorityFilter = widget.initialFilters.seniorityFilter;
      }

      if (widget.initialFilters.contractFilter.isNotEmpty) {
        _contractFilter = widget.initialFilters.contractFilter;
      }
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
            TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Digita per cercare",
                prefixIcon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 14.0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              "Team",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryLight,
                  ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: teamValues.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 4.0),
                itemBuilder: (context, index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(teamValues[index].getString),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fillColor: const MaterialStatePropertyAll(
                          AppColors.primaryLight),
                      value: _teamFilter.contains(teamValues[index]),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            if (value) {
                              _teamFilter.add(teamValues[index]);
                            } else {
                              _teamFilter.remove(teamValues[index]);
                            }
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Seniority",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryLight,
                  ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: seniorityValues.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 4.0),
                itemBuilder: (context, index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(seniorityValues[index].getString),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fillColor: const MaterialStatePropertyAll(
                          AppColors.primaryLight),
                      value: _seniorityFilter.contains(seniorityValues[index]),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            if (value) {
                              _seniorityFilter.add(seniorityValues[index]);
                            } else {
                              _seniorityFilter.remove(seniorityValues[index]);
                            }
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              "Contratto",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryLight,
                  ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: contractValues.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 4.0),
                itemBuilder: (context, index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(contractValues[index].getString),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fillColor: const MaterialStatePropertyAll(
                          AppColors.primaryLight),
                      value: _contractFilter.contains(contractValues[index]),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            if (value) {
                              _contractFilter.add(contractValues[index]);
                            } else {
                              _contractFilter.remove(contractValues[index]);
                            }
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24.0),
            FilterAndSortButton(
              textSubmit: "Filtra",
              onSubmit: () {
                if (widget.onSubmitFilter != null) {
                  context.router.pop();
                  widget.onSubmitFilter!(
                    Filters(
                      textFilter: searchController.text,
                      teamFilter: _teamFilter,
                      seniorityFilter: _seniorityFilter,
                      contractFilter: _contractFilter,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      );
}
