import 'dart:ffi';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../controllers/journey_controller.dart';

class JourneyView extends GetView<JourneyController> {
  const JourneyView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.statusPendingColor,
      body: Obx(
        () => SafeArea(
          child: controller.isConnection.value == false
              ? Text("No Internet")
              : ListView.builder(
                  itemCount: controller.journeyList.length,
                  itemBuilder: (context, index) {
                    if (index < controller.journeyList.length) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.screenWidth,
                          vertical: 1.screenHeight,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 2.screenWidth),
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 6.screenWidth),
                                child: Container(
                                  decoration: CommonWidget()
                                      .containerCardDecorationField(),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonWidget().journeyImageWidget(),
                                      3.screenWidth.width,
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              journeyIdField(index),
                                              3.screenWidth.width,
                                              dotField(),
                                              3.screenWidth.width,
                                              journeyDateField(index),
                                            ],
                                          ).paddingSymmetric(
                                              vertical: 1.screenHeight),
                                          Row(
                                            children: [
                                              subTitleTextField("Deliveries"),
                                              3.screenWidth.width,
                                              productCountField(index),
                                            ],
                                          ),
                                          1.screenHeight.height,
                                          Row(
                                            children: [
                                              subTitleTextField("Status:"),
                                              3.screenWidth.width,
                                              deliveryStatusField(index),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ).paddingAll(1.screenHeight),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                top: 3.5.screenHeight,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.nextScreen(
                                          controller.journeyList[index]['id']);
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        circleField(5.screenHeight,
                                            AppColors.statusPendingColor),
                                        circleField(3.5.screenHeight,
                                            AppColors.whiteColor),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: AppColors.lightTextColor,
                                          size: 12.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                    // else if (controller.isLoading.value) {
                    //   // Display loading indicator if there are more posts to load
                    //   return Center(
                    //     child: CircularProgressIndicator(),
                    //   );
                    // }
                    else {
                      // No more posts to load
                      return SizedBox(); // Return an empty container
                    }
                  },
                ),
        ),
      ),
    );
  }

  Widget journeyIdField(index) {
    return Text(
      controller.journeyList[index]["id"],
      style: AppStyle.semiBoldTextStyle(
        size: 13.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget dotField() {
    return Container(
      height: 0.5.screenHeight,
      width: 0.5.screenHeight,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: AppColors.darkOrangeColor),
    );
  }

  Widget journeyDateField(index) {
    return Text(
      controller.journeyList[index]["date"],
      style: AppStyle.mediumTextStyle(
        size: 11.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget subTitleTextField(subTitle) {
    return Text(
      subTitle,
      style: AppStyle.mediumTextStyle(
        size: 9.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget productCountField(index) {
    return Text(
      controller.journeyList[index]["product"].toString(),
      style: AppStyle.semiBoldTextStyle(
        size: 9.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget deliveryStatusField(index) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: 2.screenWidth, vertical: 0.5.screenHeight),
      decoration: deliveryStatusDecorationField(
          controller.journeyList[index]["status"]),
      child: Text(
        controller.journeyList[index]["status"].toString(),
        style: deliveryStatusTextStyleField(
            controller.journeyList[index]["status"]),
      ),
    );
  }

  BoxDecoration deliveryStatusDecorationField(status) {
    return BoxDecoration(
      color: status == "Pending"
          ? AppColors.statusPendingColor
          : status == "Delivered"
              ? AppColors.lightGreenColor
              : AppColors.lightRedColor,
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  TextStyle deliveryStatusTextStyleField(status) {
    return AppStyle.mediumTextStyle(
      size: 9.sp,
      color: status == "Pending"
          ? AppColors.lightTextColor
          : status == "Delivered"
              ? AppColors.darkGreenColor
              : AppColors.darkRedColor,
    );
  }

  Widget circleField(size, backColor) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: backColor,
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
