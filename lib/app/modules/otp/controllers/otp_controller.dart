// ignore_for_file: unused_local_variable

import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

class OtpController extends BaseGetXController {
  var otp = "".obs;
  var otpInvalid = false.obs;

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
    Get.toNamed(Routes.RESETPASSWORD);
    // }
  }

  void signinTap() {
    Get.back();
  }
}
