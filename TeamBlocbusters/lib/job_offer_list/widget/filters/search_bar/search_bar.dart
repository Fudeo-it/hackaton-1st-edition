import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/theme/colors.dart';
import 'package:fudeo_hackaton/theme/fonts.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.ultraLightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Icon(
              PhosphorIcons.regular.magnifyingGlass,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: BlocListener<OpportunityListBloc, OpportunityListState>(
                  listener: (context, state) {
                    _textController
                      ..text = state.filter.title ?? ''
                      ..selection = TextSelection.collapsed(
                        offset: _textController.text.length,
                      );
                  },
                  child: TextField(
                    controller: _textController,
                    cursorColor: AppColors.sky,
                    style: AppFonts.searchBar,
                    onChanged: (value) =>
                        BlocProvider.of<OpportunityListBloc>(context).add(
                      SearchTextChanged(value),
                    ),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle: AppFonts.searchBarPlaceholder,
                      hintText: 'Cerca...',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
