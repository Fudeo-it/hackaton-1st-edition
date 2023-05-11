import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:offertelavoroflutter_app/helpers/styles.dart';
import 'package:offertelavoroflutter_app/modules/app_shell/widgets/theme_mode_toggle_button.dart';
import 'package:offertelavoroflutter_app/modules/common/widgets/multi_animation.dart';

class HeaderWithSearch extends StatelessWidget {
  final String title;
  final String switchListBtnTitle;
  final Function() onSwitchList;
  final Function() onShowFilters;
  final bool showActiveFiltersBadge;
  final bool forceElevated;
  final TextEditingController searchController;
  final AnimationController animationController;

  const HeaderWithSearch({Key? key, required this.forceElevated, required this.title,
    required this.switchListBtnTitle, required this.onSwitchList, required this.searchController,
    required this.onShowFilters, required this.showActiveFiltersBadge,
    required this.animationController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry borderRadius = const BorderRadius.vertical(
      bottom: Radius.circular(30),
    );

    return SliverAppBar(
      titleSpacing: 0,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      pinned: true,
      floating: true,
      centerTitle: false,
      backgroundColor: Styles.primaryDark,
      bottom: BottomAppBar(
        searchController: searchController,
        onShowFilters: onShowFilters,
        showActiveFiltersBadge: showActiveFiltersBadge,
      ),
      forceElevated: forceElevated,
      flexibleSpace: ClipRRect(
        borderRadius: borderRadius,
        child: SvgPicture.asset('assets/header-bg.svg', fit: BoxFit.cover)
      ),
      title: _buildContent(context),
      toolbarHeight: 120,
      actions: const [
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 44,
            child: ThemeModeToggleButton()
          ),
        )
      ],
    );
  }
  
  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Styles.screenHorizPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 4),
          Text(AppLocalizations.of(context)!.appName,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.white)
          ),
          const SizedBox(height: 14),
          MultiAnimation(
            controller: animationController,
            endInterval: 0.6,
            beginOffset: const Offset(-0.05, 0),
            child: Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white))
          ),
          const SizedBox(height: 14),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onSwitchList,
            child: MultiAnimation(
              controller: animationController,
              beginOffset: const Offset(0.05, 0),
              beginInterval: 0.4,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset('assets/icons/transaction-horizontal.svg', width: 16, colorFilter: const ColorFilter.mode(Styles.accent, BlendMode.srcIn)),
                  const SizedBox(width: 6),
                  Text(switchListBtnTitle,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Styles.accent)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomAppBar extends StatelessWidget with PreferredSizeWidget {
  final TextEditingController searchController;
  final Function() onShowFilters;
  final bool showActiveFiltersBadge;

  const BottomAppBar({Key? key, required this.searchController, required this.onShowFilters,
    required this.showActiveFiltersBadge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: Styles.screenHorizPadding, left: Styles.screenHorizPadding, bottom: 20, top: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SvgPicture.asset('assets/icons/search.svg', colorFilter: const ColorFilter.mode(Styles.lightText, BlendMode.srcIn)),
                ),
                suffixIcon: _buildClearSearchFieldIcon(),
                label: Text(AppLocalizations.of(context)!.jobOfferSearchPlaceholder,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Styles.lightText)
                )
              ),
            )
          ),
          const SizedBox(width: 15),
          Stack(
            children: [
              ElevatedButton(
                onPressed: onShowFilters,
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: const MaterialStatePropertyAll(Styles.accent),
                ),
                child: SvgPicture.asset('assets/icons/slider.svg', colorFilter: const ColorFilter.mode(Styles.primaryDark, BlendMode.srcIn))
              ),
              if(showActiveFiltersBadge) Positioned(
                top: 5,
                right: 6,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Styles.primaryDark
                  )
                )
              )
            ],
          )
        ],
      ),
    );
  }

  _buildClearSearchFieldIcon() {
    return ValueListenableBuilder(
      valueListenable: searchController,
      builder: (BuildContext context, TextEditingValue value, Widget? child) {
        if(value.text.isEmpty) {
          return const SizedBox();
        } else {
          return GestureDetector(
            onTap: () {
              searchController.clear();
            },
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset('assets/icons/close.svg', colorFilter: const ColorFilter.mode(Styles.lightText, BlendMode.srcIn)),
            ),
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(88);
}
