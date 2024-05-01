import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../utils/static_array.dart';

class JourneyListController extends GetxController {
  var journeyId = "".obs;

  var deliveryData = <dynamic>[].obs;
  var collectionData = <dynamic>[].obs;

  var pickupAll = false.obs;
  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      journeyId.value = Get.arguments;

      deliveryData.value = StaticArray().delivery;
      collectionData.value = StaticArray().collection;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void pickupAllChecked(val, deliveryDatas) {
    pickupAll.value = !pickupAll.value;

    for (int i = 0; i < deliveryDatas.length; i++) {
      deliveryDatas[i]['isSelect'] = val;
    }

    deliveryData.refresh();
  }

  void deliveryChecked(val, deliveryDataValue, deliveryDataList) {
    deliveryDataValue["isSelect"] = !deliveryDataValue["isSelect"];

    deliveryData.refresh();
  }

  void removeQty(deliveryDataVal) {
    if (deliveryDataVal["parcel"] > 0) {
      deliveryDataVal["parcel"]--;
    } else {
      deliveryDataVal["parcel"] = 0;
    }

    deliveryData.refresh();
  }

  void addQty(deliveryDataVal) {
    deliveryDataVal["parcel"]++;
    deliveryData.refresh();
  }

  deliveryItemTap(deliveryDatas) {
    print("object ${deliveryDatas}");
    Get.toNamed(Routes.JOURNEY_DETAILS);
  }
}
