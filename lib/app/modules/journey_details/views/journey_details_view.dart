import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../controllers/journey_details_controller.dart';

class JourneyDetailsView extends GetView<JourneyDetailsController> {
  const JourneyDetailsView({Key? key}) : super(key: key);
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
          title: CommonWidget().appbarTextWidget(AppLabel.deliveryDetails),
          actions: [
            GestureDetector(
                onTap: () {
                  controller.locationMapListTap();
                },
                child: CommonWidget()
                    .locationIconField()
                    .paddingOnly(right: 6.screenWidth))
          ],
          centerTitle: true,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 3.screenWidth, vertical: 2.screenHeight),
                  decoration: CommonWidget().containerCardDecorationField(),
                  child: deliveryDetailItemsFiled(),
                ),
                2.screenHeight.height,
                parcelTextField(),
                2.screenHeight.height,
                Flexible(child: parcelListField()),
              ],
            ),
          ).paddingSymmetric(
              horizontal: 5.screenWidth, vertical: 1.screenHeight),
        ),
        bottomNavigationBar: btnNext().paddingOnly(
            left: 6.screenWidth, right: 6.screenWidth, bottom: 3.screenHeight),
      ),
    );
  }

  Widget deliveryDetailItemsFiled() {
    return Column(
      children: [
        Row(
          children: [
            keyField(AppLabel.pulsepodNo),
            colonField(),
            valueField("#6K3M43S1")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.deliveryNo),
            colonField(),
            valueField("5K3M4001")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.deliveryNoteDate),
            colonField(),
            valueField("28 Mar 2024")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.companyName),
            colonField(),
            valueField("Kling, Hilpert Feil")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.deliveryAddress),
            colonField(),
            valueField("2-Lansdowne Crescent.")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.postCode),
            colonField(),
            valueField("BH1 1SA")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.deliveryContact),
            colonField(),
            valueField("Jems White")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.deliveryPhoneNumber),
            colonField(),
            valueField("+44 2654 6268")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.noParcels),
            colonField(),
            valueField("3")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.instructions),
            colonField(),
            valueField(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.note),
            colonField(),
            valueField(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.")
          ],
        ),
        0.5.screenHeight.height,
        Row(
          children: [
            keyField(AppLabel.deliveryStatus),
            colonField(),
            valueField("Out For Delivery")
          ],
        ),
      ],
    );
  }

  Widget keyField(key) {
    return SizedBox(
      width: Get.width * 0.32,
      child: Text(
        key,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: AppStyle.mediumTextStyle(
          size: 9.sp,
          color: AppColors.lightTextColor,
        ),
      ),
    );
  }

  Widget colonField() {
    return Text(" : ");
  }

  Widget valueField(value) {
    return Expanded(
      child: Text(
        value,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: AppStyle.regularTextStyle(
          size: 9.sp,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  Widget parcelTextField() {
    return Text(
      AppLabel.parcel + ' (${(controller.parcelData.length)})',
      style: AppStyle.semiBoldTextStyle(
        size: 11.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget parcelListField() {
    return Obx(
      () => ListView.builder(
        itemCount: controller.parcelData.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.symmetric(
                horizontal: 2.screenWidth, vertical: 1.screenHeight),
            decoration: CommonWidget().containerCardDecorationField(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonWidget().journeyImageWidget(),
                    2.screenWidth.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        parcelField(AppLabel.itemName,
                            controller.parcelData[index]["id"]),
                        0.5.screenHeight.height,
                        parcelField(AppLabel.orderQty,
                            controller.parcelData[index]["order_qty"]),
                      ],
                    ),
                    Spacer(),
                    editIconField(index)
                  ],
                ),
                1.screenHeight.height,
                descriptionField(AppLabel.description,
                    controller.parcelData[index]["description"]),
                1.screenHeight.height,
                qtyDeliveredField(index),
                2.screenHeight.height,
                commentField(index)
              ],
            ),
          ).paddingOnly(bottom: 2.screenHeight);
        },
      ),
    );
  }

  Widget parcelField(key, value) {
    return Row(
      children: [
        parcelKeyField(key + " : "),
        Text(
          value,
          style: AppStyle.semiBoldTextStyle(
            size: 9.sp,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }

  Widget editIconField(index) {
    return GestureDetector(
      onTap: () {
        controller.editOrderTap(index);
      },
      child: Container(
        height: 24,
        width: 24,
        decoration: BoxDecoration(
          color: !controller.parcelData[index]["isSelect"]
              ? AppColors.darkOrangeColor
              : AppColors.darkGreenColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          !controller.parcelData[index]["isSelect"]
              ? Icons.edit
              : Icons.check_outlined,
          size: 14.0,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }

  Widget descriptionField(key, value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        parcelKeyField(key + " : "),
        Flexible(
          child: Text(
            value,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: AppStyle.regularTextStyle(
              size: 9.sp,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget qtyDeliveredField(index) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: parcelKeyField(AppLabel.qtyDelivered),
        ),
        Expanded(
          flex: 8,
          child: TextFormField(
            readOnly: !controller.parcelData[index]["isSelect"],
            decoration:
                textFieldDecoration(controller.parcelData[index]["isSelect"]),
          ),
        )
      ],
    );
  }

  Widget commentField(index) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: parcelKeyField(AppLabel.comment),
        ),
        Expanded(
          flex: 8,
          child: TextFormField(
            readOnly: !controller.parcelData[index]["isSelect"],
            decoration:
                textFieldDecoration(controller.parcelData[index]["isSelect"]),
          ),
        )
      ],
    );
  }

  Widget parcelKeyField(key) {
    return Text(
      key,
      style: AppStyle.mediumTextStyle(
        size: 9.sp,
        color: AppColors.lightTextColor,
      ),
    );
  }

  Widget btnNext() {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight,
      buttonWidth: 1.0,
      title: AppLabel.next,
      onButtonPressed: () {},
    );
  }

  InputDecoration textFieldDecoration(selectedIndex) {
    return InputDecoration(
      isDense: true,
      filled: controller.isReadOnly.value,
      contentPadding: EdgeInsets.all(10.0),
      fillColor: !selectedIndex
          ? AppColors.textboxLightBackColor
          : AppColors.transparentColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
            color: !selectedIndex
                ? AppColors.primaryColor
                : AppColors.lightBorderColor,
            width: 1.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
            color: !selectedIndex
                ? AppColors.lightBorderColor
                : AppColors.primaryColor,
            width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
            color: !selectedIndex
                ? AppColors.lightBorderColor
                : AppColors.primaryColor,
            width: 1.0),
      ),
    );
  }
}
