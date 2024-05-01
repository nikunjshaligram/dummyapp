import 'package:get_storage/get_storage.dart';

class GetStorageHelper {
  static final GetStorageHelper _singleton = GetStorageHelper._internal();

  static const String token = "TOKEN";
  static const String isLogin = "isLogin";
  static const String userData = "userData";
  static const String isOtpVerify = "isOtpVerify";

  GetStorage box = GetStorage();

  GetStorageHelper._internal();

  factory GetStorageHelper() {
    return _singleton;
  }

  setString(String tag, String value) {
    box.write(tag, value);
  }

  String? getString(String tag) {
    return box.read(tag);
  }

  // String getUserId() {
  //   return LoginResponseModel(code: code, message: message, data: data)
  //       .fromJson(box.read(GetStorageHelper.userData))
  //       .user
  //       .id;
  // }

  // String getUserType() {
  //   return LoginResponseModel.fromJson(box.read(GetStorageHelper.userData))
  //           .user
  //           .userType ??
  //       "";
  // }

  setBool(String tag, bool value) {
    box.write(tag, value);
  }

  bool? getBool(String tag) {
    return box.read(tag);
  }

  setInt(String tag, int value) {
    box.write(tag, value);
  }

  int? getInt(String tag) {
    return box.read(tag);
  }

  setJson(String tag, Map<String, dynamic> value) {
    box.write(tag, value);
  }

  Map<String, dynamic>? getJson(String tag) {
    return box.read(tag);
  }

  void clearWholeApp() {
    // bool intro = getBool(isIntro) ?? false;
    box.erase();
    // setBool(isIntro, intro);
  }
}
