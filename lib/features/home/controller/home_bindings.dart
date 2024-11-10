// Date: 7/11/2024
// By: Youssef Ashraf
// Objectives: This file is responsible for providing a binding class that is used to bind the home controller to the home page.

import 'package:get/get.dart';

import '../../Assets/presentation/controller/assets_controller.dart';
import '../../consumables/presentation/controller/consumables_controller.dart';
import '../../requests/presentation/controller/requests_controller.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
      fenix: true,
    );

    Get.lazyPut(
      () => AssetsController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ConsumablesController(),
      fenix: true,
    );
    Get.lazyPut(
      () => RequestsController(),
      fenix: true,
    );
  }
}
