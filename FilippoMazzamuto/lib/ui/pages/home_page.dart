import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/ui/pages/freelance/home_freelance_page.dart';
import 'package:offertelavoroflutter/ui/pages/recruitment/home_recruitment_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const route = '/'; 

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            HomeRecruitmentPage(),
            HomeFreelancePage(),
          ],
        ),
      ),
    );
  }
}