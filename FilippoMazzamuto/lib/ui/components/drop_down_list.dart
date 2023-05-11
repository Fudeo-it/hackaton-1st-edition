import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';

class DropDownList extends StatefulWidget {
  final List<SelectedListItem> listOfAttribute;
  final Icon icon;
  final String attributeName;
  final ValueChanged onEvent;
  final bool enableMultipleSelection;

  const DropDownList({
    super.key, 
    required this.attributeName,
    required this.listOfAttribute,
    required this.icon,
    required this.onEvent,
    this.enableMultipleSelection = false,
  });

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton.icon(
      onPressed: () {
        FocusScope.of(context).unfocus();
        onTextFieldTap(l10n);
      }, 
      icon: widget.icon,
      label: Text(widget.attributeName),
    );
  }

  void onTextFieldTap(AppLocalizations l10n) {
    DropDownState(
      DropDown(
        isSearchVisible: false,
        bottomSheetTitle: Text(
          widget.attributeName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: Text(
          l10n.done,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.listOfAttribute,
        selectedItems: (List<dynamic> selectedList) {
          List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              setState(() => selected = item.name);
              list.add(item.value!);
            }
          }
          widget.onEvent(
            widget.enableMultipleSelection ? list : list.first
          );
          //showSnackBar(list.toString());
        },
        enableMultipleSelection: widget.enableMultipleSelection,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}