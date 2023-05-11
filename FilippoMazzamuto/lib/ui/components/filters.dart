import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/blocs/job_offers/job_offers_bloc.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/models/job_offer_entries.dart';
import 'package:offertelavoroflutter/ui/components/drop_down_list.dart';
import 'package:offertelavoroflutter/utils/extensions/string_extension.dart';

class Filters extends StatefulWidget {
  const Filters({
    super.key,
    required this.targetJobOffer,
  });

  final TargetJobOffer targetJobOffer;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  Direction sortDirection = Direction.ascending; // default value

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return BlocBuilder<JobOffersBloc, JobOffersState>(
      builder: (context, state) {
        if (state.status == JobOffersStatus.success) {
          return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Sort by property
                        DropDownList(
                          onEvent: (dynamic propertyName) => {
                            context.read<JobOffersBloc>().add(JobOffersSortFilterChanged(
                              propertyFilter: propertyName,
                              sortDirection: sortDirection,
                            ))
                          },
                          attributeName: l10n.sortBy,
                          icon: const Icon(Icons.list),
                          enableMultipleSelection: false,
                          listOfAttribute: state.propertyNames.map(
                            (name) => SelectedListItem(
                              name: name,
                              value: name,
                              isSelected: false,
                            ),
                          ).toList(growable: false),
                        ),
                        // Sort type
                        DropDownList(
                          onEvent: _handleEventSortDirection,
                          attributeName: l10n.sort,
                          icon: Icon(
                            sortDirection == Direction.ascending
                              ? Icons.north_rounded
                              : Icons.south_rounded
                          ),
                          listOfAttribute: state.sortDirection.map(
                            (name) => SelectedListItem(
                              name: name.capitalize(),
                              value: name,
                              isSelected: false,
                            ),
                          ).toList(growable: false),
                        ),
                        // Filter database entries
                        ...filters(state),
                      ],
                    ),
                  ),
                  // view sort filters applied
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Wrap(
                      spacing: MediaQuery.of(context).size.width * 0.05,
                      runSpacing: 8,
                      children: List.generate(
                        state.allActiveFilters.length,
                        (index) => Chip(
                          onDeleted: () => {
                            context.read<JobOffersBloc>().add(JobOffersFilterDeleted(
                              filter: state.allActiveFilters[index]
                            )),
                          },
                          label: labelFilter(state, index),
                          avatar: avatarFilter(state, index),
                          backgroundColor: Colors.grey.shade400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const SliverToBoxAdapter();
      },
    );
  }

  void _handleEventSortDirection(dynamic actualDirection) {
    setState(() => sortDirection = Direction.values.byName(actualDirection));
  }

  List<Widget> filters(JobOffersState state) {
    Map<String, List<String>> filter;
    switch(widget.targetJobOffer) {
      case TargetJobOffer.recruitment:
        filter = state.recruitmentFilter;
        break;
      case TargetJobOffer.freelance:
        filter = state.freelanceFilter;
        break;
    }
    return filter.entries.map((entry) {
      return DropDownList(
        onEvent: (dynamic values) => {
          context.read<JobOffersBloc>().add(JobOffersFilterChanged(
            values: values,
            field: entry.key
          ))
        },
        attributeName: entry.key,
        icon: const Icon(Icons.list),
        enableMultipleSelection: true,
        listOfAttribute: List.generate(
        entry.value.length,
        (index) => SelectedListItem(
          name: entry.value[index],
          value: entry.value[index],
          isSelected: state.allActiveFilters.whereType<DatabaseEntries>()
          .any((activeFilter) =>
            (activeFilter.value as SelectValue).value == entry.value[index]
          ),
        )),
      );
    }).toList(growable: false);
  }

  Widget labelFilter(JobOffersState state, int index) {
    String label = '';
    dynamic filter = state.allActiveFilters[index];
    if(filter is Sort) {
      label = filter.property ?? '';
    } else if (filter is DatabaseEntries) {
      label = (filter.value as SelectValue).value ?? '';
    }
    return Text(label);
  }

  Widget? avatarFilter(JobOffersState state, int index) {
    dynamic filter = state.allActiveFilters[index];
    if(filter is Sort) {
      return Icon(
      state.entries.sorts[index].direction == Direction.ascending
      ? Icons.north_rounded
      : Icons.south_rounded
    );
    }
    return null;
  }
}