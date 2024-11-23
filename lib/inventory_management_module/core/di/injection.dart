import 'package:get/get.dart';

import '../../features/Assets/presentation/controller/assets_controller.dart';
import '../../features/approval/presentation/controller/approval_controller.dart';
import '../../features/consumables/presentation/controller/consumables_controller.dart';
import '../../features/home/presentation/controller/filter_controller.dart';
import '../../features/home/presentation/controller/home_controller.dart';
import '../../features/request_new_asset/presentation/controller/request_assets_controller.dart';
import '../../features/request_new_consumable/presentation/controller/request_consumable_controller.dart';
import '../../features/requests/presentation/controller/requests_controller.dart';
import '../../features/track_request/presentation/controller/track_requests_controller.dart';

configurationDependencies() {
  Get.lazyPut(() => HomeController(), fenix: true);

  Get.lazyPut(() => ApprovalController(), fenix: true);
  Get.lazyPut(() => AssetsController(), fenix: true);
  Get.lazyPut(() => ConsumablesController(), fenix: true);
  Get.lazyPut(() => RequestAssetsController(), fenix: true);
  Get.lazyPut(() => RequestConsumableController(), fenix: true);
  Get.lazyPut(() => RequestsController(), fenix: true);
  Get.lazyPut(() => TrackRequestController(), fenix: true);
  Get.lazyPut(() => FilterController(), fenix: true);
}
