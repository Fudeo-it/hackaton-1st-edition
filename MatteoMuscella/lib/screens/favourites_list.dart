import 'package:flutter/material.dart';
import 'package:jobs_search/providers/main_provider.dart';
import 'package:jobs_search/widgets/bottom_navbar.dart';
import 'package:jobs_search/widgets/job_offers_list.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

class FavouritesList extends StatelessWidget {
  const FavouritesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var loading = context.watch<MainProvider>().loading;
    var jobOffers = context.watch<MainProvider>().getFavourites();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferiti'),
        elevation: 0,
      ),
      bottomNavigationBar: const BottomNavBar(),
      body: SafeArea(
        child: Center(
          child: Builder(builder: (context) {
            if (loading) {
              return SkeletonListView();
            }

            if (jobOffers.isEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: const [
                    Icon(Icons.favorite_outline, size: 55.0),
                    SizedBox(height: 15),
                    Text('Non hai elementi salvati tra i preferiti'),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  var jobOffer = jobOffers[index];
                  return JobOfferListCard(
                    jobOffer: jobOffer,
                    isFavourite: (_) => true,
                  );
                },
                itemCount: jobOffers.length,
              ),
            );
          }),
        ),
      ),
    );
  }
}
