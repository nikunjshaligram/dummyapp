import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/constants/images.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../widgets/custom_image_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.statusPendingColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(30.screenHeight),
        child: Container(
          child: Stack(children: <Widget>[
            Container(
              child: ClipRRect(child: backImageField()),
            ),
            Row(
              children: [
                Expanded(flex: 1, child: backArrowField()),
                Expanded(
                  flex: 9,
                  child: profileTextField().paddingOnly(right: 20.sp),
                ),
              ],
            ).paddingOnly(left: 20.sp, right: 20.sp, top: 50.sp),
            userImageField()
          ]),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleTextField(AppLabel.personalDetail),
          1.screenHeight.height,
          personDetailField(),
          1.5.screenHeight.height,
          titleTextField(AppLabel.companyInfo),
          1.5.screenHeight.height,
          companyInfoField(),
          2.screenHeight.height,
          changePwdField(),
          2.screenHeight.height,
          logoutField()
        ],
      ).paddingAll(15.sp),
    );
  }

  Widget backImageField() {
    return CustomImageWidget.imageAssetWidget(
        AppImages.profileBack, 160.sp, Get.width, BoxFit.fill);
  }

  Widget backArrowField() {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: AppColors.backArrowBackgroundColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          Icons.arrow_back_ios,
          color: AppColors.lightTextColor,
          size: 14,
        ).paddingOnly(left: 5),
      ),
    );
  }

  Widget profileTextField() {
    return Text(
      AppLabel.profile,
      textAlign: TextAlign.center,
      style: AppStyle.semiBoldTextStyle(
        size: 15.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget userImageField() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: CircleAvatar(
        backgroundColor: AppColors.lightTextColor,
        radius: 75.0,
        child: Padding(
          padding: EdgeInsets.all(3.sp),
          child: ClipOval(
            child: CustomImageWidget.imageAssetWidget(
                AppImages.userImage, 133.h, 133.h, BoxFit.fill),
          ),
        ),
      ),
    );
  }

  Widget titleTextField(title) {
    return Text(
      title,
      style: AppStyle.semiBoldTextStyle(
        size: 11.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget personDetailField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.sp, horizontal: 5.sp),
      child: Column(
        children: [
          Row(
            children: [
              titleField(AppLabel.fullName, 0.2),
              Text(":"),
              2.screenWidth.width,
              subTitleField("Adam Gilchrist")
            ],
          ),
          0.5.screenHeight.height,
          Row(
            children: [
              titleField(AppLabel.email, 0.2),
              Text(":"),
              2.screenWidth.width,
              subTitleField("adamg@gmail.com")
            ],
          ),
          0.5.screenHeight.height,
          Row(
            children: [
              titleField(AppLabel.contact, 0.2),
              Text(":"),
              2.screenWidth.width,
              subTitleField("1234567890")
            ],
          )
        ],
      ),
    );
  }

  Widget companyInfoField() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
      child: Column(
        children: [
          Row(
            children: [
              titleField(AppLabel.companyName, 0.3),
              Text(":"),
              2.screenWidth.width,
              subTitleField("SK Courier Service")
            ],
          ),
          0.5.screenHeight.height,
          Row(
            children: [
              titleField(AppLabel.despatcherName, 0.3),
              Text(":"),
              2.screenWidth.width,
              subTitleField("Jack White")
            ],
          ),
        ],
      ),
    );
  }

  Widget titleField(title, size) {
    return Container(
      width: Get.width * size,
      child: Text(
        title,
        style: AppStyle.regularTextStyle(
          size: 9.sp,
          color: AppColors.lightTextColor,
        ),
      ),
    );
  }

  Widget subTitleField(subTitle) {
    return Text(
      subTitle,
      style: AppStyle.semiBoldTextStyle(
        size: 9.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget changePwdField() {
    return GestureDetector(
      onTap: () {
        controller.changePasswordClick();
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [btnTextField(AppLabel.changePwd), arrowIconField()],
        ),
      ),
    );
  }

  Widget logoutField() {
    return GestureDetector(
      onTap: () {
        controller.logoutClick();
      },
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [btnTextField(AppLabel.logout), arrowIconField()],
        ),
      ),
    );
  }

  Widget btnTextField(title) {
    return Text(
      title,
      style: AppStyle.regularTextStyle(
        size: 11.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget arrowIconField() {
    return Icon(
      Icons.arrow_forward_ios_outlined,
      color: AppColors.lightTextColor,
      size: 14.0,
    );
  }
}
