// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/theme/colors.dart';
import '../../../utils/border_custom_painter.dart';
import '../../../utils/static_array.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_dropdown_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controllers/delivered_details_controller.dart';

class DeliveredDetailsView extends GetView<DeliveredDetailsController> {
  const DeliveredDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.statusPendingColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.statusPendingColor,
        leading: CommonWidget()
            .backArrowField(AppColors.whiteColor)
            .paddingOnly(left: 5.screenWidth),
        title: CommonWidget().appbarTextWidget(AppLabel.deliveredDetails),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidget().textField(AppLabel.nameOfPerson),
              1.5.screenHeight.height,
              nameOfPersonField(),
              2.screenHeight.height,
              CommonWidget().textField(AppLabel.deliveryStatus),
              1.5.screenHeight.height,
              deliveryStatusField(),
              2.screenHeight.height,
              CommonWidget().textField(AppLabel.deliveryLocation),
              1.5.screenHeight.height,
              noImageContainerField(context),
              2.screenHeight.height,
              CommonWidget().textField(AppLabel.signature),
              1.5.screenHeight.height,
              signaturePadField(),
              2.screenHeight.height,
              CommonWidget().textField(AppLabel.instructions),
              1.5.screenHeight.height,
              instructionsField(),
              4.screenHeight.height,

              // controller.img.value.buffer.lengthInBytes == 0
              //     ? Container()
              //     : LimitedBox(
              //         maxHeight: 200.0,
              // child: Image.memory(
              //     controller.img.value.buffer.asUint8List())),
              btnSave(context),
            ],
          ).paddingAll(3.screenHeight),
        ),
      ),
    );
  }

  Widget nameOfPersonField() {
    return CustomTextFieldWidget(
      textEditingController: controller.nameOfPersonController,
      labelText: AppLabel.enterNameOfPerson,
      obscureText: false,
      inputAction: TextInputAction.next,
      textFieldType: TextInputType.text,
      fillColor: AppColors.whiteColor,
      focusNodeSelf: controller.textFieldFocus[0],
      focusNodeNext: controller.textFieldFocus[1],
    );
  }

  Widget deliveryStatusField() {
    return CustomDropDown(
      hintText: AppLabel.selectDeliveryStatus,
      selectedValue: controller.selectDeliveryStatus.value.isEmpty
          ? null
          : controller.selectDeliveryStatus.value,
      listItems: StaticArray().delivery_status,
      validator: (val) {
        return null;
      },
      onChanged: (value) {
        controller.changeDeliveryStatus(value);
      },
    );
  }

  Widget noImageContainerField(context) {
    return Obx(
      () => CustomPaint(
        painter: BorderCustomPainter(),
        child: GestureDetector(
          onTap: () {
            controller.cameraGalleryImageTap(context);
          },
          child: Stack(
            children: [
              Container(
                height: 20.screenHeight,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: controller.base64string.value == null ||
                        controller.base64string.value == ""
                    ? Icon(
                        Icons.image,
                        size: 50,
                        color: AppColors.lightTextColor,
                      )
                    : Stack(
                        children: [
                          Image.memory(
                            base64.decode(controller.base64string.value),
                            height: 20.screenHeight,
                            width: Get.width,
                            // fit: BoxFit.fill,
                          ),
                          locationImageRemoveField()
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget locationImageRemoveField() {
    return Positioned(
      right: 0,
      child: GestureDetector(
        onTap: () {
          controller.removeLocationImageTap();
        },
        child: removeIcon(controller.isLocationImage.value),
      ),
    );
  }

  Widget signaturePadField() {
    return Obx(
      () => CustomPaint(
        painter: BorderCustomPainter(),
        child: Stack(
          children: [
            Container(
              height: 13.screenHeight,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Signature(
                color: controller.color.value,
                key: controller.signatures.value,
                onSign: () {
                  controller.signatureDraw();
                },
                strokeWidth: controller.strokeWidth.value,
              ),
            ),
            signatureRemoveField(),
          ],
        ),
      ),
    );
  }

  Widget signatureRemoveField() {
    return Positioned(
      right: 0,
      child: GestureDetector(
        onTap: () {
          controller.removeSignatureTap();
        },
        child: removeIcon(controller.isSignature.value),
      ),
    );
  }

  Widget removeIcon(isRemove) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 300),
      firstChild: Container(
        height: 18.sp,
        width: 18.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: AppColors.whiteColor.withOpacity(0.8),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 1),
              color: AppColors.boxShadowColor.withOpacity(0.7),
              blurRadius: 5.0,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Icon(
          Icons.close_rounded,
          color: AppColors.darkRedColor,
          size: 18,
          weight: 10.0,
        ),
      ).paddingAll(8.0),
      secondChild: SizedBox(
        height: 18.sp,
        width: 18.sp,
      ).paddingAll(8.0),
      crossFadeState:
          isRemove ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget instructionsField() {
    return CustomTextFieldWidget(
      textEditingController: controller.instructionsController,
      labelText: AppLabel.enterInstructions,
      obscureText: false,
      inputAction: TextInputAction.done,
      textFieldType: TextInputType.multiline,
      fillColor: AppColors.whiteColor,
      focusNodeSelf: controller.textFieldFocus[1],
      minLines: 3,
      maxLines: 3,
    );
  }

  Widget btnSave(context) {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight,
      buttonWidth: 1.0,
      title: AppLabel.save,
      isLoading: controller.isLoading.value,
      onButtonPressed: () {
        controller.getSignatureImageTap();
      },
    );
  }
}
