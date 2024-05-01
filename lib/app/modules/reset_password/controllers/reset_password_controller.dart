// ignore_for_file: unused_local_variable

import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:dummyapp/app/widgets/dialog/update_success_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';

class ResetpasswordController extends BaseGetXController
    with GetTickerProviderStateMixin {
  var newPwdController = TextEditingController();
  var confirmPwdController = TextEditingController();
  var isShowNewPassword = true.obs;
  var isShowConfirmPassword = true.obs;

  late final AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat();

  late final Animation<double> scaleAnimation =
      Tween<double>(begin: 0.6, end: 1).animate(animationController);
  late final Animation<double> fadeAnimation =
      Tween<double>(begin: 1, end: 0.2).animate(animationController);

  @override
  void onInit() {
    super.onInit();

    newPwdController.clear();
    confirmPwdController.clear();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    newPwdController.clear();
    confirmPwdController.clear();
  }

  bool newPasswordShowHide() {
    bool checkval = isShowNewPassword.value = !isShowNewPassword.value;
    return checkval;
  }

  Icon newPasswordShowHideIcon() {
    return Icon(
      isShowNewPassword.value ? Icons.visibility_off : Icons.visibility,
      color: isShowNewPassword.value
          ? AppColors.lightBorderColor
          : AppColors.blackColor,
    );
  }

  bool confirmPasswordShowHide() {
    bool checkval = isShowConfirmPassword.value = !isShowConfirmPassword.value;
    return checkval;
  }

  Icon confirmPasswordShowHideIcon() {
    return Icon(
      isShowConfirmPassword.value ? Icons.visibility_off : Icons.visibility,
      color: isShowConfirmPassword.value
          ? AppColors.lightBorderColor
          : AppColors.blackColor,
    );
  }

  void validation(context) async {
    // if (newPwdController.text.isEmpty) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationNewPasswordEmptyText,
    //       title: "");
    // } else if (!regex.hasMatch(newPwdController.text)) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationPasswordPatternText,
    //       title: "");
    // } else if (confirmPwdController.text.isEmpty) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationConfirmPasswordEmptyText,
    //       title: "");
    // } else if (!regex.hasMatch(confirmPwdController.text)) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationPasswordPatternText,
    //       title: "");
    // } else if (newPwdController.text != confirmPwdController.text) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationPasswordMatchText,
    //       title: "");
    // } else {
    FocusScope.of(context).unfocus();
    UpdateSuccessDialog()
        .updateDialog(scaleAnimation, fadeAnimation, animationController);
    // }
  }

  void signinTap() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
