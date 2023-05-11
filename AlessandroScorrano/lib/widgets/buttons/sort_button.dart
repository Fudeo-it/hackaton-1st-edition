import 'package:annunci_lavoro_flutter/blocs/jobAds/bloc/job_ads_bloc.dart';
import 'package:annunci_lavoro_flutter/extension/first_where_or_null.dart';
import 'package:annunci_lavoro_flutter/misc/sort.dart';
import 'package:annunci_lavoro_flutter/models/job_positions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_button/group_button.dart';

//ignore: must_be_immutable
class SortButtons extends StatefulWidget {
  ///
  /// groupButto di tipo radio per selezionare il tipo di ordinamento di un criterio.
  ///

  final String title;
  final IconData icon;
  final List<String> buttons;
  final Function(JobPosition) attributeGetter;
  late String attribute;

  SortButtons({
    super.key,
    required this.title,
    required this.icon,
    required this.buttons,
    required this.attributeGetter,
  }) : attribute = attributeGetter.toString();

  @override
  SortButtonsState createState() => SortButtonsState();
}

class SortButtonsState extends State<SortButtons> {
  late JobSort<JobPosition>? _currentSort;
  @override
  void initState() {
    super.initState();
    _currentSort = BlocProvider.of<JobAdsBloc>(context)
        .jobAdsController
        .sorting
        .firstWhereOrNull(
          (element) => element.attribute == widget.attribute,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        children: [
          _title(),
          const SizedBox(height: 10),
          GroupButton(
            enableDeselect: true,
            buttons: widget.buttons,
            onSelected: (value, index, isSelected) => !isSelected
                ? _onButtonDeselected(index)
                : _onButtonSelected(index),
            options: GroupButtonOptions(
              unselectedTextStyle:
                  Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
              selectedTextStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
              unselectedBorderColor: Colors.grey,
              selectedBorderColor: Colors.amber.shade700,
              selectedColor: Theme.of(context).primaryColorLight,
              unselectedColor: Theme.of(context).cardColor,
              buttonWidth: MediaQuery.of(context).size.width / 2 - 20,
              borderRadius: BorderRadius.circular(16),
            ),
            controller:
                GroupButtonController(selectedIndex: _initializeIndex()),
          ),
        ],
      ),
    );
  }

  Widget _title() => Row(
        children: [
          Icon(widget.icon),
          const SizedBox(width: 10),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(width: 10),
          const Expanded(
            child: Divider(
              thickness: 1,
            ),
          ),
        ],
      );

  void _onButtonSelected(int index) {
    if (index == 0) {
      _currentSort = JobSort<JobPosition>(
        attributeGetter: widget.attributeGetter,
        ascending: false,
      );
    } else {
      _currentSort = JobSort<JobPosition>(
        attributeGetter: widget.attributeGetter,
        ascending: true,
      );
    }

    JobSort<JobPosition> isexistingSort =
        JobSort(attributeGetter: widget.attributeGetter, ascending: true);

    BlocProvider.of<JobAdsBloc>(context)
        .jobAdsController
        .sorting
        .forEach((element) {
      element.attribute == widget.attribute ? isexistingSort = element : null;
    });

    BlocProvider.of<JobAdsBloc>(context)
        .jobAdsController
        .removeSort(isexistingSort);

    BlocProvider.of<JobAdsBloc>(context)
        .jobAdsController
        .addSort(_currentSort!);
  }

  void _onButtonDeselected(int index) {
    if (_currentSort != null) {
      BlocProvider.of<JobAdsBloc>(context)
          .jobAdsController
          .removeSort(_currentSort!);
      _currentSort = null;
    }
  }

  int? _initializeIndex() {
    if (BlocProvider.of<JobAdsBloc>(context).jobAdsController.sorting.any(
        (element) =>
            element.ascending == true &&
            element.attribute == widget.attribute)) {
      return 1;
    } else if (BlocProvider.of<JobAdsBloc>(context)
        .jobAdsController
        .sorting
        .any(
      (element) {
        return element.ascending == false &&
            element.attribute == widget.attribute;
      },
    )) {
      return 0;
    } else {
      return null;
    }
  }
}
