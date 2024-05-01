import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../controllers/journey_list_controller.dart';

class JourneyListView extends GetView<JourneyListController> {
  const JourneyListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.statusPendingColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.statusPendingColor,
          leading: CommonWidget()
              .backArrowField(AppColors.whiteColor)
              .paddingOnly(left: 5.screenWidth),
          title: CommonWidget().appbarTextWidget(
            controller.journeyId.toString(),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 6,
                      child: titleTextField(
                        AppLabel.todayDelivery +
                            ' (${(controller.deliveryData.length)})',
                      ),
                    ),
                    pickUpCheckboxField(),
                  ],
                ),
                1.screenHeight.height,
                deliveryListField(),
                titleTextField(AppLabel.todayCollection +
                    ' (${(controller.collectionData.length)})'),
                1.screenHeight.height,
                //  collectionListField()
              ],
            ),
          ).paddingSymmetric(
              horizontal: 6.screenWidth, vertical: 1.screenHeight),
        ),
        bottomNavigationBar: btnPickedAll().paddingOnly(
            left: 6.screenWidth, right: 6.screenWidth, bottom: 3.screenHeight),
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

  Widget pickUpCheckboxField() {
    return Expanded(
      flex: 4,
      child: Transform.scale(
        alignment: Alignment.centerRight,
        scale: 0.8,
        child: CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: Transform.translate(
            offset: const Offset(20, 0),
            child: Text(
              "Pickup All",
              style: AppStyle.semiBoldTextStyle(
                size: 11.sp,
                color: AppColors.lightTextColor,
              ),
            ),
          ),
          visualDensity: VisualDensity.compact,
          controlAffinity: ListTileControlAffinity.trailing,
          checkColor: AppColors.whiteColor,
          fillColor: MaterialStatePropertyAll(
              controller.deliveryData.every((item) => item["isSelect"])
                  ? AppColors.darkOrangeColor
                  : AppColors.whiteColor),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
                width: 0.3.screenWidth,
                color: controller.deliveryData.every((item) => item["isSelect"])
                    ? AppColors.transparentColor
                    : AppColors.lightTextColor),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
          value: controller.deliveryData.every((item) => item["isSelect"]),
          onChanged: (bool? value) {
            controller.pickupAllChecked(value!, controller.deliveryData);
          },
        ),
      ).paddingOnly(right: 1.screenWidth),
    );
    // GestureDetector(
    //   onTap: () {
    //     print("object");
    //     controller.pickupAll.value = !controller.pickupAll.value;
    //   },
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       pickupAllTextField(),
    //       1.screenWidth.width,
    //       pickupAllChkBoxField(),
    //     ],
    //   ).paddingOnly(right: 3.screenWidth),
    // );
  }

  Widget pickupAllTextField() {
    return Text(
      "Pickup All",
      style: AppStyle.semiBoldTextStyle(
        size: 9.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget pickupAllChkBoxField() {
    return Transform.scale(
      scale: 0.8,
      child: SizedBox(
        height: 2.screenHeight,
        width: 2.screenHeight,
        child: Checkbox(
          value: controller.deliveryData.every((item) => item["isSelect"]),
          checkColor: AppColors.whiteColor,
          fillColor: MaterialStatePropertyAll(
              controller.deliveryData.every((item) => item["isSelect"])
                  ? AppColors.darkOrangeColor
                  : AppColors.whiteColor),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
                width: 0.3.screenWidth,
                color: controller.deliveryData.every((item) => item["isSelect"])
                    ? AppColors.transparentColor
                    : AppColors.lightTextColor),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          onChanged: (value) {
            controller.pickupAllChecked(value!, controller.deliveryData);
          },
        ),
      ),
    );
  }

  Widget deliveryListField() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: controller.deliveryData.length,
        itemBuilder: (context, deliveyIndex) {
          var deliveryData = controller.deliveryData[deliveyIndex];
          return GestureDetector(
            onTap: () {
              controller.deliveryItemTap(deliveryData);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 2.screenWidth, vertical: 1.screenHeight),
              decoration: CommonWidget().containerCardDecorationField(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CommonWidget().journeyImageWidget(),
                      2.screenWidth.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          deliveryTitleField(deliveryData),
                        ],
                      ),
                      Spacer(),
                      individualChkBoxField(
                          deliveryData, controller.deliveryData),
                    ],
                  ),
                  deliveryDateField(deliveryData),
                  deliveryAddressField(deliveryData),
                  Row(
                    children: [
                      deliveryStatusTextField(),
                      1.screenWidth.width,
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.screenWidth,
                            vertical: 0.5.screenHeight),
                        decoration: deliveryStatusDecorationField(
                            deliveryData["delivery_status"]),
                        child: deliveryStatusField(
                            deliveryData["delivery_status"]),
                      )
                    ],
                  ).paddingOnly(left: 12.screenWidth, bottom: 0.5.screenHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      parcelTextField(),
                      2.screenWidth.width,
                      InkWell(
                          onTap: () {
                            controller.removeQty(deliveryData);
                          },
                          child: qtyAddRemoveField(Icons.remove)),
                      parcelQtyField(deliveryData),
                      InkWell(
                          onTap: () {
                            controller.addQty(deliveryData);
                          },
                          child: qtyAddRemoveField(Icons.add))
                    ],
                  )
                ],
              ).paddingAll(0.5.screenHeight),
            ).paddingOnly(bottom: 2.screenHeight),
          );
        });
  }

  Widget deliveryTitleField(deliveryData) {
    return Text(
      deliveryData['deliveryTitle'],
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: AppStyle.semiBoldTextStyle(
        size: 13.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget individualChkBoxField(deliveryData, deliveryDataList) {
    return Transform.scale(
      scale: 0.8,
      child: SizedBox(
        height: 2.screenHeight,
        width: 2.screenHeight,
        child: Checkbox(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity(horizontal: -4, vertical: -4),
          value: deliveryData['isSelect'],
          checkColor: AppColors.whiteColor,
          fillColor: MaterialStatePropertyAll(deliveryData['isSelect']
              ? AppColors.darkOrangeColor
              : AppColors.whiteColor),
          side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(
                width: 0.3.screenWidth,
                color: deliveryData['isSelect']
                    ? AppColors.transparentColor
                    : AppColors.lightTextColor),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
          onChanged: (bool? value) {
            controller.deliveryChecked(value!, deliveryData, deliveryDataList);
          },
        ),
      ),
    );
  }

  Widget deliveryDateField(deliveryData) {
    return Text(
      deliveryData['date'],
      style: AppStyle.mediumTextStyle(
        size: 11.sp,
        color: AppColors.lightTextColor,
      ),
    ).paddingOnly(left: 12.screenWidth, bottom: 1.screenHeight);
  }

  Widget deliveryAddressField(deliveryData) {
    return Text(
      deliveryData['address'],
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: AppStyle.regularTextStyle(
        size: 9.sp,
        color: AppColors.lightTextColor,
      ),
    ).paddingOnly(left: 12.screenWidth, bottom: 1.screenHeight);
  }

  Widget deliveryStatusTextField() {
    return Text(
      "Delivery Status: ",
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: AppStyle.regularTextStyle(
        size: 9.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  BoxDecoration deliveryStatusDecorationField(status) {
    return BoxDecoration(
      color: status == "Pending"
          ? AppColors.statusPendingColor
          : status == "Delivered"
              ? AppColors.lightGreenColor
              : status == "Picked"
                  ? AppColors.lightOrangeColor
                  : AppColors.lightRedColor,
      borderRadius: BorderRadius.circular(8.0),
    );
  }

  Widget deliveryStatusField(status) {
    return Text(
      status,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      style: AppStyle.mediumTextStyle(
        size: 9.sp,
        color: status == "Pending"
            ? AppColors.lightTextColor
            : status == "Delivered"
                ? AppColors.darkGreenColor
                : status == "Picked"
                    ? AppColors.darkOrangeColor
                    : AppColors.darkRedColor,
      ),
    );
  }

  Widget parcelTextField() {
    return Text(
      "Parcel: ",
      style: AppStyle.semiBoldTextStyle(
        size: 11.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget qtyAddRemoveField(icon) {
    return Container(
      alignment: Alignment.center,
      height: 3.screenHeight,
      width: 3.screenHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.darkOrangeColor, width: 2),
        color: AppColors.roundQtyColor,
      ),
      child: Icon(icon, color: AppColors.darkOrangeColor, size: 20),
    );
  }

  Widget parcelQtyField(deliveryData) {
    return SizedBox(
      width: 15.screenWidth,
      child: Text(
        deliveryData["parcel"] >= 0 && deliveryData["parcel"] <= 9
            ? '0${deliveryData["parcel"]}'
            : deliveryData["parcel"].toString(),
        textAlign: TextAlign.center,
        style: AppStyle.semiBoldTextStyle(
          size: 13.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget btnPickedAll() {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight,
      buttonWidth: 1.0,
      title: AppLabel.picked,
      //isLoading: controller.isLoading.value,
      onButtonPressed: () {
        //controller.validation(context);
      },
    );
  }
}
