// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing the get pages for the app.

import 'package:get/get.dart';

import '../../features/request_asset/presentation/controller/request_assets__bindings.dart';
import '../../features/request_asset/presentation/ui/pages/mobile/mobile_request_asset_page.dart';
import '../../features/request_asset/presentation/ui/pages/tablet/tablet_request_asset_page.dart';
import '../helpers/responsive_helper.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.home;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.requestAsset,
      page: () => const ResponsiveHelper(
        mobileWidget: MobileRequestAssetsPage(),
        tabletWidget: TabletRequestAssetsPage(),
      ),
      binding: RequestAssetsBindings(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
    ),
  ];
}
