import 'package:flutter/material.dart';

class NoFaviconCompanyWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final double circular;
  const NoFaviconCompanyWidget(
      {Key? key, this.width = 30.0, this.height = 30.0, this.circular = 32.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(circular)),
        color: Theme.of(context).primaryColor,
        image: const DecorationImage(
          image: AssetImage("assets/images/company_2a.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
