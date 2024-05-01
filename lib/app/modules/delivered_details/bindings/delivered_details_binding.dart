import 'package:get/get.dart';

import '../controllers/delivered_details_controller.dart';

class DeliveredDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeliveredDetailsController>(
      () => DeliveredDetailsController(),
    );
  }
}
