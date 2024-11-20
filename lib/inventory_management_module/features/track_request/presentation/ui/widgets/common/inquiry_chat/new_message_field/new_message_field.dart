import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/helpers/spacing_helper.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../../../../../requests/entities/request_entity.dart';
import '../../../../../controller/track_requests_controller.dart';

class NewMessageField extends GetView<TrackRequestController> {
  final RequestEntity model;
  const NewMessageField(this.model, {super.key});

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
            controller.sendMessage(
              model: model,
              message: controller.messageController.text,
            );
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
