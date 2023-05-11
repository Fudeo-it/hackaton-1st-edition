import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';

class JobOfferItem extends StatelessWidget {
  final Widget child;
  final void Function() onTap;
  final void Function() onShare;
  final void Function() onFavorite;
  final bool isFavorite;
  final bool shimmer;

  const JobOfferItem({
    required this.onTap,
    required this.onShare,
    required this.onFavorite,
    required this.isFavorite,
    required this.child,
    this.shimmer = false,
    super.key,
  });

  factory JobOfferItem.shimmer({
    required Widget child,
  }) =>
      JobOfferItem(
        onTap: () {},
        onShare: () {},
        onFavorite: () {},
        isFavorite: false,
        shimmer: true,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MyRadius.m),
          color: shimmer ? null : Theme.of(context).scaffoldBackgroundColor,
          boxShadow: shimmer
              ? null
              : [
                  BoxShadow(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black26
                        : Colors.black,
                    offset: const Offset(2, 2),
                    blurRadius: 5,
                  )
                ],
          border: shimmer
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _body(context),
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(
            MyInsets.m, MyInsets.m, MyInsets.m, MyInsets.xs),
        child: child,
      );

  Widget _footer(BuildContext context) => Column(
        children: [
          _divider(context),
          _actionButtons(context),
        ],
      );

  Widget _actionButtons(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buttonWidget(
            context,
            text: 'Condividi',
            icon: Icons.share,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(MyRadius.m),
            ),
            onTap: () => onShare(),
          ),
          Container(
            height: 15,
            width: 1,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
          ),
          _buttonWidget(
            context,
            text: 'Preferito',
            icon: isFavorite ? Icons.bookmark : Icons.bookmark_outline,
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(MyRadius.m),
            ),
            onTap: onFavorite,
            isSelected: isFavorite,
          ),
        ],
      );

  Widget _buttonWidget(
    BuildContext context, {
    required String text,
    bool isSelected = false,
    required IconData icon,
    required BorderRadius borderRadius,
    required void Function() onTap,
  }) {
    return Expanded(
      child: Material(
        borderRadius: borderRadius,
        child: InkWell(
          splashColor: Theme.of(context).colorScheme.primary.withOpacity(0.2),
          highlightColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.2),
          borderRadius: borderRadius,
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
            ),
            padding: const EdgeInsets.symmetric(vertical: MyInsets.s),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.tertiary,
                  size: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: MyInsets.xs),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _divider(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: MyInsets.m),
        child: Divider(
          height: 0,
          color: Theme.of(context).colorScheme.primary.withOpacity(.4),
          indent: 15,
          endIndent: 15,
        ),
      );
}
