import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/constants/approve_cycle.dart';
import '../../../../../core/enums/message_actions.dart';
import '../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../core/helpers/spacing_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../requests/entities/attachment_entity.dart';
import '../../../requests/entities/message_entity.dart';
import '../../../requests/entities/request_entity.dart';
import '../../constants/ids_constants.dart';
import '../ui/widgets/common/inquiry_chat/confirmation_dialog/send_confirmation_dialog.dart';
import 'track_requests_controller.dart';

class InquiryChatController extends GetxController {
  TextEditingController messageController = TextEditingController();
  final messageFocusNode = FocusNode();

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
        update([TrackRequestIds.inquiryChat]);
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
        attachment: attachment,
      ));
    } else {
      model.inquiryMessages.add(MessageEntity(
        userEntity: ApproveCycle.approvalCycles[0],
        message: message,
      ));
    }
    messageController.clear();

    if (autoUpdate) {
      update([TrackRequestIds.inquiryChat]);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) => scrollBottom());
  }

  scrollBottom() {
    final scrollController =
        Get.find<TrackRequestController>().scrollController;
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 150), curve: Curves.ease);
  }

  ///Show Message Actions Menu (Edit,Delete)
  showMessageActions(
      {required MessageEntity messageEntity,
      required Offset position,
      required BuildContext context}) {
    if (!messageEntity.isMe) return;

    final RenderBox bubbleBox = context.findRenderObject() as RenderBox;
    final Offset position = bubbleBox.localToGlobal(Offset.zero);
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx, // X position
        position.dy + bubbleBox.size.height, // Y position above the widget
        16.w + bubbleBox.size.width, // Right boundary
        position.dy, // Bottom boundary
      ),
      items: [
        PopupMenuItem(
          value: MessageActions.edit,
          height: 34.h,
          child: Row(
            children: [
              Icon(
                Icons.edit,
                color: AppColors.secondaryBlack,
                size: 14.sp,
              ),
              horizontalSpace(4),
              Text(
                MessageActions.edit.getName,
                style: AppTextStyles.font13SecondaryBlackCairoMedium,
              ),
            ],
          ),
          onTap: () {},
        ),
        PopupMenuItem(
          value: MessageActions.delete,
          height: 34.h,
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.trash),
              horizontalSpace(4),
              Text(
                MessageActions.delete.getName,
                style: AppTextStyles.font13SecondaryBlackCairoMedium,
              ),
            ],
          ),
          onTap: () {},
        ),
      ],
    );
  }

  deleteMessage(MessageEntity messageEnity) {}
  editMessage(MessageEntity messageEnity) {}
}
