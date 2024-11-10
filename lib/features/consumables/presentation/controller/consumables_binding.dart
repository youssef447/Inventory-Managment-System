// Date: 10/11/2024
// By: Mohamed Ashraf
import 'package:get/get.dart';
import 'consumables_controller.dart';


class ConsumablesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConsumablesController(), fenix: true);
  }
}
