import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dummyapp/app/core/constants/images.dart';
import 'package:dummyapp/app/core/theme/background.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/custom_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/theme/styles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(19.screenHeight),
          child: Container(
            padding: EdgeInsets.zero,
            color: AppColors.statusBarColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        userImageField(),
                        2.screenWidth.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            userNameField(),
                            0.3.screenHeight.height,
                            headerField(
                                AppLabel.companyName, 'S.K. Courier Services'),
                            0.3.screenHeight.height,
                            headerField(AppLabel.despatcherName1, 'Jack White'),
                            0.3.screenHeight.height,
                            headerField(
                                AppLabel.syncDateTime, '9/4/2024 11:30 am'),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        syncIconField(),
                        // 2.screenWidth.width,
                        // locationIconField(),
                      ],
                    ),
                  ],
                ),
                1.3.screenHeight.height,
                tabField(),
              ],
            ).paddingOnly(
              left: 6.screenWidth,
              right: 6.screenWidth,
              top: 5.screenHeight,
            ),
          ),
        ),
        body: controller.getScreen(),
      ),
    );
  }

  Widget userImageField() {
    return GestureDetector(
      onTap: () {
        controller.userProfile();
      },
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightTextColor,
            radius: 25.0,
            child: Padding(
              padding: EdgeInsets.all(1.5.sp),
              child: ClipOval(
                child: CustomImageWidget.imageAssetWidget(
                    AppImages.userImage, 6.h, 6.h, BoxFit.fill),
              ),
            ),
          ),
          Positioned(
            right: 6,
            child: Container(
              height: 1.screenHeight,
              width: 1.screenHeight,
              decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
          )
        ],
      ),
    );
  }

  Widget userNameField() {
    return Container(
      child: Text(
        "Franck Bohbot",
        textAlign: TextAlign.left,
        style: AppStyle.semiBoldTextStyle(
          size: 13.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget headerField(title, subTitle) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.zero,
          width: 20.screenWidth,
          child: Text(
            title,
            textAlign: TextAlign.left,
            style: AppStyle.mediumTextStyle(
              size: 6.sp,
              color: AppColors.lightTextColor,
            ),
          ),
        ),
        Text(
          ":",
          style: AppStyle.mediumTextStyle(
            size: 6.sp,
          ),
        ),
        1.screenWidth.width,
        Container(
          width: 35.screenWidth,
          padding: EdgeInsets.zero,
          child: Text(
            subTitle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.left,
            style: AppStyle.mediumTextStyle(
              size: 6.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget syncIconField() {
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
          AppImages.syncIcon,
          1.4.screenHeight,
          1.4.screenHeight,
          BoxFit.fill,
        ),
      ],
    );
  }

  Widget tabField() {
    return Container(
      height: 7.screenHeight,
      width: 90.screenWidth,
      padding: EdgeInsets.symmetric(vertical: 0.7.screenHeight),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        color: AppColors.whiteColor,
      ),
      child: TabBar(
        labelPadding: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        indicator: BoxDecoration(
          gradient: AppBackground.tabbarLinearGradient(),
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(color: AppColors.darkOrangeColor, width: 1),
        ),
        indicatorColor: AppColors.transparentColor,
        dividerColor: AppColors.transparentColor,
        labelColor: AppColors.primaryColor,
        unselectedLabelColor: AppColors.lightTextColor,
        onTap: controller.changePage,
        labelStyle: AppStyle.semiBoldTextStyle(
          size: 11.sp,
          color: AppColors.primaryColor,
        ),
        unselectedLabelStyle: AppStyle.mediumTextStyle(
          size: 11.sp,
          color: AppColors.lightTextColor,
        ),
        tabs: [
          Container(
            width: 42.screenWidth,
            child: Tab(
              text: AppLabel.journey,
            ),
          ),
          Container(
            width: 42.screenWidth,
            child: Tab(
              text: AppLabel.history,
            ),
          )
        ],
      ),
    );
  }
}
