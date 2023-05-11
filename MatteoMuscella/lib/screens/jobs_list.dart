import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:jobs_search/providers/main_provider.dart';
import 'package:jobs_search/widgets/bottom_navbar.dart';
import 'package:jobs_search/widgets/job_offers_list.dart';
import 'package:jobs_search/widgets/jobs_list_dev_buttons.dart';
import 'package:jobs_search/widgets/search_box.dart';
import 'package:jobs_search/widgets/settings_button.dart';
import 'package:provider/provider.dart';

import 'jobs_list_filters.dart';

class JobsList extends StatefulWidget {
  const JobsList({super.key});

  @override
  State<JobsList> createState() => _JobsListState();
}

class _JobsListState extends State<JobsList> {
  @override
  void initState() {
    super.initState();
    context.read<MainProvider>().loadJobOffers();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var hasError =
        context.select<MainProvider, bool>((provider) => provider.error);
    var nOfActiveFilters = context.select<MainProvider, int>((provider) => provider.filters.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fudeo Jobs'),
        elevation: 0,
        leading: const SettingsButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Builder(builder: (context) {
              return IconButton(
                onPressed: _showFiltersScreen,
                icon: Badge(
                  isLabelVisible: nOfActiveFilters > 0,
                  backgroundColor: Colors.blue.shade800,
                  label: Text('$nOfActiveFilters'),
                  child: const Icon(
                    Icons.filter_alt,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: Builder(builder: (context) {
        if (hasError) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              _makeErrorSnackBar(),
            );
          });
        }

        return SafeArea(
          child: Column(
            children: const [
              SearchBox(),
              JobsListDevButtons(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: JobOffersList(),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  SnackBar _makeErrorSnackBar() {
    return const SnackBar(
      content: Text('Errore nel caricamento dei dati!'),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.fixed,
      closeIconColor: Colors.white,
      showCloseIcon: true,
    );
  }

  void _showFiltersScreen() {
    Navigator.of(context)
        .push<Map<String, dynamic>>(
      MaterialPageRoute(
        builder: (context) => const JobsListFilters(),
      ),
    )
        .then((newFilters) {
      if (newFilters != null) {
        context.read<MainProvider>().setFilters(newFilters);
      }
    });
  }
}
