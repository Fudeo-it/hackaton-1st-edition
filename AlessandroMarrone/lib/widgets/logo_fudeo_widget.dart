import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:offertelavoroflutter_it_app/widgets/text_shadow.dart';

class LogoFudeoWidget extends StatelessWidget {
  const LogoFudeoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Semantics(
          label: AppLocalizations.of(context)?.semantic_label_logo_fudeo,
          child: Image.asset(
            "assets/images/logo_fudeo.png",
            width: 30,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        TextShadow(
          text: AppLocalizations.of(context)?.text_fudeo ?? "text_fudeo",
          semanticsLabel:
              AppLocalizations.of(context)?.text_fudeo ?? "text_fudeo",
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12.0,
        ),
      ],
    );
  }
}
