import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/opportunity_detail/dialog/application_process_dialog.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplyButton extends StatelessWidget {
  const ApplyButton({super.key, this.url, this.applicationProcess});

  final String? url;
  final String? applicationProcess;

  @override
  Widget build(BuildContext context) {
    if (url == null && applicationProcess == null) return Container();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppButton(
                action: () => _onApply(context),
                text: 'Candidati!',
                iconData: PhosphorIcons.bold.confetti,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onApply(BuildContext context) async {
    if (url != null) {
      await launchUrl(Uri.parse(url!));
    } else if (applicationProcess != null) {
      await ApplicationProcessDialog.show(context, applicationProcess!);
    }
  }
}
