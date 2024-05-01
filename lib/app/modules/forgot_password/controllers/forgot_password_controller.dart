// ignore_for_file: unused_local_variable

import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotpasswordController extends BaseGetXController {
  var emailController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    emailController.clear();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();

    emailController.dispose();
  }

  void validation(context) async {
    RegExp regex1 = RegExp(pattern);
    // if (emailController.text.isEmpty) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationEmailEmptyText, title: "");
    // } else if (!(regex1.hasMatch(emailController.text))) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationEmailInvalidText,
    //       title: "");
    // } else {
    // FocusScope.of(context).unfocus();
    // isLoading.value = true;
    Get.toNamed(Routes.OTP);
    // }
  }

  void signinTap() {
    Get.back();
  }
}
