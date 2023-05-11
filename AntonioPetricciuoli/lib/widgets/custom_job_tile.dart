import 'package:flutter/material.dart';
import 'package:offertelavoroflutter/models/models.dart';
import 'package:offertelavoroflutter/styles.dart';

class CustomFreelanceTile extends StatelessWidget {
  const CustomFreelanceTile({
    super.key,
    required this.freelance,
    required this.onTap,
  });

  final Freelance freelance;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: Styles.kBorderRadius,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 64,
              width: 64,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Styles.kPrimaryColor,
                borderRadius: Styles.kBorderRadius,
              ),
              child: Text(
                freelance.icon ?? '',
                style: Styles.kBigTitle.copyWith(
                  color: Styles.kSecondaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    freelance.code ?? '',
                    style: Styles.kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      freelance.relationType!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.kSecondaryColor.withOpacity(0.1),
                                borderRadius: Styles.kBorderRadius,
                              ),
                              child: Text(
                                freelance.relationType ?? '',
                                style: Styles.kBody.copyWith(
                                  color: Styles.kPrimaryColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                      freelance.nda!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.kSecondaryColor.withOpacity(0.1),
                                borderRadius: Styles.kBorderRadius,
                              ),
                              child: Text(
                                "NDA: ${freelance.nda}",
                                style: Styles.kBody.copyWith(
                                  color: Styles.kFlutterBlue,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                      freelance.date!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.kSecondaryColor.withOpacity(0.1),
                                borderRadius: Styles.kBorderRadius,
                              ),
                              child: Text(
                                freelance.date ?? '',
                                style: Styles.kBody.copyWith(
                                  color: Styles.kInfoColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomRecruitmentTile extends StatelessWidget {
  const CustomRecruitmentTile({
    super.key,
    required this.recruitment,
    required this.onTap,
  });

  final Recruitment recruitment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: Styles.kBorderRadius,
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 64,
              width: 64,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Styles.kPrimaryColor,
                borderRadius: Styles.kBorderRadius,
              ),
              child: Text(
                recruitment.icon ?? '',
                style: Styles.kBigTitle.copyWith(
                  color: Styles.kSecondaryColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    recruitment.name ?? '',
                    style: Styles.kSubtitle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.business, size: 16),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          recruitment.company ?? '',
                          style: Styles.kBody,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      recruitment.location!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.kSecondaryColor.withOpacity(0.1),
                                borderRadius: Styles.kBorderRadius,
                              ),
                              child: Text(
                                recruitment.location ?? '',
                                style: Styles.kBody.copyWith(
                                  color: Styles.kPrimaryColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                      recruitment.seniority!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.kSecondaryColor.withOpacity(0.1),
                                borderRadius: Styles.kBorderRadius,
                              ),
                              child: Text(
                                recruitment.seniority ?? '',
                                style: Styles.kBody.copyWith(
                                  color: Styles.kFlutterBlue,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                      recruitment.contract!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.kSecondaryColor.withOpacity(0.1),
                                borderRadius: Styles.kBorderRadius,
                              ),
                              child: Text(
                                recruitment.contract ?? '',
                                style: Styles.kBody.copyWith(
                                  color: Styles.kFlutterNavy,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                      recruitment.date!.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Styles.kSecondaryColor.withOpacity(0.1),
                                borderRadius: Styles.kBorderRadius,
                              ),
                              child: Text(
                                recruitment.date ?? '',
                                style: Styles.kBody.copyWith(
                                  color: Styles.kInfoColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
