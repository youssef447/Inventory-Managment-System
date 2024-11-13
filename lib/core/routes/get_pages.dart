// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing the get pages for the app.

import 'package:get/get.dart';
import '../../features/approval/presentation/controller/approval_binding.dart';
import '../../features/approval/presentation/ui/pages/mobile/mobile_approval_page.dart';
import '../../features/approval/presentation/ui/pages/tablet/tablet_approval_page.dart';
import '../../features/request_new_asset/presentation/controller/request_assets__bindings.dart';
import '../../features/request_new_asset/presentation/ui/pages/mobile/mobile_new_request_page.dart';
import '../../features/request_new_asset/presentation/ui/pages/mobile/mobile_request_form_page.dart';
import '../../features/request_new_asset/presentation/ui/pages/tablet/tablet_new_request_page.dart';
import '../../features/request_new_asset/presentation/ui/pages/tablet/tablet_request_form_page.dart';
import '../../features/track_request/presentation/controller/track_requests_bindings.dart';
import '../../features/track_request/presentation/ui/pages/mobile/mobile_track_requests_details_page.dart';
import '../../features/track_request/presentation/ui/pages/mobile/mobile_track_requests_page.dart';
import '../../features/track_request/presentation/ui/pages/tablet/tablet_track_request_details_page.dart';
import '../../features/track_request/presentation/ui/pages/tablet/tablet_track_requests_page.dart';
import '../helpers/responsive_helper.dart';

import '../../features/Assets/presentation/controller/assets_binding.dart';
import '../../features/Assets/presentation/ui/pages/mobile/mobile_assets_details.dart';
import '../../features/consumables/presentation/ui/pages/mobile/mobile_consumables_details_page.dart';
import 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.home;

  static final List<GetPage> routes = [
    GetPage(
      name: Routes.requestAsset,
      page: () => const ResponsiveHelper(
        mobileWidget: MobileNewRequestPage(),
        tabletWidget: TabletNewRequestPage(),
      ),
      binding: RequestAssetsBindings(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.newRequestAsset,
      page: () => ResponsiveHelper(
        mobileWidget: MobileRequestFormPage(
          model: Get.arguments['assetModel'],
        ),
        tabletWidget: TabletRequestFormPage(
          model: Get.arguments['assetModel'],
        ),
      ),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
    ),
    GetPage(
      name: Routes.trackRequest,
      page: () => const ResponsiveHelper(
        mobileWidget: MobileTrackRequestsPage(),
        tabletWidget: TabletTrackRequestsPage(),
      ),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
      binding: TrackRequestsBinding(),
    ),
    GetPage(
      name: Routes.trackDetails,
      page: () => ResponsiveHelper(
        mobileWidget: MobileTrackRequestDetailsPage(
          model: Get.arguments['model'],
        ),
        tabletWidget: TabletTrackRequestDetailsPage(
          model: Get.arguments['model'],
        ),
      ),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 350),
      binding: TrackRequestsBinding(),
    ),
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
    GetPage(
      name: Routes.consumablesDetails,
      transition: Transition.fadeIn,
      page: () => ResponsiveHelper(
        mobileWidget: MobileConsumablesDetailsPage(
          index: Get.arguments['consumablesModelIndex'],
          // readOnly: Get.arguments['readOnly'],
        ),
        tabletWidget: MobileConsumablesDetailsPage(
          index: Get.arguments['consumablesModelIndex'],
        ),
      ),
      binding: AssetsBinding(),
    ),
    GetPage(
      name: Routes.approval,
      transition: Transition.fadeIn,
      page: () => const ResponsiveHelper(
        mobileWidget: MobileApprovalPage(),
        tabletWidget:  TabletApprovalPage(
        ),
      ),
      binding: ApprovalBinding(),
    ),


  ];
}
