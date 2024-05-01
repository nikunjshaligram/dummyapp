import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:get/get.dart';

import '../../../utils/static_array.dart';

class JourneydetailController extends BaseGetXController {
  var productList = <dynamic>[].obs;

  var journeyData = <dynamic>[].obs;

  var expandedIndex = 0.obs;

  var journeyId = "".obs;

  void toggleExpansion(int index, expanded) {
    if (expanded) {
      expandedIndex.value = index;
    } else {
      expandedIndex.value = -1;
    }
  }

  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(milliseconds: 500), () {
      if (Get.arguments != null) {
        print(Get.arguments);
        journeyId.value = Get.arguments;
      }
    });

    productList.value = StaticArray().delivery;
    journeyData.value = StaticArray().journetList;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void actionRemeberMe(val, index, pIndex, productData) {
    if (productData['isSelect'] == false) {
      productData['isSelect'] = true;
    } else {
      productData['isSelect'] = false;
    }
    journeyData.refresh();
  }
}
