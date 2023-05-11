import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/theme_mode_switcher/bloc/theme_mode_switcher_bloc.dart';

class ThemeModeToggleButton extends StatelessWidget {
  const ThemeModeToggleButton({Key? key}) : super(key: key);

  Offset _calculateClipOffset(BuildContext context) {
    // we make the clip start from the button itself
    final renderObject = context.findRenderObject()! as RenderBox;
    final size = renderObject.size;
    return renderObject
      .localToGlobal(Offset.zero)
      .translate(size.width / 2, size.height / 2);
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Offset clipOffset = _calculateClipOffset(context);
        context.read<ThemeModeSwitcherBloc>().add(ThemeModeSwitcherEvent.themeModeToggled(clipOffset));
      },
      icon: BlocBuilder<ThemeModeSwitcherBloc, ThemeModeSwitcherState>(
        builder: (context, state) {
         return SvgPicture.asset('assets/icons/${state.darkMode ? 'sunny' : 'moon'}.svg',
           colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
         );
        }
      )
    );
  }
}
