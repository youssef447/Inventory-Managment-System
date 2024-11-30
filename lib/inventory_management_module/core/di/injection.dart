import 'package:get/get.dart';
import '../../features/admin/approval/presentation/controller/admin_approval_controller.dart';
import '../../features/admin/consumable/presentation/controller/admin_consumable_controller.dart';
import '../../features/admin/dashboard/presentaton/controller/dashboard_controller.dart';
import '../../features/admin/orders/presentation/controller/new_order_contrller.dart';
import '../../features/admin/orders/presentation/controller/new_order_form_controller.dart';
import '../../features/admin/orders/presentation/controller/orders_controller.dart';
import '../../features/admin/storage/presentation/controller/storage_controller.dart';
import '../../features/admin/suppliers/presentation/controller/suppliers_controller.dart';
import '../../features/products/presentation/controller/add_product_controller.dart';

import '../../features/admin/assets/presentation/controller/admin_assets_controller.dart';
import '../../features/admin/employees/presentation/controller/employee_details_controller.dart';
import '../../features/admin/employees/presentation/controller/employees_controller.dart';
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
import '../../features/products/presentation/controller/add_approval_cycle_controller.dart';
import '../../features/products/presentation/controller/products_controller.dart';

bool isAdmin = true;
configurationDependencies() {
  Get.lazyPut(() => HomeController(), fenix: true);
  Get.lazyPut(() => AssetsController(), fenix: true);
  Get.lazyPut(() => ConsumablesController(), fenix: true);
  Get.lazyPut(() => RequestAssetsController(), fenix: true);
  Get.lazyPut(() => RequestConsumableController(), fenix: true);
  Get.lazyPut(() => RequestsController(), fenix: true);
  Get.lazyPut(() => TrackRequestController(), fenix: true);
  Get.lazyPut(() => InquiryChatController(), fenix: true);
  Get.lazyPut(() => FilterController(), fenix: true);

  //-----------Manager controller
  Get.lazyPut(() => ApprovalController(), fenix: true);

  //-----------admin controller
  Get.lazyPut(() => AdminController(), fenix: true);
  Get.lazyPut(() => AdminAssetsController(), fenix: true);
  Get.lazyPut(() => ProductsController(), fenix: true);
  Get.lazyPut(() => AddProductController(), fenix: true);
  Get.lazyPut(() => AddApprovalCycleController(), fenix: true);
  Get.lazyPut(() => EmployeesController(), fenix: true);
  Get.lazyPut(() => EmployeeDetailsController(), fenix: true);
  Get.lazyPut(() => OrdersController(), fenix: true);
  Get.lazyPut(() => NewOrderController(), fenix: true);
  Get.lazyPut(() => NewOrderFormController(), fenix: true);
  Get.lazyPut(() => SuppliersController(), fenix: true);
  Get.lazyPut(() => DashboardController(), fenix: true);
  Get.lazyPut(() => StorageController(), fenix: true);
  Get.lazyPut(() => ConsumableAssetsController(), fenix: true);
  Get.lazyPut(() => AdminApprovalController(), fenix: true);

}
