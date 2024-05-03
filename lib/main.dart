import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //     options: FirebaseOptions(
  //   apiKey: 'AIzaSyCNI7Kiw8Hs51BREutMyVhSykoen3xMbnQ',
  //   appId: '1:445299343348:android:dd3ae43f86eedc7397c3a1',
  //   messagingSenderId: 'sendid',
  //   projectId: 'crashlytics-5ab78',
  //   storageBucket: 'crashlytics-5ab78.appspot.com',
  // ));
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom]);
  runApp(
    Sizer(
      builder: (mContext, orientation, deviceType) {
        SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          //defaultTransition: Transition.cupertino,
          // theme: ThemeData(
          //   appBarTheme: AppBarTheme(
          //       // backgroundColor: AppColors.appPrimaryColor,
          //       centerTitle: true,
          //       iconTheme: IconThemeData(
          //         color: AppColors.whiteColor,
          //       ),
          //       titleTextStyle: TextStyle(color: AppColors.whiteColor)),
          //   scaffoldBackgroundColor: AppColors.whiteColor,
          // ),
        );
      },
    ),
  );
}
