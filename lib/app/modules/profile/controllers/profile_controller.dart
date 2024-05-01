import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:dummyapp/app/widgets/dialog/app_alert_dialog.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProfileController extends BaseGetXController {
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

  changePasswordClick() {
    Get.toNamed(Routes.CHANGE_PASSWORD);
  }

  logoutClick() {
    showGeneralDialog(
      barrierColor: AppColors.primaryColor.withOpacity(0.5),
      transitionBuilder: (context, a1, a2, widget) => Transform.scale(
        scale: a1.value,
        child: Opacity(
          opacity: a1.value,
          child: AppAlertDialog(
              onConfirm: () {
                Get.back();
                Get.offAllNamed(Routes.LOGIN);
                boxStorage.clearWholeApp();
              },
              title: AppLabel.logout,
              subtitle: AppLabel.areYouSureYouWantToLogout,
              okButton: AppLabel.logout),
        ),
      ),
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible: true,
      barrierLabel: '',
      context: Get.context!,
      pageBuilder: (context, animation, secondaryAnimation) => const SizedBox(),
    );
  }
}
