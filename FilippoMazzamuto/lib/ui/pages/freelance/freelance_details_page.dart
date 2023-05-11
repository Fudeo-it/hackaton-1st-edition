import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/ui/components/action_button_save_job_offer.dart';
import 'package:offertelavoroflutter/ui/theme/colors.dart';
import 'package:offertelavoroflutter/utils/extensions/string_extension.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class FreelanceDetailsPage extends StatefulWidget {
  const FreelanceDetailsPage({
    super.key,
    required this.args,
  });

  final FreelancePageArgs args;

  static const route = '/freelance/details';

  @override
  State<FreelanceDetailsPage> createState() => _FreelanceDetailsPageState();
}

class _FreelanceDetailsPageState extends State<FreelanceDetailsPage> {
  @override
  void initState() {
    super.initState();
    timeago.setLocaleMessages('it', timeago.ItMessages());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeColors.primaryDark,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Share.share('${l10n.shareJobOffer} ${widget.args.freelance.url}'),
            icon: const Icon(Icons.share),
          ),
          ActionButtonSaveJobOffer(
            jobOffer: widget.args.freelance,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              _headerTop(),
              const SizedBox(height: 50),
              _description(
                title: l10n.descriptionProject,
                defaultMessage: l10n.notSpecified,
                listDescription: widget.args.freelance.projectDescription,
              ),
              const SizedBox(height: 30),
              _description(
                title: l10n.jobRequest,
                defaultMessage: l10n.notSpecified,
                listDescription: widget.args.freelance.workRequest
              ),
              const SizedBox(height: 30),
              _simpleDescription(
                title: l10n.relationshipType,
                defaultMessage: l10n.notSpecified,
                description: widget.args.freelance.relationshipType?.text
              ),
              const SizedBox(height: 30),
              _description(
                title: l10n.timing,
                defaultMessage: l10n.notSpecified,
                listDescription: widget.args.freelance.timing
              ),
              const SizedBox(height: 30),
              _description(
                title: l10n.budget,
                defaultMessage: l10n.notSpecified,
                listDescription: widget.args.freelance.budget
              ),
              const SizedBox(height: 30),
              _description(
                title: l10n.paymentTimes,
                defaultMessage: l10n.notSpecified,
                listDescription: widget.args.freelance.paymentTimes
              ),
              const SizedBox(height: 30),
               _simpleDescription(
                title: l10n.nda,
                defaultMessage: l10n.notSpecified,
                description: widget.args.freelance.nda?.text
              ),
              const SizedBox(height: 30),
              _applyForAJob(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerTop() => Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              widget.args.freelance.name ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.args.freelance.posted != null
                    ? timeago.format(widget.args.freelance.posted!, locale: 'it')
                    : ''
                  )
                ),
              ],
            ),
          ],
        ),
      ),
      Positioned.fill(
        top: -50,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Text(
              widget.args.freelance.image ?? '',
              style: const TextStyle(
                fontSize: 80,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  Widget _description({
    required String title,
    String defaultMessage = '',
    required List<Description>? listDescription,
  }) {
    List<Text> description = (listDescription ?? []).map((e) {
      return Text(
        e.text,
        style: TextStyle(
          fontWeight: e.annotations.bold ? FontWeight.bold : null,
          height: 1.5
        ),
      );
    }).toList();
    if (description.isEmpty) {
      description = [Text(defaultMessage)];
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 10,),
        ...description,
      ],
    );
  }

  Widget _applyForAJob() {
    final String? candidature = widget.args.freelance.candidature;
    if (candidature == null) {
      return const SizedBox();
    }
    if (candidature.isUrl()) {
      return TextButton(
        onPressed: () async {
          final Uri url = Uri.parse(widget.args.freelance.candidature!);
          if (!await launchUrl(url)) {
            throw Exception('Could not launch $url');
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        child: const Text(
          'Candidati',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18
          ),
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Come candidarsi',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600
            ),
          ),
          const SizedBox(height: 20),
          Text(candidature)
        ],
      );
    }
  }

  Widget _simpleDescription({
    required String title,
    String defaultMessage = '',
    required String? description,
  }) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),
      ),
      const SizedBox(height: 10,),
      Text(defaultMessage),
    ],
  );
}

/// Class support args routing
class FreelancePageArgs {
  final Freelance freelance;

  const FreelancePageArgs({
    required this.freelance,
  });
}