import 'package:get/get.dart';

import '../controllers/map_list_controller.dart';

class MapListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapListController>(
      () => MapListController(),
    );
  }
}
