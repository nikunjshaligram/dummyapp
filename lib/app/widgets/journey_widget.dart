// ignore_for_file: must_be_immutable

import 'package:dummyapp/app/modules/journey_detail/controllers/journey_detail_controller.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../core/constants/images.dart';
import '../core/theme/colors.dart';
import '../core/theme/styles.dart';
import 'custom_image_widget.dart';

class JourneyWidget extends StatelessWidget {
  JourneydetailController controller;
  JourneyWidget(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "Location",
          textAlign: TextAlign.left,
          style: AppStyle.semiBoldTextStyle(
            size: 9.sp,
            color: AppColors.lightTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        1.screenHeight.height,
        userDetailCardField(),
        1.screenHeight.height,
        Text(
          "Products (3)",
          textAlign: TextAlign.left,
          style: AppStyle.semiBoldTextStyle(
            size: 9.sp,
            color: AppColors.lightTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        1.screenHeight.height,
        productListField()
      ],
    ).paddingAll(15.sp);
  }

  Widget userDetailCardField() {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  "Journey Name",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(":"),
              2.screenWidth.width,
              Text(
                "Journey-1",
                style: AppStyle.regularTextStyle(
                  size: 9.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          0.5.screenHeight.height,
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  "Type",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(":"),
              2.screenWidth.width,
              Text(
                "Collection",
                style: AppStyle.regularTextStyle(
                  size: 9.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          0.5.screenHeight.height,
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  "Company Name",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(":"),
              2.screenWidth.width,
              Text(
                "Jenny Wilson",
                style: AppStyle.regularTextStyle(
                  size: 9.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          0.5.screenHeight.height,
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  "Delivery Address",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(":"),
              2.screenWidth.width,
              Text(
                "2-Lansdowne Cresent.",
                style: AppStyle.regularTextStyle(
                  size: 9.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          0.5.screenHeight.height,
          Row(
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  "Post Code",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(":"),
              2.screenWidth.width,
              Text(
                "BH11SA",
                style: AppStyle.regularTextStyle(
                  size: 9.sp,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          0.5.screenHeight.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  "Instructions",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(":"),
              2.screenWidth.width,
              Flexible(
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          0.5.screenHeight.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * 0.3,
                child: Text(
                  "Delivery Status",
                  style: AppStyle.regularTextStyle(
                    size: 9.sp,
                    color: AppColors.lightTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.lightRedColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    "Pending",
                    style: AppStyle.regularTextStyle(
                      size: 9.sp,
                      color: AppColors.lightTextColor,
                      fontWeight: FontWeight.w400,
                    ),
                  )),
              2.screenWidth.width,
              Spacer(),
              Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: AppColors.darkOrangeColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Icon(
                  Icons.send,
                  size: 12,
                  color: AppColors.whiteColor,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget productListField() {
    return Expanded(
      child: Obx(
        () => ListView.builder(
            itemCount: controller.productList.length,
            itemBuilder: (context, index) {
              if (index < controller.productList.length) {
                return ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  tileColor: AppColors.whiteColor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                  leading: CustomImageWidget.imageAssetWidget(
                    AppImages.productIcon,
                    40.0,
                    40.0,
                    BoxFit.fill,
                  ),
                  title: Row(
                    children: [
                      Text(
                        controller.productList[index]["id"],
                        style: AppStyle.semiBoldTextStyle(
                          size: 11.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      2.screenWidth.width,
                      Container(
                        height: 4,
                        width: 4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.0),
                            color: AppColors.darkOrangeColor),
                      ),
                      2.screenWidth.width,
                      Text(
                        controller.productList[index]["date"],
                        style: AppStyle.regularTextStyle(
                          size: 10.sp,
                          color: AppColors.lightTextColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    controller.productList[index]["productname"].toString(),
                    style: AppStyle.semiBoldTextStyle(
                      size: 11.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Container(
                      width: 20,
                      child: Transform.scale(
                        scale: 0.8,
                        child: Checkbox(
                            value: controller.productList[index]['isSelect'],
                            checkColor: AppColors.whiteColor,
                            fillColor: MaterialStatePropertyAll(
                                controller.productList[index]['isSelect']
                                    ? AppColors.darkOrangeColor
                                    : AppColors.whiteColor),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                  width: 1,
                                  color: controller.productList[index]
                                              ['isSelect'] ==
                                          false
                                      ? AppColors.lightTextColor
                                      : AppColors.transparentColor),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2),
                            ),
                            onChanged: (bool? value) {
                              controller.actionRemeberMe(
                                  value!, index, controller.productList, '');
                            }),
                      )
                      // CheckboxListTile(
                      //   visualDensity: VisualDensity.compact,
                      //   controlAffinity: ListTileControlAffinity.leading,
                      //   checkColor: AppColors.whiteColor,
                      // fillColor: MaterialStatePropertyAll(
                      //     controller.productList[index]['isSelect']
                      //         ? AppColors.darkOrangeColor
                      //         : AppColors.whiteColor),
                      // side: controller.productList[index]['isSelect'] == false
                      //     ? MaterialStateBorderSide.resolveWith(
                      //         (states) => const BorderSide(
                      //             width: 1, color: AppColors.lightTextColor),
                      //       )
                      //     : null,
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(2)),
                      //   value: controller.productList[index]['isSelect'],
                      //   onChanged: (bool? value) {
                      //     controller.actionRemeberMe(value!, index);
                      //   },
                      // ),
                      ),
                ).paddingOnly(top: 5.0);
              } else {
                // No more posts to load
                return SizedBox(); // Return an empty container
              }
            }),
      ),
    );
  }
}
