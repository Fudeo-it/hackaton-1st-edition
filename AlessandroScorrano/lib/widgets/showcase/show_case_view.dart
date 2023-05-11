import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class ShowCaseView extends StatelessWidget {
  ///
  /// Widget utilizzato per contenere il widget da mostrare nel tutorial di avvio
  ///
  ///
  const ShowCaseView({
    Key? key,
    required this.globalKey,
    required this.title,
    required this.description,
    required this.child,
  }) : super(key: key);

  final GlobalKey globalKey;
  final String title;
  final String description;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Showcase(
        targetBorderRadius: BorderRadius.circular(16),
        titlePadding: EdgeInsets.only(bottom: 4),
        tooltipPadding: EdgeInsets.all(12),
        targetPadding: EdgeInsets.all(4),
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.black87),
        descTextStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
            fontWeight: FontWeight.w500, fontSize: 16, color: Colors.black87),
        key: globalKey,
        title: title,
        description: description,
        child: child);
  }
}
