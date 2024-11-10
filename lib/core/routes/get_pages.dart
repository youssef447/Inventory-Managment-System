// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing the get pages for the app.

import 'package:get/get.dart';

import '../../features/Assets/presentation/controller/assets_binding.dart';
import '../../features/Assets/presentation/ui/pages/mobile/mobile_assets_details.dart';
import '../../features/requests/presentation/ui/pages/mobile/mobile_requests_page.dart';
import '../helpers/responsive_helper.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.home;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.assetsDetails,
      transition: Transition.fadeIn,
      page: () => ResponsiveHelper(
        mobileWidget: MobileAssetsDetails(
          index: Get.arguments['assetsModelIndex'],
         // readOnly: Get.arguments['readOnly'],
        ),
        tabletWidget: MobileAssetsDetails(
          index: Get.arguments['assetsModelIndex'],
        ),
      ),
      binding: AssetsBinding(),
    ),
  ];
}
