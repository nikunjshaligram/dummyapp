import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/widgets/dialog/change_password_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_label.dart';
import '../../../core/theme/colors.dart';
import '../../../widgets/snackbar_cell.dart';

class ChangePasswordController extends BaseGetXController
    with GetTickerProviderStateMixin {
  var oldPwdController = TextEditingController();
  var newPwdController = TextEditingController();
  var confirmPwdController = TextEditingController();
  var isShowOldPassword = true.obs;
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
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    oldPwdController.dispose();
    newPwdController.dispose();
    confirmPwdController.dispose();
  }

  bool oldPasswordShowHide() {
    bool checkval = isShowOldPassword.value = !isShowOldPassword.value;
    return checkval;
  }

  Icon oldPasswordShowHideIcon() {
    return Icon(
      isShowOldPassword.value ? Icons.visibility_off : Icons.visibility,
      color: isShowOldPassword.value
          ? AppColors.lightBorderColor
          : AppColors.blackColor,
    );
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
    if (oldPwdController.text.isEmpty) {
      SnackBarWidget.showSnackBar(AppLabel.validationOldPasswordEmptyText,
          title: "");
    } else if (!regex.hasMatch(oldPwdController.text)) {
      SnackBarWidget.showSnackBar(AppLabel.validationPasswordPatternText,
          title: "");
    } else if (newPwdController.text.isEmpty) {
      SnackBarWidget.showSnackBar(AppLabel.validationNewPasswordEmptyText,
          title: "");
    } else if (!regex.hasMatch(newPwdController.text)) {
      SnackBarWidget.showSnackBar(AppLabel.validationPasswordPatternText,
          title: "");
    } else if (confirmPwdController.text.isEmpty) {
      SnackBarWidget.showSnackBar(AppLabel.validationConfirmPasswordEmptyText,
          title: "");
    } else if (!regex.hasMatch(confirmPwdController.text)) {
      SnackBarWidget.showSnackBar(AppLabel.validationPasswordPatternText,
          title: "");
    } else if (newPwdController.text != confirmPwdController.text) {
      SnackBarWidget.showSnackBar(AppLabel.validationPasswordMatchText,
          title: "");
    } else {
      FocusScope.of(context).unfocus();

      changeSuccessDialog()
          .changeDialog(scaleAnimation, fadeAnimation, animationController);
    }
  }
}
