import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobs_search/models/app_models.dart';
import 'package:jobs_search/providers/main_provider.dart';
import 'package:jobs_search/screens/job_detail.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import '../services/job_offer_render_utils.dart';
import 'notion_prop_widget.dart';

class JobOffersList extends StatelessWidget {
  const JobOffersList({super.key});

  @override
  Widget build(BuildContext context) {
    var loading = context.watch<MainProvider>().loading;
    var jobOffers = context.watch<MainProvider>().getJobOffers();
    var favourites = context.watch<MainProvider>().favourites;
    var hasMore = context.watch<MainProvider>().hasMore();

    if (loading) {
      return SkeletonListView();
    }

    if (jobOffers.isEmpty) {
      return const JobOffersEmpty();
    }

    return NotificationListener<ScrollEndNotification>(
      onNotification: (notification) {
        if (notification.metrics.atEdge && notification.metrics.pixels > 0.0) {
          context.read<MainProvider>().fetchJobOffers(fetchMore: true);
        }
        return true;
      },
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          var jobOffer = jobOffers[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JobOfferListCard(
                jobOffer: jobOffer,
                isFavourite: (id) => favourites.contains(id),
              ),
              hasMore || index < (jobOffers.length - 1)
                  ? const SizedBox.shrink()
                  : Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 30.0),
                      child: Text(
                          '${jobOffers.length} risultat${jobOffers.length > 1 ? 'i' : 'o'}'),
                    ),
            ],
          );
        },
        itemCount: jobOffers.length,
      ),
    );
  }
}

class JobOfferListCard extends StatelessWidget {
  final JobOffer jobOffer;
  final bool Function(String) isFavourite;

  const JobOfferListCard({
    super.key,
    required this.jobOffer,
    required this.isFavourite,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => JobOfferDetail(jobOffer: jobOffer),
          ),
        );
      },
      child: Card(
        elevation: 6.0,
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: _createContent(context),
              ),
              Expanded(
                flex: 1,
                child: _createFavouriteIcon(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createFavouriteIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: IconButton(
        onPressed: () {
          HapticFeedback.heavyImpact();
          context.read<MainProvider>().toggleFavourite(jobOffer.id);
        },
        icon: Icon(
          isFavourite(jobOffer.id) ? Icons.favorite : Icons.favorite_border,
          color: Colors.redAccent,
        ),
      ),
    );
  }

  Widget _createContent(BuildContext context) {
    var locale = context.read<MainProvider>().locale;

    var nodes = [...jobOffer.props.keys]
        .map((k) => NotionApiProp(k, jobOffer.props[k]))
        .toList();
    nodes.sort(JobOfferRenderUtils.jsonPropSorter);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [...nodes.map((p) => _createWidget(context, p, locale))],
    );
  }

  Widget _createWidget(
      BuildContext context, NotionApiProp prop, String locale) {
    var node = prop.node;
    var notionType = node['type'];

    if (notionType == 'title') {
      var text = JobOfferRenderUtils.parsePlainText(notionType, node['title']);

      if (text.isEmpty) {
        return const SizedBox.shrink();
      }

      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      );
    }

    if (notionType == 'select') {
      var text = JobOfferRenderUtils.parseSelect(notionType, node['select']);

      if (text.isEmpty) {
        return const SizedBox.shrink();
      }

      return NotionPropWidget(prop.name, text);
    }

    if (notionType == 'created_time') {
      var text = JobOfferRenderUtils.parseCreatedTime(notionType, node['created_time'], locale);
      return NotionPropWidget(prop.name, text);
    }

    if (notionType == 'rich_text') {
      var text = JobOfferRenderUtils.parsePlainText(notionType, node['rich_text']);

      if (text.isEmpty || text.length > 50) {
        return const SizedBox.shrink();
      }

      return NotionPropWidget(prop.name, text, separator: ':\n');
    }

    if (notionType == 'url') {
      // L'url è quasi sempre null
      return const SizedBox.shrink();
    }

    return Text('${prop.name} $notionType');
  }
}

class JobOffersEmpty extends StatelessWidget {
  const JobOffersEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: const [
          Icon(Icons.info_outlined, size: 55.0),
          SizedBox(height: 15),
          Text('Nessun dato disponibile'),
        ],
      ),
    );
  }
}
