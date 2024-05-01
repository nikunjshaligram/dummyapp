import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dummyapp/app/core/live_network/base_getx_controller.dart';
import 'package:dummyapp/app/modules/history/controllers/history_controller.dart';
import 'package:dummyapp/app/modules/history/views/history_view.dart';
import 'package:dummyapp/app/modules/journey/controllers/journey_controller.dart';
import 'package:dummyapp/app/modules/journey/views/journey_view.dart';
import 'package:dummyapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends BaseGetXController {
  var currentIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Get.put(JourneyController());
    Get.put(HistoryController());
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changePage(int index) {
    currentIndex.value = index;

    print("currentIndex.value ${currentIndex.value}");
  }

  // String getPageName() {
  //   if (currentIndex == 0) {
  //     return AppLabel.homeLabel;
  //   } else if (currentIndex == 1) {
  //     return AppLabel.category;
  //   }
  //   return AppLabel.successText;
  // }

  Widget getScreen() {
    if (currentIndex == 0) {
      return JourneyView();
    } else if (currentIndex == 1) {
      return const HistoryView();
    }
    return Container();
  }

  void userProfile() {
    Get.toNamed(Routes.PROFILE);
  }
}
