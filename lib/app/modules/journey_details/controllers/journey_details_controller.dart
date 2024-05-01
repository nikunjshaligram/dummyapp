import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/static_array.dart';

class JourneyDetailsController extends GetxController {
  var parcelData = <dynamic>[].obs;
  var isReadOnly = true.obs;

  @override
  void onInit() {
    super.onInit();

    parcelData.value = StaticArray().parcelList;

    print(isReadOnly.value);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  locationMapListTap() {
    Get.toNamed(Routes.MAP_LIST);
  }

  editOrderTap(index) {
    parcelData[index]["isSelect"] = !parcelData[index]["isSelect"];
    parcelData.refresh();
  }
}
