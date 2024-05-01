import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../core/theme/colors.dart';
import '../core/theme/styles.dart';

class ButtonScreen extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final bool enable;
  final double? textSize;
  final Color? background;
  final Color? textColor;
  final bool isLoading;
  final bool isArrow;
  final Color? arrowColor;
  final bool isBackArrow;
  final double? horizontal;
  final double? height;
  final FontWeight? fontWeight;
  final BoxBorder? boxBorder;

  const ButtonScreen({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.textSize,
    this.background,
    this.textColor,
    this.horizontal,
    this.height,
    this.fontWeight,
    this.boxBorder,
    this.arrowColor,
    this.enable = true,
    this.isLoading = false,
    this.isArrow = false,
    this.isBackArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      //margin: EdgeInsets.symmetric(horizontal: horizontal ?? 6.w),
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.w),
      ),
      child: Container(
        width: double.maxFinite,
        height: height ?? 7.h,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            color: background ?? AppColors.primaryColor,
            borderRadius: BorderRadius.all(Radius.circular(2.w)),
            border: boxBorder ?? const Border()),
        child: MaterialButton(
          disabledColor: AppColors.primaryColor,
          onPressed: enable ? onPressed : null,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                  visible: isBackArrow,
                  child: Icon(Icons.arrow_back_ios,
                      color: AppColors.primaryColor, size: 3.6.w)),
              1.w.widths,
              (isLoading)
                  ? /*CupertinoActivityIndicator(
                      color: AppColors.black, radius: 10.w)*/
                  Container(
                      width: 10.screenWidth,
                      height: 10.screenWidth,
                      padding: EdgeInsets.all(2.screenWidth),
                      child: CircularProgressIndicator(
                        color: textColor,
                        strokeWidth: 3.sp,
                      ),
                    )
                  : Text(
                      buttonText,
                      style: AppStyle.semiBoldTextStyle(
                          color: textColor ?? AppColors.blackColor,
                          size: textSize ?? 13.sp,
                          fontWeight: fontWeight ?? FontWeight.w500),
                    ),
              1.w.widths,
              // Visibility(
              //     visible: isArrow && !isLoading,
              //     child: Icon(Icons.arrow_forward_ios,
              //         color: arrowColor ?? AppColors.white, size: 3.6.w))
            ],
          ),
        ),
      ),
    );
  }
}
