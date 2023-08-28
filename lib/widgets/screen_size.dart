import 'package:flutter/material.dart';

enum ScreenSize { small, normal, large, extraLarge, mobile, tabletOrDesktop }

ScreenSize getSize(BuildContext context) {
  double deviceWidth = MediaQuery.of(context).size.shortestSide;
  if (deviceWidth > 900) return ScreenSize.extraLarge;
  if (deviceWidth > 600) return ScreenSize.large;
  if (deviceWidth > 300) return ScreenSize.normal;
  if (deviceWidth < 300) return ScreenSize.small;
  if (deviceWidth < 600) return ScreenSize.mobile;
  if (deviceWidth > 600) return ScreenSize.tabletOrDesktop;
  return ScreenSize.small;
}
