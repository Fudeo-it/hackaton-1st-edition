import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';

class ContentSheet extends StatelessWidget {
  final Widget child;
  const ContentSheet({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomSheetTheme.backgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(40))
      ),
      padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 18),
              _buildHandle(context),
              const SizedBox(height: 24),
              child
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return Center(
      child: Container(
        width: 80,
        height: 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.primary
        ),
      ),
    );
  }
}
