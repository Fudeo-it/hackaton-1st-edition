import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/models/job_offer.dart';
import 'package:offertelavoroflutter/ui/components/action_button_save_job_offer.dart';
import 'package:offertelavoroflutter/ui/theme/colors.dart';
import 'package:offertelavoroflutter/utils/extensions/string_extension.dart';
import 'package:share_plus/share_plus.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class RecruitmentDetailsPage extends StatefulWidget {
  const RecruitmentDetailsPage({
    super.key,
    required this.args,
  });

  final RecruitmentPageArgs args;

  static const route = '/recruitment/details';

  @override
  State<RecruitmentDetailsPage> createState() => _RecruitmentDetailsPageState();
}

class _RecruitmentDetailsPageState extends State<RecruitmentDetailsPage> {
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
        title: Text(widget.args.recruitment.companyName?.firstOrNull?.text ?? ''),
        actions: [
          IconButton(
            onPressed: () => Share.share('${l10n.shareJobOffer} ${widget.args.recruitment.url}'),
            icon: const Icon(Icons.share),
          ),
          ActionButtonSaveJobOffer(
            jobOffer: widget.args.recruitment,
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
              const SizedBox(height: 30),
              _infoJobOffer(l10n),
              const SizedBox(height: 50),
              _description(
                defaultMessage: l10n.notSpecified,
                title: l10n.pay,
                listDescription: widget.args.recruitment.pay
              ),
              const SizedBox(height: 30),
              _description(
                defaultMessage: l10n.notSpecified,
                title: l10n.description,
                listDescription: widget.args.recruitment.offerDescription
              ),
              const SizedBox(height: 30),
              _applyForAJob(l10n),
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
              widget.args.recruitment.name ?? '',
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
                Flexible(child: Text(widget.args.recruitment.companyName?.firstOrNull?.text ?? '')),
                const Icon(Icons.circle, size: 8, color: Colors.grey),
                Flexible(child: Text(widget.args.recruitment.locality?.firstOrNull?.text ?? '')),
                const Icon(Icons.circle, size: 8, color: Colors.grey),
                Flexible(
                  child: Text(
                    widget.args.recruitment.posted != null
                    ? timeago.format(widget.args.recruitment.posted!, locale: 'it')
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
              widget.args.recruitment.image ?? '',
              style: const TextStyle(
                fontSize: 80,
              ),
            ),
          ),
        ),
      ),
    ],
  );

  Widget _infoJobOffer(AppLocalizations l10n) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: widget.args.recruitment.team?.color
              ),
              child: const Icon(
                Icons.group_outlined,
                size: 50,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.team,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.args.recruitment.team?.text ?? ''),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: widget.args.recruitment.contract?.color
              ),
              child: const Icon(
                Icons.access_time_outlined,
                size: 50,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.contract,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.args.recruitment.contract?.text ?? ''),
          ],
        ),
      ),
      Expanded(
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: widget.args.recruitment.seniority?.color
              ),
              child: const Icon(
                Icons.chair_outlined,
                size: 50,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              l10n.seniority,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16
              ),
            ),
            const SizedBox(height: 10),
            Text(widget.args.recruitment.seniority?.text ?? ''),
          ],
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

  Widget _applyForAJob(AppLocalizations l10n) {
    final String? candidature = widget.args.recruitment.candidature;
    if (candidature == null) {
      return const SizedBox();
    }
    if (candidature.isUrl()) {
      return TextButton(
        onPressed: () async {
          final Uri url = Uri.parse(widget.args.recruitment.candidature!);
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
        child: Text(
          l10n.candidates,
          style: const TextStyle(
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
          Text(
            l10n.howToApply,
            style: const TextStyle(
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

}

/// Class support args routing
class RecruitmentPageArgs {
  final Recruitment recruitment;

  const RecruitmentPageArgs({
    required this.recruitment,
  });
}