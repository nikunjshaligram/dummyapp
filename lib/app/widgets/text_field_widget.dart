import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.textEditingController,
    this.isPassword,
    this.title,
    this.textFieldType,
    this.preIcon,
    this.labelText,
    this.inputFormat,
    required this.obscureText,
    required this.inputAction,
    this.suffixIcon,
    this.readOnlyVal = false,
    this.labelTextColor,
    this.focusNodeSelf,
    this.focusNodeNext,
    this.isValidate = false,
    this.fillColor,
    this.minLines,
    this.maxLines,
  }) : super(key: key);
  final TextEditingController? textEditingController;
  final bool? isPassword;
  final TextInputType? textFieldType;
  final IconData? preIcon;
  final String? title;
  final String? labelText;
  final Color? labelTextColor;
  final List<TextInputFormatter>? inputFormat;
  final bool obscureText;
  final TextInputAction inputAction;
  final IconButton? suffixIcon;
  final bool readOnlyVal;
  final FocusNode? focusNodeSelf;
  final FocusNode? focusNodeNext;
  final bool? isValidate;
  final Color? fillColor;
  final int? minLines;
  final int? maxLines;

  @override
  State<StatefulWidget> createState() {
    return _CustomTextFieldWidgetState();
  }
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool textEditHasFocus = false;

  @override
  void initState() {
    super.initState();

    widget.focusNodeSelf?.addListener(() {
      _observerMethod();
    });
  }

  void _observerMethod() {
    if (textEditHasFocus) {
      if (widget.textEditingController!.text.isEmpty) {
        setState(() {
          textEditHasFocus = widget.focusNodeSelf?.hasFocus ?? false;
        });
      }
    } else {
      setState(() {
        textEditHasFocus = widget.focusNodeSelf?.hasFocus ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.textEditingController!.text.isNotEmpty) {
      setState(() {
        textEditHasFocus = true;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: widget.focusNodeSelf,
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxLines ?? 1,
          style: AppStyle.mediumTextStyle(
              size: 10.sp, color: AppColors.primaryColor),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: widget.inputAction,
          cursorColor: AppColors.primaryColor,
          obscureText: widget.obscureText,
          controller: widget.textEditingController,
          keyboardType: widget.textFieldType,
          inputFormatters: widget.inputFormat,
          readOnly: widget.readOnlyVal,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            hintText: widget.labelText,
            fillColor: widget.fillColor,
            filled: true,
            hintStyle: AppStyle.mediumTextStyle(
                size: 10.sp, color: AppColors.primaryColor),
            suffixIcon: widget.suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: widget.isValidate!
                      ? AppColors.lightBorderColor
                      : AppColors.primaryColor,
                  width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: widget.isValidate!
                      ? AppColors.lightBorderColor
                      : AppColors.primaryColor,
                  width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                  color: widget.isValidate!
                      ? AppColors.primaryColor
                      : AppColors.lightBorderColor,
                  width: 1.0),
            ),
          ),
          onFieldSubmitted: (_) => widget.focusNodeNext != null
              ? FocusScope.of(context).requestFocus(widget.focusNodeNext)
              : widget.focusNodeSelf?.unfocus(),
        )
      ],
    );
  }
}
