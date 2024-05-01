import 'package:get/get.dart';

import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/delivered_details/bindings/delivered_details_binding.dart';
import '../modules/delivered_details/views/delivered_details_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/journey/bindings/journey_binding.dart';
import '../modules/journey/views/journey_view.dart';
import '../modules/journey_detail/bindings/journey_detail_binding.dart';
import '../modules/journey_detail/views/journey_detail_view.dart';
import '../modules/journey_details/bindings/journey_details_binding.dart';
import '../modules/journey_details/views/journey_details_view.dart';
import '../modules/journey_list/bindings/journey_list_binding.dart';
import '../modules/journey_list/views/journey_list_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/map_list/bindings/map_list_binding.dart';
import '../modules/map_list/views/map_list_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.FORGOTPASSWORD,
      page: () => const ForgotpasswordView(),
      binding: ForgotpasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.RESETPASSWORD,
      page: () => const ResetpasswordView(),
      binding: ResetpasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.JOURNEY,
      page: () => JourneyView(),
      binding: JourneyBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => const HistoryView(),
      binding: HistoryBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.JOURNEYDETAIL,
      page: () => const JourneydetailView(),
      binding: JourneydetailBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.JOURNEY_DETAILS,
      page: () => const JourneyDetailsView(),
      binding: JourneyDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.JOURNEY_LIST,
      page: () => const JourneyListView(),
      binding: JourneyListBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.MAP_LIST,
      page: () => const MapListView(),
      binding: MapListBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: _Paths.DELIVERED_DETAILS,
      page: () => const DeliveredDetailsView(),
      binding: DeliveredDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 600),
    ),
  ];
}
