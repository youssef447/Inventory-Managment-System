// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing the get pages for the app.

import 'package:get/get.dart';

import '../../features/home/presentation/page/home_page.dart';
import '../helpers/responsive_helper.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => HomePage(
          /*   user: Get.arguments['user'],
        locationName: Get.arguments['locationName'], */
          ),
    ),
  ];
}
