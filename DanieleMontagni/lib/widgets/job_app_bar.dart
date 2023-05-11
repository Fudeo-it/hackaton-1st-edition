import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:offerte_lavoro_flutter_app/util/size_config/size_config.dart';

class JobAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget child;

  @override
  final Size preferredSize;
  final bool blur;

  const JobAppBar({
    Key? key,
    required this.child,
    this.blur = true,
  })  : preferredSize = const Size.fromHeight(100.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur ? 15 : 0,
          sigmaY: blur ? 15 : 0,
        ),
        child: Container(
          //color: Colors.grey.shade200,
          child: child,
          padding: EdgeInsets.only(
            top: 58.0,
            right: SizeConfig.blockSizeHorizontal * 1,
            left: SizeConfig.blockSizeHorizontal * 1,
            bottom: 16.0,
          ),
        ),
      ),
    );
  }
}
