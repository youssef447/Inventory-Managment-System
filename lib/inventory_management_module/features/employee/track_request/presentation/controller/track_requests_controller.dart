import '../../../../../core/enums/requests_enums.dart';
import '../../../requests/constants/ids_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../requests/entities/request_entity.dart';
import '../../../requests/presentation/controller/requests_controller.dart';
import '../../constants/ids_constants.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Where all logic in Request tab is handled
class TrackRequestController extends GetxController {
  List<RequestEntity> requests = [];
  bool loading = true;
  @override
  void onInit() {
    super.onInit();
    loadRequestsData();
  }

  ///Loading Requests from backend. Called at init
  Future<void> loadRequestsData() async {
    final currentRequestCategory =
        Get.find<RequestsController>().currentCategoryIndex.value;

    Get.find<RequestsController>().loadRequestsData().then((_) {
      if (currentRequestCategory == 0) {
        requests = Get.find<RequestsController>()
            .requestsOfAssets
            .where(
              (element) => element.status == RequestStatus.pending,
            )
            .map(
              (e) => e,
            )
            .toList();
      } else {
        requests = Get.find<RequestsController>()
            .requestsOfConsumables
            .where(
              (element) => element.status == RequestStatus.pending,
            )
            .map(
              (e) => e,
            )
            .toList();
      }
      loading = false;
      update([TrackRequestIds.trackRequestsPage]);
    });
  }

  //------------Search Filter ------------
  TextEditingController searchController = TextEditingController();

  //------------Track Request Details Scroll ------------
  final ScrollController scrollController = ScrollController();

//------------Cancel Request ------------
  final TextEditingController reasonOfRejectionController =
      TextEditingController();
  cancelRequest(String requestId, BuildContext context) {
    final isConsumable =
        Get.find<RequestsController>().currentCategoryIndex.value == 1;

    if (isConsumable) {
      Get.find<RequestsController>()
          .requestsOfConsumables
          .firstWhere((element) => element.requestId == requestId)
          .status = RequestStatus.cancelled;
    } else {
      Get.find<RequestsController>()
          .requestsOfAssets
          .firstWhere((element) => element.requestId == requestId)
          .status = RequestStatus.cancelled;
    }
    requests.removeWhere((element) => element.requestId == requestId);
    Navigator.of(context, rootNavigator: true).pop();
    Navigator.of(context).pop();
    /*   inventoryNavKey.currentState!.popUntil(
      (route) => route.settings.name == Routes.trackRequest,
    ); */
    update([TrackRequestIds.trackRequestsPage]);
    Get.find<RequestsController>()
        .update([RequestsIds.requestsPage, RequestsIds.summaryCircles]);
  }

  //------------Inquiry Chat ------------
}
