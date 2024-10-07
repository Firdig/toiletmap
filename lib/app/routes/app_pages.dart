import 'package:get/get.dart';
import 'package:toiletmap/app/modules/home/views/Homepage/Feed_page.dart';
import 'package:toiletmap/app/modules/home/views/Homepage/profile_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/Login/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => LoginView(),
      binding: HomeBinding(),
    ),
  ];
}