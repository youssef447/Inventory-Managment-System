import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/routes/app_routes.dart';
import '../../../requests/constants/ids_constants.dart';
import '../../../requests/entities/attachment_entity.dart';
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

  RxInt currentCategoryIndex = 0.obs;
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  ///Loading Requests from backend. Called at init
  Future<void> loadRequestsData() async {
    Get.find<RequestsController>().loadRequestsData().then((_) {
      requests = Get.find<RequestsController>()
          .requests
          .where(
            (element) => element.status == 'Pending',
          )
          .toList();
      loading = false;
      update([TrackRequestIds.trackRequestsPage]);
    });
  }

  //------------Search Filter ------------
  TextEditingController searchController = TextEditingController();

  //------------Inquiry Chat ------------
  TextEditingController messageController = TextEditingController();
  List<AttachmentEntity> attachments = [];
  uploadAttachments() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      attachments.addAll(result.files.map((e) {
        String fileName = File(e.path!).path.split('/').last;
        String extension = fileName.split('.').last;
        double totalSize = File(e.path!).lengthSync() / (1024 * 1024);

        return AttachmentEntity(
            file: File(e.path!),
            fileName: fileName,
            extension: extension,
            totalSize: totalSize);
      }).toList());
      update([TrackRequestIds.inquiry]);
    }
  }

  cancelRequest(String requestId) {
    requests.firstWhere((element) => element.requestId == requestId).status =
        'Canceled';
    Get.find<RequestsController>().requests = List.from(requests);
    requests.removeWhere((element) => element.requestId == requestId);

    Get.until((route) => route.settings.name == Routes.trackRequest);
    update([TrackRequestIds.trackRequestsPage]);
    Get.find<RequestsController>().update([RequestsIds.requestsPage]);
  }
}
