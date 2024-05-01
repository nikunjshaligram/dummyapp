import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

import '../../utils/extensions.dart';

class PermissionService {
  static Future<PermissionStatus> requestPermission(
      Permission permission) async {
    return await permission.request();
  }

  static Future<bool> checkPermission(Permission permission) async {
    return await permission.isGranted;
  }

  static Future<bool> managePermission(Permission permission) async {
    if (await checkPermission(permission)) {
      return true;
    } else {
      PermissionStatus permissionStatus = await requestPermission(permission);
      if (permissionStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  static Future<bool> storagePermission(Permission permission) async {
    if (Platform.isAndroid && await androidSdkInt() >= 33) {
      return true;
    } else if (await checkPermission(permission)) {
      return true;
    } else {
      PermissionStatus permissionStatus = await requestPermission(permission);
      if (permissionStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }
}
