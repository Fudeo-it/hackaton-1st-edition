import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/app_models.dart';
import '../providers/main_provider.dart';

class JobsListFilters extends StatefulWidget {
  const JobsListFilters({super.key});

  @override
  State<JobsListFilters> createState() => _JobsListFiltersState();
}

class _JobsListFiltersState extends State<JobsListFilters> {
  final Map<String, dynamic> filtersInitialState = {
    'publishDate': PublishDate.none,
  };

  /// Holds filters in the form of Notion Property Name -> Value to fi
  late Map<String, dynamic> filters = filtersInitialState;

  @override
  void initState() {
    super.initState();

    var filtersFromProvider = context.read<MainProvider>().filters;
    filters = {...filtersFromProvider};
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Filters: $filters');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtra gli annunci'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: () {
                  Navigator.of(context).pop(filters);
                },
                icon: const Icon(Icons.check),
              );
            }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            filters = {...filtersInitialState};
          });
        },
        label: const Text('Rimuovi filtri'),
        icon: const Icon(Icons.delete_outline),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 24.0, right: 16.0, bottom: 16.0, left: 16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Data di pubblicazione',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CheckboxListTile(
                  value: filters['publishDate'] == PublishDate.thisWeek,
                  onChanged: (_) {
                    setFilter(
                        'publishDate', PublishDate.thisWeek, PublishDate.none);
                  },
                  title: const Text('Questa settimana'),
                ),
                CheckboxListTile(
                  value: filters['publishDate'] == PublishDate.lastWeek,
                  onChanged: (_) {
                    setFilter(
                        'publishDate', PublishDate.lastWeek, PublishDate.none);
                  },
                  title: const Text('Ultima settimana'),
                ),
                CheckboxListTile(
                  value: filters['publishDate'] == PublishDate.lastMonth,
                  onChanged: (_) {
                    setFilter(
                        'publishDate', PublishDate.lastMonth, PublishDate.none);
                  },
                  title: const Text('Ultimo mese'),
                ),
                CheckboxListTile(
                  value: filters['publishDate'] == PublishDate.last6Months,
                  onChanged: (_) {
                    setFilter('publishDate', PublishDate.last6Months,
                        PublishDate.none);
                  },
                  title: const Text('Ultimi 6 mesi'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setFilter(
      String filterKey, dynamic filterSelected, dynamic filterDeselected) {
    setState(() {
      if (filters.containsKey(filterKey)) {
        filters.remove(filterKey);
      } else {
        filters.putIfAbsent(filterKey, () => filterSelected);
      }
    });
  }
}
