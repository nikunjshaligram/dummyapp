import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/core/theme/styles.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.title,
    required this.onButtonPressed,
    this.validate,
    this.buttonStyles,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback onButtonPressed;
  final double buttonHeight;
  final double buttonWidth;
  final bool? validate;
  final bool isLoading;

  final ButtonStyle? buttonStyles;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * buttonHeight,
      width: Get.width * buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        onPressed: onButtonPressed,
        child: (isLoading)
            ? Container(
                width: 10.screenWidth,
                height: 10.screenWidth,
                padding: EdgeInsets.all(2.screenWidth),
                child: CircularProgressIndicator(
                  color: AppColors.darkOrangeColor,
                  strokeWidth: 3.sp,
                ),
              )
            : Text(
                title,
                style: AppStyle.semiBoldTextStyle(
                  size: 10.sp,
                  color: AppColors.whiteColor,
                ),
              ),
      ),
    );
  }
}
