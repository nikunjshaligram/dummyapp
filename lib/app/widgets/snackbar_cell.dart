import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../core/theme/colors.dart';
import '../core/theme/styles.dart';

class SnackBarWidget {
  static showSnackBar(String message,
      {bool isError = true, String title = "Errors"}) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
          margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
          padding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 7.sp),
          borderRadius: 8.0,
          duration: const Duration(milliseconds: 2000),
          message: message,
          snackPosition: SnackPosition.BOTTOM,
          messageText: Text(
            message,
            style: AppStyle.regularTextStyle(
                size: 12.sp, color: AppColors.whiteColor),
          ),
          backgroundColor: AppColors.primaryColor.withOpacity(0.7));
    }
  }

  static showSnackBarInfinity(String message,
      {bool isError = true, String title = "Errors"}) {
    if (!Get.isSnackbarOpen) {
      Get.rawSnackbar(
          margin: EdgeInsets.symmetric(horizontal: 8.sp, vertical: 5.sp),
          padding: EdgeInsets.symmetric(vertical: 7.sp, horizontal: 7.sp),
          duration: const Duration(days: 365),
          message: message,
          snackPosition: SnackPosition.TOP,
          messageText: Text(
            message,
            style: AppStyle.boldTextStyle(
                size: 12.sp, color: AppColors.whiteColor),
          ),
          backgroundColor: AppColors.primaryColor.withOpacity(0.7));
    }
  }

  static clearSnackBar() {
    Get.closeCurrentSnackbar();
  }
}
