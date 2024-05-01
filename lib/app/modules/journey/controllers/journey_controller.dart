import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:dummyapp/app/utils/static_array.dart';
import 'package:get/get.dart';

class JourneyController extends BaseGetXController {
  var journeyList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();

    journeyList.value = StaticArray().journey;

    print("isConnection ${isConnection}");
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void nextScreen(id) {
    Get.toNamed(Routes.JOURNEY_LIST, arguments: id);
  }
}
