import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../core/constants/images.dart';
import '../core/theme/colors.dart';
import '../core/theme/styles.dart';

class CommonWidget {
  Widget logoField() {
    return CustomImageWidget.imageAssetWidget(
        AppImages.logoImage, 11.h, 22.w, BoxFit.fill); //70.sp
  }

  Widget headerTextField(title) {
    return Text(
      title,
      style: AppStyle.semiBoldTextStyle(
        size: 16.sp,
        color: AppColors.darkOrangeColor,
      ),
    );
  }

  Widget textField(title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppStyle.mediumTextStyle(
          size: 10.sp,
          color: AppColors.lightTextColor,
        ),
      ),
    );
  }

  Widget subTextField(subTitle) {
    return Text(
      subTitle,
      textAlign: TextAlign.center,
      style: AppStyle.regularTextStyle(
        size: 11.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget bottomTextField(title, textColor) {
    return Text(
      title,
      style: AppStyle.semiBoldTextStyle(
        size: 10.sp,
        color: textColor,
      ),
    );
  }

  Widget backArrowField(backColor) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Container(
          height: 26.sp,
          width: 26.sp,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: backColor, //AppColors.backArrowBackgroundColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: AppColors.lightTextColor,
            size: 14,
          ).paddingOnly(left: 2.screenWidth),
        ),
      ),
    );
  }

  Widget appbarTextWidget(title) {
    return Text(
      title,
      style: AppStyle.semiBoldTextStyle(
        size: 11.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget journeyImageWidget() {
    return CustomImageWidget.imageAssetWidget(
      AppImages.journeyIcon,
      4.6.screenHeight,
      4.6.screenHeight,
      BoxFit.fill,
    );
  }

  BoxDecoration containerCardDecorationField() {
    return BoxDecoration(
      color: AppColors.whiteColor,
      borderRadius: BorderRadius.circular(8.0),
      boxShadow: [
        BoxShadow(
          color: AppColors.boxShadowColor.withOpacity(0.5),
          blurRadius: 5.0,
        ),
      ],
    );
  }

  Widget locationIconField() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 4.screenHeight,
          width: 4.screenHeight,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        Container(
          height: 2.7.screenHeight,
          width: 2.7.screenHeight,
          decoration: BoxDecoration(
            color: AppColors.darkOrangeColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        CustomImageWidget.imageAssetWidget(
          AppImages.locationIcon,
          1.4.screenHeight,
          1.4.screenHeight,
          BoxFit.fill,
        ),
      ],
    );
  }

  Widget dividerField() {
    return Divider(
      color: AppColors.lightBorderColor,
      height: 0.3,
    );
  }
}
