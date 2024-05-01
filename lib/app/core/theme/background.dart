import 'package:flutter/material.dart';

import 'colors.dart';

class AppBackground {
  static LinearGradient tabbarLinearGradient() {
    return LinearGradient(
        colors: [AppColors.lightTabbarColor, AppColors.darkTabbarColor],
        begin: FractionalOffset.topCenter,
        end: FractionalOffset.bottomCenter,
        stops: [0.0, 1.0],
        tileMode: TileMode.mirror);
  }
}
