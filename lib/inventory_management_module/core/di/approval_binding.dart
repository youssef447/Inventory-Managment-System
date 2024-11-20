// by : Mohamed Ashraf

import 'package:get/get.dart';

import '../../features/approval/presentation/controller/approval_controller.dart';

class ApprovalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => ApprovalController(),
      fenix: true,
    );
  }
}
