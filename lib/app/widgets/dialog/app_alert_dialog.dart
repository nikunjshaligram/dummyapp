import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/custom_tap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../core/constants/app_label.dart';
import '../../core/theme/colors.dart';
import '../../core/theme/styles.dart';

class AppAlertDialog extends StatelessWidget {
  final Function onConfirm;
  final String title;
  final String subtitle;
  final String okButton;

  const AppAlertDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.subtitle,
    required this.okButton,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.zero,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
      title: titleTextWidget(),
      content: subtitleTextWidget(),
      actions: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            btnCancelWidget(),
            3.screenWidth.width,
            btnLogoutWidget(),
          ],
        ),
      ],
    );
  }

  Widget titleTextWidget() {
    return Container(
      height: Get.height * 0.05,
      alignment: Alignment.center,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: AppColors.whiteColor, fontSize: 12.sp),
      ),
    );
  }

  Widget subtitleTextWidget() {
    return Text(subtitle, textAlign: TextAlign.center);
  }

  Widget btnCancelWidget() {
    return CustomTap(
      onTap: () => Get.back(),
      child: Container(
        height: Get.height * 0.05,
        width: Get.width * 0.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            AppLabel.cancel,
            style: AppStyle.regularTextStyle(
                color: AppColors.primaryColor,
                size: 10.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }

  Widget btnLogoutWidget() {
    return CustomTap(
      onTap: () => onConfirm(),
      child: Container(
        height: Get.height * 0.05,
        width: Get.width * 0.2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: AppColors.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          child: Text(
            okButton,
            style: AppStyle.regularTextStyle(
                color: AppColors.whiteColor,
                size: 10.sp,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
