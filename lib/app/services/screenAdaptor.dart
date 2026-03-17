import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdaptor {
  static get screenWidth => getScreenWidth();
  static get screenHeight => getScreenHeight();

  static width(num width) {
    return width.w;
  }

  static height(num height) {
    return height.h;
  }

  static fontSize(num fontSize) {
    return fontSize.sp;
  }

  static r(num radius) {
    return radius.r;
  }

  static getScreenWidth() {
    return 1.sw;
  }

  static getScreenHeight() {
    return 1.sh;
  }
}
