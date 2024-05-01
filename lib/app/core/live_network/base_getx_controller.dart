import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import '../../data/repositories/auth_repository.dart';
import '../../network/api_controller.dart';
import '../storage/get_storage_helper.dart';
import 'network_state.dart';

class BaseGetXController extends GetxController {
  GetStorageHelper boxStorage = GetStorageHelper();

  var textFieldFocus = List.generate(5, (index) => FocusNode());
  RxBool isLoading = false.obs;
  RxBool isFavLoading = false.obs;
  late AuthRepository authRepository;
  late StreamSubscription<ConnectivityResult> subscription;
  var isConnection = false.obs;
  //late CommonRepository commonRepository;
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  @mustCallSuper
  void onInit() {
    if (this is ConnectionAware) {
      ConnectionAware awareObj = this as ConnectionAware;
      awareObj.connectivitySubscription =
          Connectivity().onConnectivityChanged.listen((event) {
        if (event == ConnectivityResult.mobile ||
            event == ConnectivityResult.wifi) {
          awareObj.networkState = NetworkState.connected;
          awareObj.onNetworkConnected();
          // need to start snack bar
          // if (Get.isSnackbarOpen) {
          //   SnackBarWidget.clearSnackBar();
          // }
        } else if (event == ConnectivityResult.none) {
          awareObj.networkState = NetworkState.disconnected;
          awareObj.onNetworkDisconnected();
          // need to end snack bar
          // if (!Get.isSnackbarOpen) {
          //   SnackBarWidget.showSnackBarInfinity("No Internet Connected", title: "");
          // }
        }
      });
    }

    checkConnection();

    super.onInit();
    registerApiController();
  }

  checkConnection() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {
      print("here1");
      isConnection.value = false;
    } else {
      print("here2");
      isConnection.value = true;
    }

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      print("result ${result}");
      //display the network status to the user
      if (result == ConnectivityResult.none) {
        isConnection.value = false;
      } else {
        isConnection.value = true;
      }
    });
  }

  registerApiController() async {
    if (!Get.isRegistered<ApiControllerV1>()) {
      // await AppConfig.initializeAppConfig(Get.context!);
      Get.put(ApiControllerV1());
    }

    authRepository =
        AuthRepository(apiControllerV1: Get.find<ApiControllerV1>());

    // commonRepository =
    //     CommonRepository(apiControllerV1: Get.find<ApiControllerV1>());
  }

  @override
  @mustCallSuper
  void dispose() {
    if (this is ConnectionAware) {
      (this as ConnectionAware).connectivitySubscription?.cancel();
    }
    super.dispose();
  }
}
