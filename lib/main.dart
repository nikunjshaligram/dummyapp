import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
          defaultTransition: Transition.cupertino,
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
