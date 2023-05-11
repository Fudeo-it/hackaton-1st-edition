import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_it_app/widgets/search_sliver_bar.dart';

class FiltersSearchScreen extends StatelessWidget {
  const FiltersSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyFiltersSearchScreen(),
    );
  }

  Widget _buildBodyFiltersSearchScreen() => const CustomScrollView(
        slivers: [
          SearchSliverBar(),
        ],
      );
}
