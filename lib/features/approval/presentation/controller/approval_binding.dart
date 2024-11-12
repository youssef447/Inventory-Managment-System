

import 'package:get/get.dart';

import 'approval_controller.dart';

class ApprovalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
          () => ApprovalController(),
      fenix: true,
    );

  }
}
