// Date: 10/11/2024
// By: Mohamed Ashraf
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/features/Assets/presentation/controller/assets_controller.dart';

class AssetsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AssetsController(), fenix: true);
  }
}
