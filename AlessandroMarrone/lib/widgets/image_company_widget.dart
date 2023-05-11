import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageCompanyWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final double circular;
  const ImageCompanyWidget(
      {Key? key,
      required this.url,
      this.width = 30.0,
      this.height = 30.0,
      this.circular = 32.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(circular)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
