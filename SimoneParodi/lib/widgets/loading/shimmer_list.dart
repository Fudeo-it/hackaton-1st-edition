import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter/cubits/dark_mode_cubit.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerList extends StatelessWidget {
  final Widget child;

  const ShimmerList({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DarkModeCubit, bool>(
      builder: (context, darkMode) {
        return ListView.builder(
          padding: const EdgeInsets.symmetric(
            horizontal: MyInsets.scaffoldHorizonatalPadding,
          ),
          itemCount: 3,
          itemBuilder: (_, __) => Shimmer.fromColors(
            baseColor: darkMode ? Colors.white38 : Colors.black12,
            highlightColor: darkMode ? Colors.white60 : Colors.black38,
            loop: 20,
            child: child,
          ),
        );
      },
    );
  }
}
