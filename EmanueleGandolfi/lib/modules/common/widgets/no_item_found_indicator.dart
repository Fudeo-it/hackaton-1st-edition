import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoItemsFoundIndicator extends StatelessWidget {
  final String? message;
  const NoItemsFoundIndicator({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(message ?? AppLocalizations.of(context)!.notItemsFoundMessage,
          style: Theme.of(context).textTheme.titleMedium
        ),
      ),
    );
  }
}
