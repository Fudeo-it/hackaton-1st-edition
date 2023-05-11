import 'package:flutter/material.dart';
import 'package:jobs_search/providers/main_provider.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool devMode = context.watch<MainProvider>().devMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Impostazioni'),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ListTile(
                leading: const Text('Abilita modalità sviluppatore'),
                trailing: Switch(
                  value: devMode,
                  onChanged: (bool value) {
                    context.read<MainProvider>().toggleDevMode();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
