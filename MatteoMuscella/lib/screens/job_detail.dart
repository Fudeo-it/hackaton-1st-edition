import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/app_models.dart';
import '../providers/main_provider.dart';
import '../services/job_offer_render_utils.dart';
import '../widgets/notion_prop_widget.dart';

class JobOfferDetail extends StatelessWidget {
  final JobOffer jobOffer;

  const JobOfferDetail({Key? key, required this.jobOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dettagli annuncio'),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 16.0,
          right: 24.0,
          bottom: 16.0,
          left: 24.0,
        ),
        child: JobOfferDetailCard(jobOffer: jobOffer),
      ),
    );
  }
}

class JobOfferDetailCard extends StatelessWidget {
  final JobOffer jobOffer;

  const JobOfferDetailCard({super.key, required this.jobOffer});

  @override
  Widget build(BuildContext context) {
    var locale = context.read<MainProvider>().locale;

    var nodes = [...jobOffer.props.keys]
        .map((k) => NotionApiProp(k, jobOffer.props[k]))
        .toList();
    nodes.sort(JobOfferRenderUtils.jsonPropSorter);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [...nodes.map((p) => _createWidget(context, p, locale))],
      ),
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
            fontSize: 16,
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
      var text = JobOfferRenderUtils.parseCreatedTime(
          notionType, node['created_time'], locale);
      return NotionPropWidget(prop.name, text);
    }

    if (notionType == 'rich_text') {
      return _createRichTextWidget(context, prop.name, node['rich_text']);
    }

    if (notionType == 'url') {
      // L'url è quasi sempre null
      return const SizedBox.shrink();
    }

    return Text('${prop.name} $notionType');
  }

  Widget _createRichTextWidget(
      BuildContext context, String title, dynamic node) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: '',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            const TextSpan(text: ':\n'),
            ...node.map(
              (n) => _makeTextSpan(n),
            ),
          ],
        ),
      ),
    );
  }

  // TODO: Merge with NotionPropWidget
  TextSpan _makeTextSpan(n) {
    var text = n['text']['content'];

    if (text.startsWith('http')) {
      return TextSpan(
        text: text,
        style: const TextStyle(color: Colors.blue),
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            launchUrl(Uri.parse(text));
          },
      );
    }

    return TextSpan(
      text: text,
      style: TextStyle(
        fontWeight:
            n['annotations']['bold'] ? FontWeight.w600 : FontWeight.normal,
        fontStyle:
            n['annotations']['italic'] ? FontStyle.italic : FontStyle.normal,
      ),
    );
  }
}
