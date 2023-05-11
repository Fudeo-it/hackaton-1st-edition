import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_style_text.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/separated_row.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';

class HiringJobOfferDetailTitle extends StatelessWidget {
  final HiringJobOffer hiringJobOffer;
  const HiringJobOfferDetailTitle({Key? key, required this.hiringJobOffer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? emoji = _buildEmoji(context);
    return Stack(
      children: [
        Positioned(
          top: emoji != null ? 40 : 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(color: Theme.of(context).colorScheme.tertiary)
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              emoji ?? const SizedBox(height: 20),
              _buildTitle(context),
              const SizedBox(height: 16),
              _buildMainInfoRow(context),
              const SizedBox(height: 20),
            ],
          ),
        )
      ],
    );
  }

  Widget? _buildEmoji(BuildContext context) {
    if(hiringJobOffer.emoji == null || hiringJobOffer.emoji!.isEmpty) return null;

    return Container(
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.tertiary
      ),
      child: Center(
        child: Text(hiringJobOffer.emoji!, style: const TextStyle(fontSize: 32))
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    if(hiringJobOffer.name == null || hiringJobOffer.name!.isEmpty) return const SizedBox();

    return MultiStyleText(
      items: hiringJobOffer.name!,
      baseStyle: Theme.of(context).textTheme.titleLarge,
      textAlign: TextAlign.center
    );
  }

  Widget _buildMainInfoRow(BuildContext context) {
    Widget? nomeAzienda = _buildNomeAzienda(context);
    Widget? localita = _buildLocalita(context);
    Widget? jobPosted = _buildJobPosted(context);

    return SeparatedRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      separatorBuilder: (context) => buildDot(context),
      children: [
        if(nomeAzienda != null) Expanded(child: nomeAzienda),
        if(localita != null) Expanded(child: localita),
        if(jobPosted != null) Expanded(child: jobPosted)
      ],
    );
  }

  Widget buildDot(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.primary
      )
    );
  }

  Widget? _buildNomeAzienda(BuildContext context) {
    if(hiringJobOffer.nomeAzienda == null || hiringJobOffer.nomeAzienda!.isEmpty) return null;

    return MultiStyleText(
      items: hiringJobOffer.nomeAzienda!,
      baseStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
      textAlign: TextAlign.center,
    );
  }

  Widget? _buildLocalita(BuildContext context) {
    if(hiringJobOffer.localita == null || hiringJobOffer.localita!.isEmpty) return null;

    return MultiStyleText(
      items: hiringJobOffer.localita!,
      baseStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
      textAlign: TextAlign.center,
    );
  }

  Widget? _buildJobPosted(BuildContext context) {
    if(hiringJobOffer.jobPosted == null) return null;

    return Text(DateFormat.yMd().format(hiringJobOffer.jobPosted!),
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
      textAlign: TextAlign.center,
    );
  }
}