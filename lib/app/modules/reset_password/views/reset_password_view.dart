import 'package:dummyapp/app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_label.dart';
import '../../../core/theme/colors.dart';
import '../../../widgets/common_widget.dart';
import '../../../widgets/custom_button_widget.dart';
import '../../../widgets/text_field_widget.dart';
import '../controllers/reset_password_controller.dart';

class ResetpasswordView extends GetView<ResetpasswordController> {
  const ResetpasswordView({Key? key}) : super(key: key);
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
                CommonWidget().headerTextField(AppLabel.setNewPwd),
                4.screenHeight.height,
                CommonWidget().textField(AppLabel.newPwd),
                1.5.screenHeight.height,
                newPasswordField(),
                2.screenHeight.height,
                CommonWidget().textField(AppLabel.confirmPwd),
                1.5.screenHeight.height,
                confirmPasswordField(),
                4.screenHeight.height,
                btnResetPwd(context),
                15.screenHeight.height,
                signinTextField(),
              ],
            ).paddingAll(3.screenHeight),
          ),
        ),
      ),
    );
  }

  Widget newPasswordField() {
    return CustomTextFieldWidget(
      textEditingController: controller.newPwdController,
      labelText: AppLabel.enterNewPwd,
      obscureText: controller.isShowNewPassword.value,
      inputAction: TextInputAction.next,
      textFieldType: TextInputType.visiblePassword,
      fillColor: AppColors.transparentColor,
      focusNodeSelf: controller.textFieldFocus[0],
      focusNodeNext: controller.textFieldFocus[1],
      suffixIcon: IconButton(
          onPressed: controller.newPasswordShowHide,
          icon: controller.newPasswordShowHideIcon()),
    );
  }

  Widget confirmPasswordField() {
    return CustomTextFieldWidget(
      textEditingController: controller.confirmPwdController,
      labelText: AppLabel.enterConfirmPwd,
      obscureText: controller.isShowConfirmPassword.value,
      inputAction: TextInputAction.done,
      textFieldType: TextInputType.visiblePassword,
      fillColor: AppColors.transparentColor,
      focusNodeSelf: controller.textFieldFocus[1],
      suffixIcon: IconButton(
          onPressed: controller.confirmPasswordShowHide,
          icon: controller.confirmPasswordShowHideIcon()),
    );
  }

  Widget btnResetPwd(context) {
    return CustomButtonWidget(
      buttonHeight: 0.0075.screenHeight,
      buttonWidth: 1.0,
      title: AppLabel.resetPwd,
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
