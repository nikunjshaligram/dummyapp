// ignore_for_file: unused_local_variable

import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:dummyapp/app/widgets/snackbar_cell.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/error/failures.dart';
import '../../../core/storage/get_storage_helper.dart';
import '../../../data/model/request_model/login_request_model.dart';

class LoginController extends BaseGetXController {
  var emailController =
      TextEditingController(text: 'kminchelle'); //text: 'kminchelle'
  var passwordController =
      TextEditingController(text: '0lelplR'); //text: '0lelplR'
  var isShowPassword = true.obs;
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
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  bool passwordShowHide() {
    bool checkval = isShowPassword.value = !isShowPassword.value;
    return checkval;
  }

  Icon passwordShowHideIcon() {
    return Icon(
      isShowPassword.value ? Icons.visibility_off : Icons.visibility,
      color: isShowPassword.value
          ? AppColors.lightTextColor
          : AppColors.blackColor,
    );
  }

  void forgotPasswordTap() {
    Get.toNamed(Routes.FORGOTPASSWORD);
  }

  void validation(context) async {
    RegExp regex1 = RegExp(pattern);
    // if (emailController.text.isEmpty) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationEmailEmptyText, title: "");
    // } else if (!(regex1.hasMatch(emailController.text))) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationEmailInvalidText,
    //       title: "");
    // } else if (passwordController.text.isEmpty) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationPasswordEmptyText,
    //       title: "");
    // } else if (!regex.hasMatch(passwordController.text)) {
    //   SnackBarWidget.showSnackBar(AppLabel.validationPasswordPatternText,
    //       title: "");
    // } else {
    FocusScope.of(context).unfocus();
    isLoading.value = true;
    loginUser();
    // }
  }

  Future<void> loginUser() async {
    final failureOrSuccess = await authRepository.login(
        request: LoginRequestModel(
            email: emailController.text, password: passwordController.text));

    failureOrSuccess.fold((failure) {
      isLoading.value = false;
      if (failure == ServerFailure()) {
        SnackBarWidget.showSnackBar("Server lost");
      }
    }, (response) {
      isLoading.value = false;

      // if (response.code == 0) {
      // LoginData data = response.data;
      // LoginData data = response.;
      boxStorage.setBool(GetStorageHelper.isLogin, true);
      boxStorage.setString(GetStorageHelper.token, response.token);
      Get.toNamed(Routes.HOME);

      // } else {
      //   SnackBarWidget.showSnackBar(response.message);
      // }
    });
  }
}
