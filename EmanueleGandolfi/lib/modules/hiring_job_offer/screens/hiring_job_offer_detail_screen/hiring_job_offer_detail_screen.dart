import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offertelavoroflutter_app/helpers/app_share.dart';
import 'package:offertelavoroflutter_app/helpers/flash_message.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/detail_app_bar.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_style_text.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/models/hiring_job_offer/hiring_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/repositories/hiring_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/screens/hiring_job_offer_detail_screen/bloc/hiring_job_offer_detail_screen_bloc.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/widgets/hiring_job_offer_detail_info.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/widgets/hiring_job_offer_detail_title.dart';

class HiringJobOfferDetailScreen extends StatelessWidget {
  final HiringJobOfferDetailScreenArgs args;
  const HiringJobOfferDetailScreen({Key? key, required this.args}) : super(key: key);

  HiringJobOffer get hiringJobOffer => args.hiringJobOffer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HiringJobOfferDetailScreenBloc(
        hiringJobOfferRepository: RepositoryProvider.of<HiringJobOfferRepository>(context),
        hiringJobOffer: hiringJobOffer
      )..add(const HiringJobOfferDetailScreenEvent.initialized()),
      child: _HiringJobOfferDetailView(heroTag: args.heroTag),
    );
  }
}

class _HiringJobOfferDetailView extends StatelessWidget {
  final String? heroTag;
  final ScrollController scrollController = ScrollController();

  _HiringJobOfferDetailView({Key? key, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HiringJobOfferDetailScreenBloc, HiringJobOfferDetailScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: DetailAppBar(
            actions: _buildActions(state.hiringJobOffer, state.isFavorite, context),
            title: _buildAppBarTitle(state.hiringJobOffer, context),
            scrollController: scrollController,
          ),
          body: Hero(
            tag: heroTag ?? state.hiringJobOffer.id,
            child: Material( // needed for hero animation to work correctly
              type: MaterialType.transparency,
              child: SingleChildScrollView(
                controller: scrollController,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HiringJobOfferDetailTitle(hiringJobOffer: state.hiringJobOffer),
                      HiringJobofferDetailInfo(hiringJobOffer: state.hiringJobOffer),
                      const SizedBox(height: 20),
                    ],
                  )
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildAppBarTitle(HiringJobOffer hiringJobOffer, BuildContext context) {
    if(hiringJobOffer.name == null || hiringJobOffer.name!.isEmpty) return const SizedBox();

    return MultiStyleText(
      items: hiringJobOffer.name!,
      baseStyle: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  List<Widget> _buildActions(HiringJobOffer hiringJobOffer, bool isFavorite, BuildContext context) {
    Color iconColor = Theme.of(context).appBarTheme.iconTheme!.color!;
    return [
      IconButton(
        onPressed: () {
          context.read<HiringJobOfferDetailScreenBloc>()
            .add(const HiringJobOfferDetailScreenEvent.favoriteHiringJobOfferToggled());

          FlashMessage.showToggleFavoriteJobOffer(!isFavorite, context);
        },
        icon: SvgPicture.asset(isFavorite ? 'assets/icons/bookmark-filled.svg' : 'assets/icons/bookmark.svg',
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)
        )
      ),
      IconButton(
        onPressed: () => AppShare.share(AppLocalizations.of(context)!.jobOfferShareText(hiringJobOffer.url)),
        icon: SvgPicture.asset('assets/icons/share.svg',
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)
        )
      ),
    ];
  }
}

class HiringJobOfferDetailScreenArgs {
  final HiringJobOffer hiringJobOffer;
  final String? heroTag;

  HiringJobOfferDetailScreenArgs({required this.hiringJobOffer, this.heroTag});
}

