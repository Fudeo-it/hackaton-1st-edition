import 'package:flutter/material.dart';
import 'package:fudeo_hackaton/opportunity_detail/widget/widget.dart';
import 'package:fudeo_hackaton/opportunity_list/widget/widget.dart';
import 'package:fudeo_hackaton/theme/theme.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DetailPageWrapper extends StatelessWidget {
  const DetailPageWrapper({
    required this.children,
    required this.id,
    required this.applyUrl,
    required this.applicationProcess,
    super.key,
  });

  final List<Widget> children;
  final String id;
  final String? applyUrl;
  final String? applicationProcess;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18),
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.ultraLightGrey),
                                borderRadius: BorderRadius.circular(16),
                                color: AppColors.ultraLightGrey,
                              ),
                              child: Icon(
                                PhosphorIcons.regular.caretLeft,
                                color: AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: FavouriteCheckboxAction(id: id),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ...children,
                ],
              ),
            ),
            ApplyButton(url: applyUrl, applicationProcess: applicationProcess),
          ],
        ),
      ),
    );
  }
}
