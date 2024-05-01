// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dummyapp/app/core/services/app_config.dart';
import 'package:flutter/widgets.dart';
import '../core/constants/app_label.dart';
import '../core/constants/enums.dart';
import '../core/constants/strings.dart';
import '../core/live_network/base_getx_controller.dart';
import '../core/storage/get_storage_helper.dart';
import '../core/theme/colors.dart';
import '../data/model/error_model copy.dart';
import '../routes/app_pages.dart';
import '../widgets/dialog/custom_alert_widget.dart';
import 'auth_interceptor.dart';
import 'package:get/get.dart' as gn;
import 'package:get/get.dart';

abstract class _BaseApiController {
  late Dio _dio;

  void init({required ApiVersion version}) async {
    GetStorageHelper boxStorage = GetStorageHelper();
    BaseOptions dioOptions = BaseOptions(
      connectTimeout: const Duration(milliseconds: 60000),
      receiveTimeout: const Duration(milliseconds: 60000),
      baseUrl: AppConfig().baseUrl,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      validateStatus: (status) {
        if (status == 401) {
          return false;
        } else {
          return true;
        }
      },
      headers: {
        HttpHeaders.acceptHeader: Headers.jsonContentType,
        //RequestParameterKeys.timeZone: await FlutterTimezone.getLocalTimezone(),
        if (boxStorage.getBool(GetStorageHelper.isLogin) == true)
          HttpHeaders.authorizationHeader: Constant.bearer +
              (boxStorage.getString(GetStorageHelper.token) ?? ""),
      },
    );

    _dio = Dio(dioOptions);
    //if (!URLs.isProduction) {
    _setupInterceptors();
    // }
    (_dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    // Add Auth Interceptor
    _dio.interceptors.add(AuthInterceptor());
  }

  ErrorResponse _handleError(DioException error) {
    ErrorResponse errorResponse = ErrorResponse();

    /**
     * dismiss loader & shimmer effect
     * */

    if (Get.isRegistered<BaseGetXController>()) {
      BaseGetXController baseController = Get.find<BaseGetXController>();
      baseController.isLoading.value = false;
    }

    Get.back();
    GetStorageHelper boxStorage = GetStorageHelper();
    //PrintLog.printTagData("ERRORFirst", error.type);
    if (error.response?.statusCode == 401) {
      showGeneralDialog(
          barrierColor: AppColors.blackColor.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: WillPopScope(
                  onWillPop: () async {
                    boxStorage.clearWholeApp();
                    Get.offAllNamed(Routes.LOGIN);
                    return false;
                  },
                  child: CustomAlertDialog(
                      title: 'Your session has expired. Please login again',
                      btnString: "Log In",
                      forceDialog: true,
                      onTap: () {
                        boxStorage.clearWholeApp();
                        Get.offAllNamed(Routes.LOGIN);
                      }),
                ),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: false,
          barrierLabel: '',
          context: Get.context!,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const SizedBox();
          });
    }

    if (error.type == DioExceptionType.unknown &&
        error.error != null &&
        error.error is SocketException) {
      errorResponse =
          ErrorResponse(error: Error(detail: 'No Internet Connection'));
    }

    switch (error.type) {
      case DioExceptionType.cancel:
        errorResponse = ErrorResponse(
          error: Error(detail: AppLabel.somethingWentWrong),
        );
        break;
      case DioExceptionType.badResponse:
        if (error.response?.data != null) {
          try {
            errorResponse = ErrorResponse.fromJson(error.response!.data);
          } catch (e) {
            errorResponse = ErrorResponse(
                error: Error(detail: AppLabel.somethingWentWrong));
          }
        } else {
          errorResponse =
              ErrorResponse(error: Error(detail: AppLabel.somethingWentWrong));
        }
        break;
      case DioExceptionType.connectionTimeout:
        //PrintLog.printTagData("INSIDE", error.type);
        _serverTimeOutDialog();
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.serverTimeout));
        break;
      case DioExceptionType.receiveTimeout:
        _serverTimeOutDialog();
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.serverTimeout));
        break;
      case DioExceptionType.sendTimeout:
        _serverTimeOutDialog();
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.serverTimeout));
        break;
      case DioExceptionType.unknown:
        _serverTimeOutDialog(title: AppLabel.somethingWentWrong);
        errorResponse =
            ErrorResponse(error: Error(detail: AppLabel.noInternet));
        break;
      case DioExceptionType.badCertificate:
        break;
      case DioExceptionType.connectionError:
        // PrintLog.printData("Network");
        _serverTimeOutDialog(title: "Connection Error");
        break;
    }
    return errorResponse;
  }

  bool _isServerTimeOutDialog = false;

  void _serverTimeOutDialog({String title = 'Server Connection Timeout'}) {
    if (!_isServerTimeOutDialog) {
      _isServerTimeOutDialog = true;
      showGeneralDialog(
          barrierColor: AppColors.blackColor.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: CustomAlertDialog(
                    title: title,
                    btnString: "Okay",
                    forceDialog: true,
                    onTap: () {
                      _isServerTimeOutDialog = false;
                      gn.Get.back();
                      //gn.Get.back();
                    }),
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 200),
          barrierDismissible: false,
          barrierLabel: '',
          context: Get.context!,
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return const SizedBox();
          });
    }
  }

  // POST
  Future<Map<String, dynamic>> post({
    required String path,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await _dio.post(
          path,
          data: data,
          queryParameters: query,
        );

        return response.data;
      } on DioException catch (e) {
        throw _handleError(e);
      }
    } else {
      noInternetDialog();
      throw Exception("Network Error");
    }
  }

  Future<Map<String, dynamic>> get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    final connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      try {
        final response = await _dio.get(
          path,
          queryParameters: query,
        );
        // PrintLog.printTagData(
        //     "STATUS", "${response.statusCode} ${response.statusMessage}");
        return response.data;
      } on DioException catch (e) {
        throw _handleError(e);
      }
    } else {
      noInternetDialog();
      throw Exception("Network Error");
    }
  }

  void noInternetDialog() {
    showGeneralDialog(
        barrierColor: AppColors.primaryColor.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: CustomAlertDialog(
                  title: 'No Internet connection',
                  btnString: "Okay",
                  forceDialog: true,
                  onTap: () {
                    gn.Get.back();
                  }),
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: Get.context!,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return const SizedBox();
        });
  }
}

class ApiControllerV1 extends _BaseApiController {
  ApiControllerV1() {
    super.init(version: ApiVersion.v1);
  }
}
