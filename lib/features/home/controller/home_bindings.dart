// Date: 7/11/2024
// By: Youssef Ashraf
// Objectives: This file is responsible for providing a binding class that is used to bind the home controller to the home page.

import 'package:get/get.dart';

import '../../requests/presentation/controller/requests_controller.dart';
import 'home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(),
    );
    Get.lazyPut(
      () => RequestsController(),
      fenix: true,
    );
  }
}
