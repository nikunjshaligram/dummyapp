import 'package:get/get.dart';

import '../controllers/journey_detail_controller.dart';

class JourneydetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JourneydetailController>(
      () => JourneydetailController(),
    );
  }
}
