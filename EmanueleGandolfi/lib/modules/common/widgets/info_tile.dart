import 'package:flutter/material.dart';
import 'package:offertelavoroflutter_app/helpers/app_url_launcher.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/common/models/select_option/select_option.dart';
import 'package:offertelavoroflutter_app/modules/common/models/styled_text/styled_text.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_style_text.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final SelectOption? selectOption;
  final String? url;
  final List<StyledText>? styledText;

  const InfoTile._({Key? key, required this.title, this.url, this.selectOption, this.styledText}) : super(key: key);

  factory InfoTile.selectOption(String title, SelectOption? selectOption) {
    return InfoTile._(title: title, selectOption: selectOption);
  }

  factory InfoTile.url(String title, String? url) {
    return InfoTile._(title: title, url: url);
  }

  factory InfoTile.styledText(String title, List<StyledText>? styledText) {
    return InfoTile._(title: title, styledText: styledText);
  }

  @override
  Widget build(BuildContext context) {
    if(url != null) return _buildUrlInfo(url!, context);
    if(selectOption != null) return _buildSelectOptionInfo(selectOption!, context);
    if(styledText != null && styledText!.isNotEmpty) return _buildStyledTextInfo(styledText!, context);

    return const SizedBox();
  }

  Widget _buildUrlInfo(String url, BuildContext context) {
    Widget info = GestureDetector(
      onTap: () => AppUrlLauncher.openUrlInBrowser(url),
      child: Text(url,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.underline)
      )
    );

    return _buildInfo(info, context);
  }

  Widget _buildSelectOptionInfo(SelectOption selectOption, BuildContext context) {
    Widget info = Text(selectOption.name, style: Theme.of(context).textTheme.bodyMedium);
    return _buildInfo(info, context);
  }

  Widget _buildStyledTextInfo(List<StyledText> styledText, BuildContext context) {
    Widget info = MultiStyleText(
      items: styledText,
      baseStyle: Theme.of(context).textTheme.bodyMedium
    );
    return _buildInfo(info, context);
  }

  Widget _buildInfo(Widget info, BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 16),
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 10),
        info,
        const SizedBox(height: 16),
        buildSeparator(),
      ],
    );
  }

  Widget buildSeparator() {
    return Container(
      height: 1,
      color: Styles.lightBackground,
    );
  }
}
