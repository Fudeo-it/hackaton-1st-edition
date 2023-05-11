import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/bloc/opportunity_list_bloc.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/filters_dialog/components/components.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class JobOfferListFilterDialog extends StatelessWidget {
  const JobOfferListFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpportunityListBloc, OpportunityListState>(
      builder: (context, state) {
        return ColoredBox(
          color: AppColors.accentLight,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BackButton(
                              onPressed: () => _cancelFilter(context),
                            ),
                            const Text(
                              'Filtri',
                              style: AppFonts.filtersDialogTitle,
                            ),
                            TextButton(
                              onPressed: () => _resetFilter(context),
                              child: const Text(
                                'Reset',
                                style: AppFonts.filtersDialogButton,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        FilterGroup(
                          title: 'Team',
                          icon: PhosphorIcons.regular.users,
                          filters: const [
                            Filter.fullRemote,
                            Filter.hybrid,
                            Filter.onSite,
                          ],
                        ),
                        FilterGroup(
                          title: 'Seniority',
                          icon: PhosphorIcons.regular.code,
                          filters: const [
                            Filter.junior,
                            Filter.mid,
                            Filter.senior,
                          ],
                        ),
                        FilterGroup(
                          title: 'Contratto',
                          icon: PhosphorIcons.regular.clock,
                          filters: const [
                            Filter.fullTime,
                            Filter.partTime,
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AppButton(
                  action: () => _applyFilter(context),
                  text: 'Applica filtri',
                  iconData: PhosphorIcons.regular.check,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> show(BuildContext context, OpportunityListBloc bloc) {
    final size = MediaQuery.of(context).size;
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: size.height * 0.9,
      ),
      context: context,
      builder: (context) => BlocProvider.value(
        value: bloc,
        child: const JobOfferListFilterDialog(),
      ),
    );
  }

  Future<void> _applyFilter(BuildContext context) async {
    Navigator.of(context).pop();
    BlocProvider.of<OpportunityListBloc>(context).add(ApplyFilterTap());
  }

  void _cancelFilter(BuildContext context) {
    Navigator.of(context).pop();
    BlocProvider.of<OpportunityListBloc>(context).add(CancelFilterTap());
  }

  void _resetFilter(BuildContext context) {
    Navigator.of(context).pop();
    BlocProvider.of<OpportunityListBloc>(context).add(EmptyFilterTap());
  }
}
