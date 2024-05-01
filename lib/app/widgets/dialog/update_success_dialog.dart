import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_label.dart';
import '../../core/theme/styles.dart';
import '../common_widget.dart';
import '../custom_button_widget.dart';

class UpdateSuccessDialog {
  updateDialog(scaleAnimation, fadeAnimation, animationController) {
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
            1.screenHeight.height,
            CommonWidget().subTextField(AppLabel.pwdUpdateSubTitle),
            2.screenHeight.height,
            btnBacktoHome(animationController)
          ],
        ).paddingAll(2.screenHeight),
      ),
    );
  }

  Widget circleThreeField(scaleAnimation, fadeAnimation) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Container(
          height: 12.screenHeight,
          width: 12.screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: AppColors.greenColor.withOpacity(0.2),
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
          height: 10.screenHeight,
          width: 10.screenHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: AppColors.greenColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }

  Widget circleOneField() {
    return Container(
      height: 8.screenHeight,
      width: 8.screenHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: AppColors.greenColor,
      ),
    );
  }

  Widget iconField() {
    return Center(
      child: Icon(
        Icons.done,
        color: AppColors.whiteColor,
        size: 25.0,
      ),
    );
  }

  Widget pwdUpdateTextField() {
    return Text(
      AppLabel.pwdUpdate,
      textAlign: TextAlign.center,
      style: AppStyle.semiBoldTextStyle(
        size: 14.sp,
        color: AppColors.darkOrangeColor,
      ),
    );
  }

  Widget btnBacktoHome(animationController) {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight,
      buttonWidth: 1.0,
      title: AppLabel.backtoSignin,
      onButtonPressed: () {
        Get.offAllNamed(Routes.LOGIN);
        animationController.dispose();
      },
    );
  }
}
