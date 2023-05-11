import 'package:flutter/material.dart';

class LinkErrorDialog extends StatelessWidget {
  ///
  /// dialog che avvisa l'utente di un eventaule errore nell'apertura di un link
  ///
  const LinkErrorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      icon: const Icon(Icons.error, size: 26),
      actionsAlignment: MainAxisAlignment.center,
      title: Text(
        'Errore',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      content: Text(
        'non è stato possibile aprire il link',
        style: Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Ok',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.blue),
            ))
      ],
    );
  }
}
