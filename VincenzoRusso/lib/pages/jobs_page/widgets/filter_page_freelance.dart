import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/models/enum/relationship.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_and_sort_button.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_page_job.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

class FilterPageFreelance extends StatefulWidget {
  final SubmitFilterCallback? onSubmitFilter;
  final Filters initialFilters;

  const FilterPageFreelance({
    super.key,
    this.onSubmitFilter,
    required this.initialFilters,
  });

  @override
  State<FilterPageFreelance> createState() => _FilterPageFreelanceState();
}

class _FilterPageFreelanceState extends State<FilterPageFreelance> {
  List<Relationship> _relationshipFilter = [];
  List<String> _ndaFilter = [];

  List<Relationship> get relationshipValues => Relationship.values
      .where((e) => e != Relationship.undefined)
      .toList(growable: false);
  List<String> get ndaValues => ["Sì", "No"];

  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    setState(() {
      if (widget.initialFilters.codeFilter.isNotEmpty) {
        searchController.text = widget.initialFilters.codeFilter;
      }

      if (widget.initialFilters.relationshipFilter.isNotEmpty) {
        _relationshipFilter = widget.initialFilters.relationshipFilter;
      }

      if (widget.initialFilters.ndaFilter.isNotEmpty) {
        _ndaFilter = widget.initialFilters.ndaFilter;
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
              "Tipo di relazione",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryLight,
                  ),
            ),
            SizedBox(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: relationshipValues.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 4.0),
                itemBuilder: (context, index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(relationshipValues[index].getString),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fillColor: const MaterialStatePropertyAll(
                          AppColors.primaryLight),
                      value: _relationshipFilter
                          .contains(relationshipValues[index]),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            if (value) {
                              _relationshipFilter
                                  .add(relationshipValues[index]);
                            } else {
                              _relationshipFilter
                                  .remove(relationshipValues[index]);
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
              "NDA",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: AppColors.primaryLight,
                  ),
            ),
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: ndaValues.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 4.0),
                itemBuilder: (context, index) => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(ndaValues[index]),
                    ),
                    Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      fillColor: const MaterialStatePropertyAll(
                          AppColors.primaryLight),
                      value: _ndaFilter.contains(ndaValues[index]),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            if (value) {
                              _ndaFilter.add(ndaValues[index]);
                            } else {
                              _ndaFilter.remove(ndaValues[index]);
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
                      codeFilter: searchController.text,
                      relationshipFilter: _relationshipFilter,
                      ndaFilter: _ndaFilter,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      );
}
