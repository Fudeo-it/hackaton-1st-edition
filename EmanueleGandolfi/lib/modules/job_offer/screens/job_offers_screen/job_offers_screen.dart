import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/screens/freelance_job_offer_list_screen/freelance_job_offer_list_screen.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/screens/hiring_job_offer_list_screen/hiring_job_offer_list_screen.dart';
import 'package:offertelavoroflutter_app/modules/job_offer/enums/job_offer_type.dart';
import 'package:offertelavoroflutter_app/modules/job_offer/screens/job_offers_screen/bloc/job_offers_screen_bloc.dart';
import 'package:rxdart/rxdart.dart';

class JobOffersScreen extends StatelessWidget {
  static const animationsDuration = Duration(milliseconds: 700);
  const JobOffersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JobOffersScreenBloc(),
      child: const _JobOffersView(),
    );
  }
}

class _JobOffersView extends StatefulWidget {
  const _JobOffersView({Key? key}) : super(key: key);

  @override
  State<_JobOffersView> createState() => _JobOffersViewState();
}

class _JobOffersViewState extends State<_JobOffersView> {
  BehaviorSubject<bool> hiringScreenAnimationSubject = BehaviorSubject();
  BehaviorSubject<bool> freelanceScreenAnimationSubject = BehaviorSubject();
  late int activePageIndex;

  @override
  void initState() {
    super.initState();
    activePageIndex = _getPageIndex(JobOfferType.hiring);
    hiringScreenAnimationSubject.add(true);
  }

  @override
  void dispose() {
    hiringScreenAnimationSubject.close();
    freelanceScreenAnimationSubject.close();
    super.dispose();
  }

  int _getPageIndex(JobOfferType type) {
    switch(type) {
      case JobOfferType.hiring:
        return 0;
      case JobOfferType.freelance:
        return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JobOffersScreenBloc, JobOffersScreenState>(
      listener: (context, state) async {
        if(state.activeJobOfferType == JobOfferType.hiring) {
          freelanceScreenAnimationSubject.add(false); // hide the current list content
          await Future.delayed(JobOffersScreen.animationsDuration, () {}); // wait for the animation to finish
          setState(() { activePageIndex = _getPageIndex(state.activeJobOfferType); }); // switch current active list
          hiringScreenAnimationSubject.add(true); // show the new list content
        } else {
          hiringScreenAnimationSubject.add(false);
          await Future.delayed(JobOffersScreen.animationsDuration, () {});
          setState(() { activePageIndex = _getPageIndex(state.activeJobOfferType); });
          freelanceScreenAnimationSubject.add(true);
        }
      },
      child: IndexedStack(
        index: activePageIndex,
        children: [
          HiringJobOfferListScreen(
            animationStream: hiringScreenAnimationSubject.stream,
            onSwitchList: () => context.read<JobOffersScreenBloc>().add(const JobOffersScreenEvent.jobOfferTypeChanged(JobOfferType.freelance))
          ),
          FreelanceJobOfferListScreen(
            animationStream: freelanceScreenAnimationSubject.stream,
            onSwitchList: () => context.read<JobOffersScreenBloc>().add(const JobOffersScreenEvent.jobOfferTypeChanged(JobOfferType.hiring))
          )
        ],
      ),
    );
  }
}

