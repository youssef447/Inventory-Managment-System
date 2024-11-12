import 'package:get/get.dart';

import 'track_requests_controller.dart';

class TrackRequestsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => TrackRequestController(),
      fenix: true,
    );
  }
}
