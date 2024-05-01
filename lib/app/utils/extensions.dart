import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ScreenSpace on num {
  double get screenHeight => Get.height * (toDouble() / 100);

  double get screenWidth => Get.width * (toDouble() / 100);
}

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

extension SizeBoxExtension on num {
  SizedBox get heights => SizedBox(height: toDouble());
  SizedBox get widths => SizedBox(width: toDouble());
}

Future<int> androidSdkInt() async {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final androidInfo = await deviceInfoPlugin.androidInfo;
  return androidInfo.version.sdkInt;
}

extension EmptyExtension on String? {
  bool get isNullEmpty => this == null || this?.isEmpty == true;
}
