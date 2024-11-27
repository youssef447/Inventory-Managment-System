import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../requests/entities/request_entity.dart';
import '../../../../../controller/inquiry_chat_controller.dart';

class NewMessageField extends GetView<InquiryChatController> {
  final RequestEntity model;
  final bool? adminEmpDetailsPage;
  const NewMessageField(this.model, {super.key, this.adminEmpDetailsPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 42.h,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: AppTextFormField(
                focusNode: controller.messageFocusNode,
                collapsed: true,
                backGroundColor: AppColors.background,
                controller: controller.messageController,
                prefixIcon: GestureDetector(
                    onTap: () {
                      controller.uploadAttachments(model);
                    },
                    child: SvgPicture.asset(AppAssets.attach)),
                hintText: 'Write A Comment'.tr,
              ),
            ),
          ),
        ),
        horizontalSpace(12),
        GestureDetector(
          onTap: () {
            if (controller.messageController.text.isEmpty) return;

            if (controller.editableMessageEntity != null) {
              controller.editMessage();
            } else {
              controller.sendMessage(
                model: model,
                message: controller.messageController.text,
                adminEmpDetailsPage: adminEmpDetailsPage,
              );
            }
          },
          child: Container(
            height: 42.h,
            width: 42.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.secondaryPrimary,
                borderRadius: BorderRadius.circular(8.r)),
            child: SvgPicture.asset(
              AppAssets.send,
            ),
          ),
        )
      ],
    );
  }
}
