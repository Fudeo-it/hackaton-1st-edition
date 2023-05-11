import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ErrorJobsWidget extends StatelessWidget {
  final String? errorMsg;
  const ErrorJobsWidget({Key? key, this.errorMsg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Errore caricamento"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                LucideIcons.stopCircle,
                size: 96.0,
                color: Colors.red,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Text(
                "Errore durante il caricamento degli annunci: ${errorMsg ?? "Errore generico."}",
                style: TextStyle(fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
