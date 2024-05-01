import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTap extends StatelessWidget {
  final Function()? onTap;
  final Widget child;
  final bool isNormalClick;

  const CustomTap(
      {super.key,
      required this.onTap,
      required this.child,
      this.isNormalClick = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: AppColors.transparentColor,
        enableFeedback: false,
        hoverColor: AppColors.transparentColor,
        highlightColor: AppColors.transparentColor,
        onTap: () {
          onTap!();
        },
        child: child);
  }
}
