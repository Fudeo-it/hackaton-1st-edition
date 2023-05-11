import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';

class BaseAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget title;
  final Color? backgroundColor;
  const BaseAppBar({Key? key, required this.title, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = const BorderRadius.vertical(
      bottom: Radius.circular(30),
    );

    return Container(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: AppBar(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        backgroundColor: Styles.primaryDark,
        flexibleSpace: ClipRRect(
          borderRadius: borderRadius,
          child: SvgPicture.asset('assets/header-bg.svg', fit: BoxFit.cover)
        ),
        titleSpacing: 25,
        title: title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
