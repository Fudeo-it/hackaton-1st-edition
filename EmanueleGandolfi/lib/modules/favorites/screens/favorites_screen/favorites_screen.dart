import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/base_app_bar.dart';
import 'package:offertelavoroflutter_app/modules/favorites/screens/favorites_screen/bloc/favorites_screen_bloc.dart';
import 'package:offertelavoroflutter_app/modules/freelance_job_offer/widgets/favorite_freelance_job_offer_list/favorite_freelance_job_offer_list.dart';
import 'package:offertelavoroflutter_app/modules/hiring_job_offer/widgets/favorite_hiring_job_offer_list/favorite_hiring_job_offer_list.dart';

class FavoritesScreen extends StatelessWidget {
  static const hiringTabIndex = 0;
  static const freelanceTabIndex = 1;

  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoritesScreenBloc(),
      child: const _FavoritesView(),
    );
  }
}

class _FavoritesView extends StatelessWidget {
  const _FavoritesView({Key? key}) : super(key: key);

  ButtonStyle? getButtonStyle(bool selected, BuildContext context) {
    ButtonStyle? buttonStyle;
    if(selected) {
      buttonStyle = Theme.of(context).elevatedButtonTheme.style;
    } else {
      buttonStyle = Styles.getLightButtonTheme(context);
    }

    return buttonStyle?.copyWith(
      padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
      minimumSize: const MaterialStatePropertyAll(Size.zero)
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesScreenBloc, FavoritesScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: BaseAppBar(
            title: Text(AppLocalizations.of(context)!.favoritesScreenTitle),
            backgroundColor: Theme.of(context).colorScheme.background,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          body: Column(
            children: [
              _buildTabButtons(state, context),
              Expanded(
                child: IndexedStack(
                  index: state.activeTabIndex,
                  children: const [
                    FavoriteHiringJobOfferList(),
                    FavoriteFreelanceJobOfferList()
                  ],
                ),
              ),
            ],
          )
        );
      },
    );
  }

  Widget _buildTabButtons(FavoritesScreenState state, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding, vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: getButtonStyle(state.activeTabIndex == FavoritesScreen.hiringTabIndex, context),
              onPressed: () => context.read<FavoritesScreenBloc>()
                .add(const FavoritesScreenEvent.activeTabChanged(FavoritesScreen.hiringTabIndex)
              ),
              child: Text(AppLocalizations.of(context)!.jobOfferTypeHiring),
            )
          ),
          const SizedBox(width: 2),
          Expanded(
            child: ElevatedButton(
              style: getButtonStyle(state.activeTabIndex == FavoritesScreen.freelanceTabIndex, context),
              onPressed: () => context.read<FavoritesScreenBloc>()
                .add(const FavoritesScreenEvent.activeTabChanged(FavoritesScreen.freelanceTabIndex)
              ),
              child: Text(AppLocalizations.of(context)!.jobOfferTypeFreelance),
            )
          ),
        ],
      ),
    );
  }
}


