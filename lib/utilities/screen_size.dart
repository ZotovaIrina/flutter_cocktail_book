import 'package:flutter/material.dart';

class ScreenSize {
  bool mobile = true;
  bool tablet = false;
  bool mobileOrTablet = true;
  bool desktop = false;

  ScreenSize(this.mobile, this.tablet, this.mobileOrTablet, this.desktop);
}

ScreenSize getScreenSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  return ScreenSize(deviceWidth < 600, deviceWidth >= 600 && deviceWidth < 768,
      deviceWidth < 768, deviceWidth > 768);
}
