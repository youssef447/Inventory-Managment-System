import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/approve_cycle.dart';
import '../../../../core/helpers/get_dialog_helper.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../requests/constants/ids_constants.dart';
import '../../../requests/entities/attachment_entity.dart';
import '../../../requests/entities/message_entity.dart';
import '../../../requests/entities/request_entity.dart';
import '../../../requests/presentation/controller/requests_controller.dart';
import '../../constants/ids_constants.dart';
import '../ui/widgets/common/inquiry_chat/confirmation_dialog/send_confirmation_dialog.dart';

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
              (element) => element.status == 'Pending',
            )
            .map(
              (e) => e,
            )
            .toList();
      } else {
        requests = Get.find<RequestsController>()
            .requestsOfConsumables
            .where(
              (element) => element.status == 'Pending',
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

  //------------Inquiry Chat ------------
  TextEditingController messageController = TextEditingController();
  final messageFocusNode = FocusNode();

  final ScrollController scrollController = ScrollController();
  uploadAttachments(RequestEntity model) async {
    messageFocusNode.unfocus();
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null && Get.context!.mounted) {
      final confirmed = await GetDialogHelper.generalDialog(
        child: SendConfirmationDialog(
          count: result.files.length,
        ),
        context: Get.context!,
      );

      if (confirmed) {
        for (var file in result.files) {
          String fileName = File(file.path!).path.split('/').last;
          String extension = fileName.split('.').last;
          double totalSize = File(file.path!).lengthSync() / (1024 * 1024);
          sendMessage(
            model: model,
            //to update once
            autoUpdate: false,
            attachment: AttachmentEntity(
              file: File(file.path!),
              fileName: fileName,
              extension: extension,
              totalSize: totalSize,
            ),
          );
        }
        update([TrackRequestIds.inquiryDetails]);
      }
    }
  }

  sendMessage(
      {required RequestEntity model,
      AttachmentEntity? attachment,
      bool autoUpdate = true,
      String? message}) {
    messageFocusNode.unfocus();

    if (attachment != null) {
      model.inquiryMessages.add(MessageEntity(
          // Replaced With Acutal Current User
          userEntity: ApproveCycle.approvalCycles[0],
          attachment: attachment));
    } else {
      model.inquiryMessages.add(MessageEntity(
        userEntity: ApproveCycle.approvalCycles[0],
        message: message,
      ));
    }
    messageController.clear();

    if (autoUpdate) {
      update([TrackRequestIds.inquiryDetails]);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollBottom());
  }

  scrollBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 150), curve: Curves.ease);
  }

//------------Cancel Request ------------
  cancelRequest(String requestId) {
    final isConsumable =
        Get.find<RequestsController>().currentCategoryIndex.value == 1;

    if (isConsumable) {
      Get.find<RequestsController>()
          .requestsOfConsumables
          .firstWhere((element) => element.requestId == requestId)
          .status = 'Canceled';
    } else {
      Get.find<RequestsController>()
          .requestsOfAssets
          .firstWhere((element) => element.requestId == requestId)
          .status = 'Canceled';
    }
    requests.removeWhere((element) => element.requestId == requestId);

    Get.until((route) => route.settings.name == Routes.trackRequest);
    update([TrackRequestIds.trackRequestsPage]);
    Get.find<RequestsController>().update([RequestsIds.requestsPage]);
  }
}
