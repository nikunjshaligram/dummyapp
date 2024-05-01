import 'package:dummyapp/app/widgets/dialog/custom_alert_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as gn;
import 'package:get/get.dart';
import '../../core/theme/colors.dart';

class NoInternetDialog {
  noInternetDialog() {
    showGeneralDialog(
        barrierColor: AppColors.primaryColor.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: CustomAlertDialog(
                  title: 'No Internet connection',
                  btnString: "Okay",
                  forceDialog: true,
                  onTap: () {
                    gn.Get.back();
                  }),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: Get.context!,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SizedBox();
        });
  }
}
