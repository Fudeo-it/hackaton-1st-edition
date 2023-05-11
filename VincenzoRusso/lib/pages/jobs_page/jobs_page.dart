import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:offertelavoroflutter_app/blocs/freelance_list_bloc/freelance_list_bloc.dart';
import 'package:offertelavoroflutter_app/blocs/job_list_bloc/job_list_bloc.dart';
import 'package:offertelavoroflutter_app/misc/bubble_indicator_painter.dart';
import 'package:offertelavoroflutter_app/models/filters.dart';
import 'package:offertelavoroflutter_app/models/sorts.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/drawer_content.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/filter_and_sort.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/freelance_list.dart';
import 'package:offertelavoroflutter_app/pages/jobs_page/widgets/jobs_list.dart';
import 'package:offertelavoroflutter_app/repositories/job_repository.dart';
import 'package:offertelavoroflutter_app/theme/models/app_colors.dart';

typedef PageChanged = Function(int index);
typedef JobsPageState = _JobsPageState;

@RoutePage()
class JobsPage extends StatefulWidget with AutoRouteWrapper {
  final int initialPage;

  const JobsPage({
    super.key,
    required this.initialPage,
  });

  @override
  State<JobsPage> createState() => _JobsPageState();

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<JobListBloc>(
            create: (context) => JobListBloc(
              jobRepository: context.read<JobRepository>(),
            )..fetchFirstPageJobs(),
          ),
          BlocProvider<FreelanceListBloc>(
            create: (context) => FreelanceListBloc(
              jobRepository: context.read<JobRepository>(),
            )..fetchFreelance(),
          )
        ],
        child: this,
      );
}

class _JobsPageState extends State<JobsPage> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isFreelance = false;
  bool hasMoreJobs = false;
  bool hasMoreFreelance = false;
  Filters filtersJob = const Filters();
  Sorts sortsJob = const Sorts();
  Filters filtersFreelance = const Filters();
  Sorts sortsFreelance = const Sorts();

  final List<Widget> _pages = const [
    JobsList(),
    FreelanceList(),
  ];

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (widget.initialPage > 0 && widget.initialPage < _pages.length) {
          _pageController.jumpToPage(widget.initialPage);
        }
      },
    );

    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => MultiBlocListener(
        listeners: [
          BlocListener<JobListBloc, JobListState>(
            listener: (context, state) {
              if (state is FetchedJobListState) {
                setState(() {
                  hasMoreJobs = state.hasMore;
                  sortsJob = state.sorts;
                  filtersJob = state.filters;
                });
              }
            },
          ),
          BlocListener<FreelanceListBloc, FreelanceListState>(
            listener: (context, state) {
              if (state is FetchedFreelanceListState) {
                setState(() {
                  hasMoreFreelance = state.hasMore;
                  filtersFreelance = state.filters;
                  sortsFreelance = state.sorts;
                });
              }
            },
          ),
        ],
        child: Scaffold(
          endDrawer: const Drawer(
            child: DrawerContent(),
          ),
          body: NotificationListener<ScrollEndNotification>(
            onNotification: _onScrollJobsPage,
            child: NestedScrollView(
              physics: const BouncingScrollPhysics(),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () => context.router.pop(),
                    icon: const FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      size: 24.0,
                    ),
                  ),
                  expandedHeight: 100,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(
                      "Offerte",
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: AppColors.primaryLight,
                              ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: _SwitchButton(
                    controller: _pageController,
                    isFreelance: isFreelance,
                  ),
                ),
                SliverToBoxAdapter(
                  child: FilterAndSort(
                    isFreelance: isFreelance,
                    initialFilters: isFreelance ? filtersFreelance : filtersJob,
                    initialSorts: isFreelance ? sortsFreelance : sortsJob,
                    onSubmitFilter: (filters) => isFreelance
                        ? context
                            .read<FreelanceListBloc>()
                            .fetchFreelance(filters: filters)
                        : context
                            .read<JobListBloc>()
                            .fetchFirstPageJobs(filters: filters),
                    onSubmitSort: (sorts) => isFreelance
                        ? context
                            .read<FreelanceListBloc>()
                            .fetchFreelance(sorts: sorts)
                        : context
                            .read<JobListBloc>()
                            .fetchFirstPageJobs(sorts: sorts),
                  ),
                ),
              ],
              body: _PageViews(
                controller: _pageController,
                pages: _pages,
                onChangePage: (index) {
                  setState(
                    () {
                      if (index == 0) {
                        isFreelance = false;
                      } else if (index == 1) {
                        isFreelance = true;
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ),
      );

  bool _onScrollJobsPage(ScrollEndNotification scrollEnd) {
    final isBottom =
        scrollEnd.metrics.pixels == scrollEnd.metrics.maxScrollExtent;

    if (isBottom && (isFreelance ? hasMoreFreelance : hasMoreJobs)) {
      context.read<JobListBloc>().fetchMoreJobs();
    }

    return true;
  }
}

class _SwitchButton extends StatelessWidget {
  final PageController controller;
  final bool isFreelance;

  const _SwitchButton({
    required this.controller,
    this.isFreelance = false,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 24.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.primaryLight,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => CustomPaint(
              painter: BubbleIndicatorPainter(
                pageController: controller,
                dxTarget: ((constraints.maxWidth / 2) - 21),
                dxEntry: 21,
                dy: ((constraints.minHeight) + 21),
                radius: 21,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          'Assunzioni',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: isFreelance
                                        ? AppColors.primaryLight
                                        : AppColors.white,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => controller.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Text(
                          'Freelance',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: isFreelance
                                        ? AppColors.white
                                        : AppColors.primaryLight,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}

class _PageViews extends StatelessWidget {
  final PageController controller;
  final PageChanged onChangePage;
  final List<Widget> pages;

  const _PageViews({
    required this.controller,
    required this.onChangePage,
    required this.pages,
  });

  @override
  Widget build(BuildContext context) => PageView(
        onPageChanged: onChangePage,
        controller: controller,
        children: pages,
      );
}
