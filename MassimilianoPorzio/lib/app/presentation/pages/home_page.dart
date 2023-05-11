import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/connection.dart';
import 'package:loggy/loggy.dart';

import '../../../core/utils/sound_utils.dart';
import '../../resources/string_constants.dart';
import '../../tools/connection/connectivity_utils.dart';
import '../cubit/dark_mode/dark_mode_cubit.dart';
import '../cubit/navbar/navigation_cubit.dart';
import '../cubit/sound/sound_cubit.dart';
import '../widgets/bottom_nav_bar.dart';

class HomePage extends StatelessWidget with UiLoggy {
  const HomePage({super.key, required this.pages});

  //lista delle pagine da mostrare
  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    var themeMode = context.watch<DarkModeCubit>().state.mode;
    var selectedIndex = context.watch<NavigationCubit>().state.selectedIndex;

    return ConnectionListener(
      onOnline: showOnlineSnackbar,
      onOffline: showOfflineSnackbar,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          scrolledUnderElevation: 0,
          centerTitle: false,
          title: const AutoSizeText(StringConsts.appbarTitle,
              overflow: TextOverflow.fade,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          actions: [
            IconButton(onPressed: () {
              loggy.debug("TOGGLE sound on/off");
              context.read<SoundCubit>().toggleMute();
              playSound(file: 'unmute.mp3');
            }, icon: BlocBuilder<SoundCubit, SoundState>(
              builder: (context, state) {
                return Icon(state.muted ? Icons.volume_off : Icons.volume_mute);
              },
            )),
            IconButton(
                onPressed: () {
                  loggy.debug("TOGGLE THEME Mode");
                  context.read<DarkModeCubit>().toggleDarkMode();
                  String soundFile =
                      context.read<DarkModeCubit>().state.mode == ThemeMode.dark
                          ? 'grilli.mp3'
                          : 'mattina.mp3';
                  playSound(file: soundFile);
                },
                icon: Icon(themeMode == ThemeMode.light
                    ? Icons.dark_mode
                    : Icons.light_mode))
          ],
        ),
        bottomNavigationBar: const MyBottomNavBar(),
        body: pages[selectedIndex],
      ),
    );
  }
}
