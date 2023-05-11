//SizeConfig take the Screen Width and Screen Height and divide it by 100 creating a 100x100 grid.
// multiplying blockSize with a double create a scalable size for different device.
//E.g. SizeConfig.blockSizeVertical * 10 equals to 10% of the screen height.
import 'package:flutter/cupertino.dart';

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}