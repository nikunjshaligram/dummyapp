import 'package:get/get.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotpasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotpasswordController>(
      () => ForgotpasswordController(),
    );
  }
}
