import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../core/storage/get_storage_helper.dart';

class SplashController extends BaseGetXController
    with GetSingleTickerProviderStateMixin {
  // late final AnimationController controller = AnimationController(
  //   duration: const Duration(milliseconds: 5000),
  //   vsync: this,
  // )..repeat(reverse: false);

  // late final Animation<double> animation = CurvedAnimation(
  //   parent: controller,
  //   curve: Curves.fastOutSlowIn,
  // );

  late final AnimationController animationController = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  )..repeat(reverse: false, max: 1, period: Duration(milliseconds: 4000));
  late final Animation<Offset> offsetAnimation = Tween<Offset>(
    begin: const Offset(1.5, 0),
    end: Offset.zero,
  ).animate(CurvedAnimation(
    parent: animationController,
    curve: Curves.decelerate,
  ));

  @override
  void onInit() {
    super.onInit();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    startAnimation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future startAnimation() async {
    await Future.delayed(
      const Duration(milliseconds: 5000),
    );
    animationController.dispose();

    if (boxStorage.getBool(GetStorageHelper.isLogin) == true) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
  }
}
