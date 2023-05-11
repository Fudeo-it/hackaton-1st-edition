import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/helpers/theme_mode_switcher_clipper.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/theme_mode_switcher/bloc/theme_mode_switcher_bloc.dart';

class ThemeModeSwitcher extends StatefulWidget {
  final Widget Function(ThemeMode) builder;

  const ThemeModeSwitcher({Key? key, required this.builder}) : super(key: key);

  @override
  State<ThemeModeSwitcher> createState() => _ThemeModeSwitcherState();
}

class _ThemeModeSwitcherState extends State<ThemeModeSwitcher> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ThemeModeSwitcherBloc, ThemeModeSwitcherState>(
      listener: (context, state) {
        animationController..reset()..forward();
      },
      builder: (context, state) {
        Widget child = widget.builder(state.darkMode ? ThemeMode.dark : ThemeMode.light);
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              if(state.screenshot != null) RawImage(image: state.screenshot),
              RepaintBoundary(
                key: state.screenshotBoundaryKey,
                child: state.isInitial ? child : AnimatedBuilder(
                  animation: animationController,
                  child: child,
                  builder: (context, child) {
                    return ClipPath(
                      clipper: ThemeModeSwitcherClipper(
                        offset: state.clipOffset,
                        sizeRate: animationController.value
                      ),
                      child: child,
                    );
                  }
                ),
              )
            ],
          ),
        );
      }
    );
  }
}

