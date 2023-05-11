import 'package:flutter/material.dart';
import 'package:jobs_search/providers/main_provider.dart';
import 'package:provider/provider.dart';

class JobsListDevButtons extends StatelessWidget {
  const JobsListDevButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var devMode = context.watch<MainProvider>().devMode;

    if (!devMode) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () =>
            {context.read<MainProvider>().toggleLoading()},
            child: const Text('Toggle loading'),
          ),
          TextButton(
            onPressed: () => {context.read<MainProvider>().reloadData()},
            child: const Text('Reload data'),
          ),
          TextButton(
            onPressed: () => {context.read<MainProvider>().emptyData()},
            child: const Text('Empty data'),
          ),
          TextButton(
            onPressed: () => {context.read<MainProvider>().emptyFavourites()},
            child: const Text('Empty favourites'),
          ),
          TextButton(
            onPressed: () => {context.read<MainProvider>().toggleError()},
            child: const Text('Toggle error'),
          ),
        ],
      ),
    );
  }
}
