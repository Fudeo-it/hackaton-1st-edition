import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';

class SelectOptionBadge extends StatelessWidget {
  final SelectOption selectOption;
  const SelectOptionBadge({Key? key, required this.selectOption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: selectOption.color?.withAlpha(90) ?? Styles.primaryDark.withAlpha(30)
      ),
      child: Center(
        child: Text(selectOption.name, style: Theme.of(context).textTheme.bodySmall),
      ),
    );
  }
}
