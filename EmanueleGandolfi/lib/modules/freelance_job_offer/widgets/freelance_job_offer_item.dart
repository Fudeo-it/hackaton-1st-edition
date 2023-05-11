import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/content_card.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_style_text.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';

class FreelanceJobOfferItem extends StatelessWidget {
  final FreelanceJobOffer freelanceJobOffer;
  final Function() onTap;
  final Function() onFavoriteTap;
  final bool isFavorite;
  final String? heroTag;
  const FreelanceJobOfferItem({Key? key, required this.freelanceJobOffer, required this.onTap,
    required this.onFavoriteTap, required this.isFavorite, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroTag ?? freelanceJobOffer.id,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(child: _buildJobPosted(context)),
                    ],
                  )
                ],
              ),
            ),
            _buildFavoriteIcon(context)
          ]
        ),
      ),
    );
  }

  Widget _buildEmoji(BuildContext context) {
    if(freelanceJobOffer.emoji == null || freelanceJobOffer.emoji!.isEmpty) return const SizedBox();

    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.background
      ),
      child: Center(
        child: Text(freelanceJobOffer.emoji!, style: const TextStyle(fontSize: 18))
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
          ],
        ),
      ),
    );
  }
  
  Widget _buildTitle(BuildContext context) {
    if(freelanceJobOffer.codice == null || freelanceJobOffer.codice!.isEmpty) return const SizedBox();

    return MultiStyleText(items: freelanceJobOffer.codice!, baseStyle: Theme.of(context).textTheme.titleSmall);
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

  Widget _buildJobPosted(BuildContext context) {
    if(freelanceJobOffer.jobPosted == null) return const SizedBox();

    return Text(DateFormat.yMd().format(freelanceJobOffer.jobPosted!),
      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Styles.lightText)
    );
  }
}
