import 'package:annunci_lavoro_flutter/blocs/jobAds/bloc/job_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/pages/freelance_ads_page.dart';
import 'package:annunci_lavoro_flutter/pages/job_ads_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/freelanceAds/bloc/freelance_ads_bloc.dart';

class TabView extends StatefulWidget {
  final TabController tabController;

  const TabView({
    super.key,
    required this.tabController,
  });

  @override
  State<TabView> createState() => _TabViewState();
}

class _TabViewState extends State<TabView> {
  @override
  void initState() {
    widget.tabController
        .addListener(() => _handleTabChange(widget.tabController.index));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: widget.tabController,
      children: const [
        JobAdsPage(),
        FreeLanceAdsPage(),
      ],
    );
  }

  /// resetta eventuali filtri applicati al cambio del tab.
  void _handleTabChange(int index) {
    if (index == 1) {
      BlocProvider.of<JobAdsBloc>(context).jobAdsController.resetFilter();
    } else if (index == 0) {
      BlocProvider.of<FreelanceAdsBloc>(context)
          .freeLanceAdsController
          .resetFilter();
    }
  }
}
