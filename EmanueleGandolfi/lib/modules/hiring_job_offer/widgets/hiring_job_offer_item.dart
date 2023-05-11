import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/content_card.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/select_option_badge.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_style_text.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/separated_row.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';

class HiringJobOfferItem extends StatelessWidget {
  final HiringJobOffer hiringJobOffer;
  final Function() onTap;
  final Function() onFavoriteTap;
  final bool isFavorite;
  final String? heroTag;
  const HiringJobOfferItem({Key? key, required this.hiringJobOffer, required this.onTap,
    required this.onFavoriteTap, required this.isFavorite, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag ?? hiringJobOffer.id,
      child: Material( // needed for hero animation to work correctly
        type: MaterialType.transparency,
        child: Stack(
          children: [
            ContentCard(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildEmoji(context),
                      const SizedBox(width: 8),
                      Expanded(child: _buildMainInfo(context)),
                      const SizedBox(width: 24)
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildBadges(context),
                  const SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: _buildJobPosted(context)),
                      Expanded(child: _buildRetribuzione(context)),
                    ],
                  )
                ],
              ),
            ),
            _buildFavoriteIcon(context)
          ],
        ),
      ),
    );
  }

  Widget _buildEmoji(BuildContext context) {
    if(hiringJobOffer.emoji == null || hiringJobOffer.emoji!.isEmpty) return const SizedBox();

    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.background
      ),
      child: Center(
        child: Text(hiringJobOffer.emoji!, style: const TextStyle(fontSize: 18))
      ),
    );
  }

  Widget _buildMainInfo(BuildContext context) {
    return ConstrainedBox( // needed to center vertically the text when the località is not available
      constraints: const BoxConstraints(minHeight: 38),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            const SizedBox(height: 4),
            _buildLocalita(context)
          ],
        ),
      ),
    );
  }
  
  Widget _buildTitle(BuildContext context) {
    if(hiringJobOffer.name == null || hiringJobOffer.name!.isEmpty) return const SizedBox();

    return MultiStyleText(items: hiringJobOffer.name!, baseStyle: Theme.of(context).textTheme.titleSmall);
  }

  Widget _buildLocalita(BuildContext context) {
    if(hiringJobOffer.localita == null || hiringJobOffer.localita!.isEmpty) return const SizedBox();

    return MultiStyleText(items: hiringJobOffer.localita!, baseStyle: Theme.of(context).textTheme.bodyMedium);
  }

  Widget _buildFavoriteIcon(BuildContext context) {
    return Positioned(
      top: 6,
      right: 24,
      child: IconButton(
        splashColor: Colors.transparent,
        onPressed: onFavoriteTap,
        icon: SvgPicture.asset(isFavorite ? 'assets/icons/bookmark-filled.svg' : 'assets/icons/bookmark.svg',
          colorFilter: ColorFilter.mode(Theme.of(context).textTheme.bodyMedium!.color!, BlendMode.srcIn)
        ),
      ),
    );
  }

  Widget _buildBadges(BuildContext context) {
    return SeparatedRow(
      children: [
        if(hiringJobOffer.team != null) Expanded(child: SelectOptionBadge(selectOption: hiringJobOffer.team!)),
        if(hiringJobOffer.seniority != null) Expanded(child: SelectOptionBadge(selectOption: hiringJobOffer.seniority!)),
        if(hiringJobOffer.contratto != null) Expanded(child: SelectOptionBadge(selectOption: hiringJobOffer.contratto!))
      ],
      separatorBuilder: (context) => const SizedBox(width: 5),
    );
  }

  Widget _buildJobPosted(BuildContext context) {
    if(hiringJobOffer.jobPosted == null) return const SizedBox();

    return Text(DateFormat.yMd().format(hiringJobOffer.jobPosted!),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Styles.lightText)
    );
  }

  Widget _buildRetribuzione(BuildContext context) {
    if(hiringJobOffer.retribuzione == null) return const SizedBox();

    return MultiStyleText(
      items: hiringJobOffer.retribuzione!,
      baseStyle: Theme.of(context).textTheme.bodySmall?.copyWith(color: Styles.lightText),
      textAlign: TextAlign.end,
    );
  }
}
