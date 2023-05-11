import 'package:flutter/material.dart';
import 'package:jobs_search/screens/settings.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: IconButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const Settings(),
            ),
          );
        },
        icon: const Icon(Icons.settings),
      ),
    );
  }
}
