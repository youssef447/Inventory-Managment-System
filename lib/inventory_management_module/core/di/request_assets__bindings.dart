// Date: 7/11/2024
// By: Youssef Ashraf
// Objectives: This file is responsible for providing a binding class that is used to bind the Request Assets controller to the Request Assets page.

import 'package:get/get.dart';

import '../../features/request_new_asset/presentation/controller/request_assets_controller.dart';

class RequestAssetsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RequestAssetsController(),
    );
  }
}
