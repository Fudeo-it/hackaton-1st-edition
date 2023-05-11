import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:offertelavoroflutter_it_app/widgets/icon_item.dart';
import 'package:offertelavoroflutter_it_app/widgets/web_view_wrapper_widget.dart';

class JobApplyPage extends StatelessWidget {
  final String url;
  const JobApplyPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)?.title_job_apply_page ??
            "title_job_apply_page"),
        automaticallyImplyLeading: false,
        leadingWidth: 80,
        leading: IconItem(
          onTap: () => context.router.pop(),
          icon: LucideIcons.chevronLeft,
          paddingHorizontal: 16.0,
        ),
      ),
      body: WebViewWrapperWidget(url: url),
    );
  }
}
