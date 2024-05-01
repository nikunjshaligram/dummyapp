import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.whiteColor,
          leading: backArrowField().paddingOnly(left: 15.sp),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              newPwdTextField(),
              4.screenHeight.height,
              textField(AppLabel.oldPwd),
              1.5.screenHeight.height,
              oldPasswordField(),
              2.screenHeight.height,
              textField(AppLabel.newPwd),
              1.5.screenHeight.height,
              newPasswordField(),
              2.screenHeight.height,
              textField(AppLabel.confirmNewPwd),
              1.5.screenHeight.height,
              confirmPasswordField(),
              4.screenHeight.height,
              btnUpdate(context),
            ],
          ).paddingOnly(top: 0.0, bottom: 15.sp, left: 15.sp, right: 15.sp),
        ),
      ),
    );
  }

  Widget backArrowField() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
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
      ),
    );
  }

  Widget newPwdTextField() {
    return Text(
      AppLabel.changePwd,
      style: AppStyle.semiBoldTextStyle(
        size: 18.sp,
        color: AppColors.darkOrangeColor,
      ),
    );
  }

  Widget textField(title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: AppStyle.regularTextStyle(
          size: 11.sp,
          color: AppColors.lightTextColor,
        ),
      ),
    );
  }

  Widget oldPasswordField() {
    return CustomTextFieldWidget(
      textEditingController: controller.oldPwdController,
      labelText: AppLabel.oldPwd,
      obscureText: controller.isShowOldPassword.value,
      inputAction: TextInputAction.next,
      textFieldType: TextInputType.visiblePassword,
      focusNodeSelf: controller.textFieldFocus[0],
      focusNodeNext: controller.textFieldFocus[1],
      suffixIcon: IconButton(
          onPressed: controller.oldPasswordShowHide,
          icon: controller.oldPasswordShowHideIcon()),
    );
  }

  Widget newPasswordField() {
    return CustomTextFieldWidget(
      textEditingController: controller.newPwdController,
      labelText: AppLabel.newPwd,
      obscureText: controller.isShowNewPassword.value,
      inputAction: TextInputAction.next,
      textFieldType: TextInputType.visiblePassword,
      focusNodeSelf: controller.textFieldFocus[1],
      focusNodeNext: controller.textFieldFocus[2],
      suffixIcon: IconButton(
          onPressed: controller.newPasswordShowHide,
          icon: controller.newPasswordShowHideIcon()),
    );
  }

  Widget confirmPasswordField() {
    return CustomTextFieldWidget(
      textEditingController: controller.confirmPwdController,
      labelText: AppLabel.confirmNewPwd,
      obscureText: controller.isShowConfirmPassword.value,
      inputAction: TextInputAction.done,
      textFieldType: TextInputType.visiblePassword,
      focusNodeSelf: controller.textFieldFocus[2],
      suffixIcon: IconButton(
          onPressed: controller.confirmPasswordShowHide,
          icon: controller.confirmPasswordShowHideIcon()),
    );
  }

  Widget btnUpdate(context) {
    return CustomButtonWidget(
      buttonHeight: 0.067,
      buttonWidth: 1.0,
      title: AppLabel.update,
      isLoading: controller.isLoading.value,
      onButtonPressed: () {
        controller.validation(context);
      },
    );
  }
}
