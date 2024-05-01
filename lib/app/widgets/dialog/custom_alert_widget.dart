import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../core/theme/colors.dart';
import '../../core/theme/styles.dart';
import '../button_widget.dart';
import '../custom_tap.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.title,
      required this.onTap,
      this.btnString = "Yes",
      this.forceDialog = false,
      this.isLoading = false});

  final String title;
  final Function onTap;
  final String btnString;

  final bool forceDialog;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Container(
        // height: Get.height * 0.6,
        padding: EdgeInsets.symmetric(horizontal: 16.sp),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            color: AppColors.whiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            (!forceDialog)
                ? Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: CustomTap(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.close,
                            color: AppColors.darkRedColor,
                          )),
                    ))
                : const SizedBox(),
            const SizedBox(height: 15),
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppStyle.regularTextStyle(
                color: AppColors.blackColor,
                size: 15.sp,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 160,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: ButtonScreen(
                isLoading: isLoading,
                buttonText: btnString,
                textColor: AppColors.whiteColor,
                background: AppColors.primaryColor,
                onPressed: () => onTap(),
              ),
            ),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
