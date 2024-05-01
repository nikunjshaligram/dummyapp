import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/static_array.dart';

class MapListController extends GetxController
    with GetTickerProviderStateMixin {
  final isSheetOpen = false.obs;
  var sheetHeight = 0.0.obs;
  var journeyList = <dynamic>[].obs;

  @override
  void onInit() {
    super.onInit();

    sheetHeight.value = Get.height * 0.1;
    journeyList.value = StaticArray().parcelAddressList;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void toggleSheet() {
    isSheetOpen.value = !isSheetOpen.value;

    sheetHeight.value = sheetHeight.value == Get.height * 0.1
        ? journeyList.length > 4
            ? Get.height * 0.8
            : Get.height * 0.6
        : Get.height * 0.1;
  }

  void reorderItems(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final item = journeyList.removeAt(oldIndex);
    journeyList.insert(newIndex, item);
    update();
  }

  void orderListTap() {
    Get.toNamed(Routes.DELIVERED_DETAILS);
    toggleSheet();
  }
}
