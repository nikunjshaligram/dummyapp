import 'package:get/get.dart';

import '../controllers/journey_list_controller.dart';

class JourneyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JourneyListController>(
      () => JourneyListController(),
    );
  }
}
