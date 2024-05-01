// ignore_for_file: must_be_immutable

import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../core/theme/styles.dart';

class CustomDropDown extends StatelessWidget {
  CustomDropDown({
    Key? key,
    this.selectedValue,
    this.hintText,
    required this.listItems,
    this.onChanged,
    this.validator,
    this.isValidate = false,
  }) : super(key: key);

  String? selectedValue;
  String? hintText;
  List<String> listItems;
  final Function(dynamic value)? onChanged;
  final String? Function(String?)? validator;
  final bool? isValidate;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.lightTextColor,
      ),
      style:
          AppStyle.mediumTextStyle(size: 10.sp, color: AppColors.primaryColor),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(15.0),
        fillColor: AppColors.whiteColor,
        filled: true,
        hintStyle: AppStyle.mediumTextStyle(
            size: 10.sp, color: AppColors.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: isValidate!
                  ? AppColors.lightBorderColor
                  : AppColors.primaryColor,
              width: 1.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: isValidate!
                  ? AppColors.lightBorderColor
                  : AppColors.primaryColor,
              width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
              color: isValidate!
                  ? AppColors.primaryColor
                  : AppColors.lightBorderColor,
              width: 1.0),
        ),
      ),
      validator: validator,
      isExpanded: true,
      hint: Text(
        hintText!,
        style: TextStyle(color: AppColors.lightTextColor),
      ),
      value: selectedValue,
      dropdownColor: AppColors.whiteColor,
      items: listItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) => onChanged,
    );
  }
}
