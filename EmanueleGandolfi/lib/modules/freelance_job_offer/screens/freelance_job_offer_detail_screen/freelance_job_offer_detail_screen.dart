import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offertelavoroflutter_app/helpers/app_share.dart';
import 'package:offertelavoroflutter_app/helpers/flash_message.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/detail_app_bar.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_style_text.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/models/freelance_job_offer/freelance_job_offer.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/repositories/freelance_job_offer_repository.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/screens/freelance_job_offer_detail_screen/bloc/freelance_job_offer_detail_screen_bloc.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_detail_info.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/freelance_job_offer_detail_title.dart';

class FreelanceJobOfferDetailScreen extends StatelessWidget {
  final FreelanceJobOfferDetailScreenArgs args;
  const FreelanceJobOfferDetailScreen({Key? key, required this.args}) : super(key: key);

  FreelanceJobOffer get freelanceJobOffer => args.freelanceJobOffer;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FreelanceJobOfferDetailScreenBloc(
        freelanceJobOfferRepository: RepositoryProvider.of<FreelanceJobOfferRepository>(context),
        freelanceJobOffer: freelanceJobOffer
      )..add(const FreelanceJobOfferDetailScreenEvent.initialized()),
      child: _FreelanceJobOfferDetailView(heroTag: args.heroTag),
    );
  }
}

class _FreelanceJobOfferDetailView extends StatelessWidget {
  final String? heroTag;
  final ScrollController scrollController = ScrollController();

  _FreelanceJobOfferDetailView({Key? key, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FreelanceJobOfferDetailScreenBloc, FreelanceJobOfferDetailScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: DetailAppBar(
            actions: _buildActions(state.freelanceJobOffer, state.isFavorite, context),
            title: _buildAppBarTitle(state.freelanceJobOffer, context),
            scrollController: scrollController,
          ),
          body: Hero(
            tag: heroTag ?? state.freelanceJobOffer.id,
            child: Material( // needed for hero animation to work correctly
              type: MaterialType.transparency,
              child: SingleChildScrollView(
                controller: scrollController,
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      FreelanceJobOfferDetailTitle(freelanceJobOffer: state.freelanceJobOffer),
                      FreelanceJobOfferDetailInfo(freelanceJobOffer: state.freelanceJobOffer),
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

  Widget _buildAppBarTitle(FreelanceJobOffer freelanceJobOffer, BuildContext context) {
    if(freelanceJobOffer.codice == null || freelanceJobOffer.codice!.isEmpty) return const SizedBox();

    return MultiStyleText(
      items: freelanceJobOffer.codice!,
      baseStyle: Theme.of(context).textTheme.titleMedium,
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  List<Widget> _buildActions(FreelanceJobOffer freelanceJobOffer, bool isFavorite, BuildContext context) {
    Color iconColor = Theme.of(context).appBarTheme.iconTheme!.color!;
    return [
      IconButton(
        onPressed: () {
          context.read<FreelanceJobOfferDetailScreenBloc>()
            .add(const FreelanceJobOfferDetailScreenEvent.favoriteFreelanceJobOfferToggled());

          FlashMessage.showToggleFavoriteJobOffer(!isFavorite, context);
        },
        icon: SvgPicture.asset(isFavorite ? 'assets/icons/bookmark-filled.svg' : 'assets/icons/bookmark.svg',
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)
        )
      ),
      IconButton(
        onPressed: () => AppShare.share(AppLocalizations.of(context)!.jobOfferShareText(freelanceJobOffer.url)),
        icon: SvgPicture.asset('assets/icons/share.svg',
          colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn)
        )
      ),
    ];
  }
}

class FreelanceJobOfferDetailScreenArgs {
  final FreelanceJobOffer freelanceJobOffer;
  final String? heroTag;

  FreelanceJobOfferDetailScreenArgs({required this.freelanceJobOffer, this.heroTag});
}

