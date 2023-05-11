import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorIndicator extends StatelessWidget {
  final String? message;
  final Function()? onRetry;
  const ErrorIndicator({Key? key, this.message, this.onRetry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(message ?? AppLocalizations.of(context)!.genericErrorMessage,
              style: Theme.of(context).textTheme.titleMedium
            ),
            const SizedBox(height: 8),
            if(onRetry != null) ElevatedButton(
              onPressed: onRetry!,
              child: Text(AppLocalizations.of(context)!.retry)
            ),
          ],
        ),
      ),
    );
  }
}
