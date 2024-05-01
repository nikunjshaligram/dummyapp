import 'package:dummyapp/app/core/constants/images.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_label.dart';
import '../../core/theme/styles.dart';
import '../custom_image_widget.dart';

class changeSuccessDialog {
  changeDialog(scaleAnimation, fadeAnimation, animationController) {
    Get.dialog(
      barrierDismissible: true,
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: AppColors.whiteColor,
        clipBehavior: Clip.hardEdge,
        elevation: 0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            closeIconField(animationController),
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                circleThreeField(scaleAnimation, fadeAnimation),
                circleTwoField(scaleAnimation, fadeAnimation),
                circleOneField(),
                iconField()
              ],
            ),
            1.screenHeight.height,
            pwdUpdateTextField(),
          ],
        ).paddingOnly(left: 5.sp, right: 5.sp, top: 5.sp, bottom: 20.sp),
      ),
    );
  }

  Widget closeIconField(animationController) {
    return GestureDetector(
      onTap: () {
        Get.back(closeOverlays: true);
        animationController.dispose();
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: 22.sp,
          width: 22.sp,
          padding: EdgeInsets.all(7.sp),
          decoration: BoxDecoration(
            color: AppColors.whiteColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: AppColors.boxShadowColor.withOpacity(0.5),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: CustomImageWidget.imageAssetWidget(
              AppImages.closeIcon, 1.h, 1.w, BoxFit.fill),
        ),
      ),
    );
  }

  Widget circleThreeField(scaleAnimation, fadeAnimation) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          height: 12.h,
          width: 12.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: AppColors.darkGreenColor.withOpacity(0.1),
          ),
        ),
      ),
    );
  }

  Widget circleTwoField(scaleAnimation, fadeAnimation) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          height: 10.h,
          width: 10.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: AppColors.darkGreenColor.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  Widget circleOneField() {
    return Container(
      height: 8.h,
      width: 8.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: AppColors.darkGreenColor,
      ),
    );
  }

  Widget iconField() {
    return Center(
      child: Icon(
        Icons.done_rounded,
        color: AppColors.whiteColor,
        size: 25.0,
      ),
    );
  }

  Widget pwdUpdateTextField() {
    return Text(
      AppLabel.pwdChangeDialog,
      textAlign: TextAlign.center,
      style: AppStyle.semiBoldTextStyle(
        size: 15.sp,
        color: AppColors.darkOrangeColor,
      ),
    );
  }
}
