import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/themes/design_system.dart';

class IconTitleWidget extends StatelessWidget {
  final String title;
  final Object subTitle;
  final IconData icon;

  const IconTitleWidget({
    required this.icon,
    required this.title,
    required this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: MyInsets.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.secondary,
                size: 18,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: MyInsets.s),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      subTitle is String
                          ? Text(
                              subTitle as String,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  ),
                            )
                          : subTitle as Widget
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
