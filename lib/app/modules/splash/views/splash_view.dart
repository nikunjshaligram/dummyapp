import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/core/constants/images.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/theme/styles.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backImageField(AppImages.rectOneImage),
          backImageField(AppImages.rectTwoImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlideTransition(
                position: controller.offsetAnimation,
                child: logoImageField(AppImages.vectorImage),
              )
              // ScaleTransition(
              //   scale: controller.animation,
              //   child: logoImageField(AppImages.vectorImage),
              // ),
            ],
          ).paddingOnly(top: 11.5.screenHeight, left: 8.screenWidth),
          // .paddingOnly(top: 16.5.screenHeight, left: 8.5.screenWidth)
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlideTransition(
                position: controller.offsetAnimation,
                child: logoImageField(AppImages.logoImage),
              ),
              Spacer(),
              bottomTextField().paddingOnly(bottom: 5.screenHeight),

              // ScaleTransition(
              //   scale: controller.animation,
              //   child: logoImageField(AppImages.logoImage),
              // ),
            ],
          ).paddingOnly(top: 11.screenHeight, left: 5.screenWidth),
          // .paddingOnly(top: 16.screenHeight, left: 6.screenWidth)
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Text(
          //     "Get Your Parcel\nDelivered @your Doorstep\nEffortlessly!",
          //     textAlign: TextAlign.center,
          //     style: AppStyle.sfRegularTextStyle(
          //       size: 14.sp,
          //       color: AppColors.whiteColor,
          //       fontWeight: FontWeight.w300,
          //     ),
          //   ).paddingHorizontal(3.screenWidth),
          // ).paddingOnly(
          //     bottom: 15.screenHeight,
          //     left: 2.screenWidth,
          //     right: 2.screenWidth)
        ],
      ),

      // Stack(
      //   alignment: Alignment.center,
      //   children: [
      //     Center(
      // child: ScaleTransition(
      //   scale: controller.animation,
      //   child: Text(
      //         //   AppLabel.appName,
      //         //   textAlign: TextAlign.center,
      // style: AppStyle.regularTextStyle(
      //   size: 25.sp,
      //   letterSpacing: 0.6,
      //   color: AppColors.whiteColor,
      //   fontWeight: FontWeight.w700,
      // ),
      //         // ),
      //         child: Image.asset(
      //           AppImages.logoImage,
      //           height: Get.size.height * 0.5,
      //           width: Get.size.width * 0.5,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }

  Widget backImageField(image) {
    return CustomImageWidget.imageAssetWidget(
      image,
      Get.height,
      Get.width,
      BoxFit.fill,
    );
  }

  Widget logoImageField(image) {
    return CustomImageWidget.imageAssetWidget(
        image, 18.screenHeight, 18.screenHeight, BoxFit.fitHeight);
  }

  Widget bottomTextField() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLabel.poweredBy,
          style: AppStyle.regularTextStyle(
            size: 9.sp,
            color: AppColors.whiteColor,
          ),
        ),
        Text(
          AppLabel.heartSystems,
          style: AppStyle.boldTextStyle(
            size: 9.sp,
            color: AppColors.darkOrangeColor,
          ),
        ),
        CustomImageWidget.imageAssetWidget(AppImages.orangeHeartIcon,
            0.7.screenHeight, 0.7.screenHeight, BoxFit.fill)
      ],
    );
  }
}
