import 'package:dummyapp/app/core/constants/app_label.dart';
import 'package:dummyapp/app/core/theme/colors.dart';
import 'package:dummyapp/app/utils/extensions.dart';
import 'package:dummyapp/app/widgets/common_widget.dart';
import 'package:dummyapp/app/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_button_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                6.screenHeight.height,
                CommonWidget().logoField(),
                3.screenHeight.height,
                CommonWidget().headerTextField(AppLabel.signin),
                3.screenHeight.height,
                CommonWidget().textField(AppLabel.emailAddress),
                1.5.screenHeight.height,
                emailField(),
                2.screenHeight.height,
                CommonWidget().textField(AppLabel.password),
                1.5.screenHeight.height,
                passwordField(),
                4.screenHeight.height,
                btnSignin(context),
                15.screenHeight.height,
                forgotPasswordField(),
              ],
            ).paddingAll(3.screenHeight),
          ),
        ),
      ),
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
      focusNodeNext: controller.textFieldFocus[1],
    );
  }

  Widget passwordField() {
    return CustomTextFieldWidget(
      textEditingController: controller.passwordController,
      labelText: AppLabel.enterPassword,
      obscureText: controller.isShowPassword.value,
      inputAction: TextInputAction.done,
      textFieldType: TextInputType.visiblePassword,
      fillColor: AppColors.transparentColor,
      focusNodeSelf: controller.textFieldFocus[1],
      suffixIcon: IconButton(
          onPressed: controller.passwordShowHide,
          icon: controller.passwordShowHideIcon()),
    );
  }

  Widget btnSignin(context) {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight, //0.065,
      buttonWidth: 1.0,
      title: AppLabel.signin,
      isLoading: controller.isLoading.value,
      onButtonPressed: () {
        controller.validation(context);
      },
    );
  }

  Widget forgotPasswordField() {
    return GestureDetector(
      onTap: () {
        controller.forgotPasswordTap();
      },
      child: CommonWidget().bottomTextField(
        AppLabel.forgotpassword,
        AppColors.darkRedColor,
      ),
    );
  }
}
