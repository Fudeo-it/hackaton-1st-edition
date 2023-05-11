import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailAppBar extends StatefulWidget with PreferredSizeWidget {
  final double appBarHeight;
  final List<Widget>? actions;
  final Widget title;
  final ScrollController scrollController;
  final double titleVisibleThreshold;

  const DetailAppBar({Key? key, this.actions, required this.title, required this.scrollController,
    this.titleVisibleThreshold = 150, this.appBarHeight = 60}) : super(key: key);

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class _DetailAppBarState extends State<DetailAppBar> {
  bool titleVisible = false;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(onScrollChange);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(onScrollChange);
    super.dispose();
  }

  onScrollChange() {
    bool shouldBeTitleVisible = widget.scrollController.offset > widget.titleVisibleThreshold;
    if(titleVisible == shouldBeTitleVisible) return;

    setState(() {
      titleVisible = shouldBeTitleVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: widget.appBarHeight,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: widget.actions,
      title: titleVisible ? widget.title : const SizedBox(),
      leading: Navigator.of(context).canPop() ? IconButton(
        onPressed: Navigator.of(context).maybePop,
        icon: SvgPicture.asset('assets/icons/arrow-left.svg',
          width: 24,
          colorFilter: ColorFilter.mode(Theme.of(context).appBarTheme.iconTheme!.color!, BlendMode.srcIn)
        ),
      ) : null,
    );
  }


}
