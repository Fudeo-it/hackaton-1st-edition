import 'package:favourites_repository/favourites_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/favourite_checkbox/bloc/favourite_checkbox_bloc.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FavouriteCheckbox extends StatelessWidget {
  const FavouriteCheckbox({super.key, required String id}) : _id = id;

  final String _id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCheckboxBloc(
        id: _id,
        favouritesRepository: context.read<FavouritesRepository>(),
      ),
      child: const ItemCheckBox(),
    );
  }
}

class FavouriteCheckboxAction extends StatelessWidget {
  const FavouriteCheckboxAction({super.key, required String id}) : _id = id;

  final String _id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCheckboxBloc(
        id: _id,
        favouritesRepository: context.read<FavouritesRepository>(),
      ),
      child: const ItemCheckBoxAction(),
    );
  }
}

class ItemCheckBox extends StatelessWidget {
  const ItemCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCheckboxBloc, FavouriteCheckboxState>(
      bloc: context.read<FavouriteCheckboxBloc>(),
      builder: (context, state) => InkResponse(
        onTap: () => context.read<FavouriteCheckboxBloc>().add(
              const FavouriteCheckboxToggled(),
            ),
        child: Icon(
          state.checked
              ? PhosphorIcons.fill.bookmarkSimple
              : PhosphorIcons.regular.bookmarkSimple,
          size: 32,
          color: AppColors.sky,
        ),
      ),
    );
  }
}

class ItemCheckBoxAction extends StatelessWidget {
  const ItemCheckBoxAction({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavouriteCheckboxBloc, FavouriteCheckboxState>(
      bloc: context.read<FavouriteCheckboxBloc>(),
      builder: (context, state) => InkResponse(
        onTap: () => context.read<FavouriteCheckboxBloc>().add(
              const FavouriteCheckboxToggled(),
            ),
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 55,
          height: 50,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.ultraLightGrey),
              borderRadius: BorderRadius.circular(16),
              color: AppColors.ultraLightGrey,
            ),
            child: Icon(
              state.checked
                  ? PhosphorIcons.fill.bookmarkSimple
                  : PhosphorIcons.regular.bookmarkSimple,
              size: 32,
              color: AppColors.sky,
            ),
          ),
        ),
      ),
    );
  }
}
