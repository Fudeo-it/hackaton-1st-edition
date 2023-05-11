import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/l10n/l10n.dart';
import 'package:offertelavoroflutter/ui/theme/colors.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarComponent({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(180);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.website),
          const SizedBox(height: 16),
          FlexibleSpaceBar(
            title: Text(
              title,
              style: const TextStyle(fontSize: 26),
              maxLines: 3,
              overflow:TextOverflow.clip,
            ),
          ),
        ],
      ),
      centerTitle: false,
      toolbarHeight: 140,
      backgroundColor: ThemeColors.primaryDark,
      bottom: TabBar(
        tabs: [
          Tab(
            text: l10n.recruitments,
          ),
          Tab(
            text: l10n.freelance,
          ),
        ],
      ),
    );
  }
}