import 'package:get/get.dart';

import '../../features/admin/home/presentation/controller/admin_controller.dart';
import '../../features/approval/presentation/controller/approval_controller.dart';
import '../../features/employee/Assets/presentation/controller/assets_controller.dart';
import '../../features/employee/consumables/presentation/controller/consumables_controller.dart';
import '../../features/employee/home/presentation/controller/filter_controller.dart';
import '../../features/employee/home/presentation/controller/home_controller.dart';
import '../../features/employee/request_new_asset/presentation/controller/request_assets_controller.dart';
import '../../features/employee/request_new_consumable/presentation/controller/request_consumable_controller.dart';
import '../../features/employee/requests/presentation/controller/requests_controller.dart';
import '../../features/employee/track_request/presentation/controller/inquiry_chat_controller.dart';
import '../../features/employee/track_request/presentation/controller/track_requests_controller.dart';

configurationDependencies() {
  Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => ApprovalController(), fenix: true);
  Get.lazyPut(() => AssetsController(), fenix: true);
  Get.lazyPut(() => ConsumablesController(), fenix: true);
  Get.lazyPut(() => RequestAssetsController(), fenix: true);
  Get.lazyPut(() => RequestConsumableController(), fenix: true);
  Get.lazyPut(() => RequestsController(), fenix: true);
  Get.lazyPut(() => TrackRequestController(), fenix: true);
  Get.lazyPut(() => InquiryChatController(), fenix: true);
  Get.lazyPut(() => FilterController(), fenix: true);
  Get.lazyPut(() => AdminController(), fenix: true);
}
