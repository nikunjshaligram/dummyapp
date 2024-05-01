import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/core/theme/styles.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/custom_tap.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.whiteColor,
        leading: CommonWidget()
            .backArrowField(AppColors.backArrowBackgroundColor)
            .paddingOnly(left: 5.screenWidth),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CommonWidget().logoField(),
              3.screenHeight.height,
              CommonWidget().headerTextField(AppLabel.authCode),
              2.screenHeight.height,
              CommonWidget().subTextField(AppLabel.authCodeSubTitle),
              0.5.screenHeight.height,
              emailField(),
              7.screenHeight.height,
              otpField(),
              4.screenHeight.height,
              resendField(),
              4.screenHeight.height,
              btnVerify(context),
              15.screenHeight.height,
              signinTextField(),
            ],
          ).paddingSymmetric(horizontal: 5.screenWidth),
        ),
      ),
    );
  }

  Widget emailField() {
    return Text(
      "test@gmail.com",
      textAlign: TextAlign.center,
      style: AppStyle.semiBoldTextStyle(
        size: 11.sp,
        color: AppColors.primaryColor,
      ),
    );
  }

  Widget otpField() {
    return Obx(
      () => Container(
        color: AppColors.whiteColor,
        child: CustomTap(
          isNormalClick: false,
          onTap: () => controller.textFieldFocus[0].requestFocus(),
          child: Stack(
            children: [
              IgnorePointer(
                child: TextFormField(
                  enableInteractiveSelection: false,
                  focusNode: controller.textFieldFocus[0],
                  showCursor: false,
                  textAlign: TextAlign.center,
                  style: AppStyle.regularTextStyle(
                      size: 11.sp, color: AppColors.transparentColor),
                  cursorColor: AppColors.primaryColor,
                  textAlignVertical: TextAlignVertical.center,
                  keyboardType: TextInputType.phone,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                  ],
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  onChanged: (value) {
                    controller.otp.value = value;
                    controller.otpInvalid.value = false;
                    if (value.length == 4) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    }
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  otpView(0),
                  4.screenWidth.width,
                  otpView(1),
                  4.screenWidth.width,
                  otpView(2),
                  4.screenWidth.width,
                  otpView(3),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpView(int index) {
    return Container(
      height: 8.screenHeight,
      width: 18.screenWidth,
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.sp,
            color:
                // controller.otp.value.length == index ||
                //         (index == 3 && controller.otp.value.length > 3)
                //     ? AppColors.lightBorderColor
                //     :
                AppColors.primaryColor),
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      child: Center(
        child: Text(
          controller.otp.value.length > index &&
                  !controller.otp.value.isNullEmpty
              ? controller.otp.value[index]
              : "",
          style: AppStyle.mediumTextStyle(
              size: 23.sp, color: AppColors.primaryColor),
        ),
      ),
    );
  }

  Widget resendField() {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonWidget().subTextField(AppLabel.didntReceivedCode),
          Text(
            AppLabel.resend,
            style: AppStyle.semiBoldTextStyle(
              size: 11.sp,
              color: AppColors.darkOrangeColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget btnVerify(context) {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight,
      buttonWidth: 1.0,
      title: AppLabel.verify,
      isLoading: controller.isLoading.value,
      onButtonPressed: () {
        controller.validation(context);
      },
    );
  }

  Widget signinTextField() {
    return GestureDetector(
      onTap: () {
        controller.signinTap();
      },
      child: CommonWidget()
          .bottomTextField(AppLabel.signin, AppColors.darkOrangeColor),
    );
  }
}
