import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/colors.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotpasswordView extends GetView<ForgotpasswordController> {
  const ForgotpasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
        // Obx(
        //   () =>
        Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              6.screenHeight.height,
              CommonWidget().logoField(),
              3.screenHeight.height,
              CommonWidget().headerTextField(AppLabel.forgotPassword),
              1.5.screenHeight.height,
              CommonWidget().subTextField(AppLabel.forgotPasswordDesc),
              6.screenHeight.height,
              CommonWidget().textField(AppLabel.emailAddress),
              1.5.screenHeight.height,
              emailField(),
              4.screenHeight.height,
              btnContinue(context),
              15.screenHeight.height,
              signinTextField(),
            ],
          ).paddingAll(3.screenHeight),
        ),
      ),
      // ),
    );
  }

  Widget emailField() {
    return CustomTextFieldWidget(
      textEditingController: controller.emailController,
      labelText: AppLabel.enterEmailAddress,
      obscureText: false,
      inputAction: TextInputAction.next,
      textFieldType: TextInputType.text,
      fillColor: AppColors.transparentColor,
      focusNodeSelf: controller.textFieldFocus[0],
    );
  }

  Widget btnContinue(context) {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight,
      buttonWidth: 1.0,
      title: AppLabel.cntinue,
      isLoading: controller.isLoading.value,
      onButtonPressed: () {
        controller.validation(context);
      },
    );
  }

  Widget signinTextField() {
    return GestureDetector(
      onTap: () {
        controller.signinTap();
      },
      child: CommonWidget()
          .bottomTextField(AppLabel.signin, AppColors.darkOrangeColor),
    );
  }
}
