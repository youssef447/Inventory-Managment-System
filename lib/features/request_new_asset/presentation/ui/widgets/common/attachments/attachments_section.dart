//Youssef Ashraf
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';

import '../../../../../../../core/widgets/attachments/attachment_card.dart';
import '../../../../../constants/ids_constants.dart';
import '../../../../controller/request_assets_controller.dart';

class AttachmentsSection extends StatelessWidget {
  const AttachmentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestAssetsController>(
      id: RequestAssetsIds.attachments,
      builder: (controller) {
        if (controller.attachments.isEmpty) {
          return GestureDetector(
            onTap: () {
              controller.uploadAttachments();
            },
            child: Container(
              height: 35.h,
              padding: EdgeInsets.symmetric(
                horizontal: 12.5.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: AppColors.primary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.export,
                    width: 16.w,
                    height: 16.h,
                    color: AppColors.icon,
                  ),
                  horizontalSpace(16),
                  Text(
                    'Upload Attachments'.tr,
                    style: AppTextStyles.font14BlackCairoMedium
                        .copyWith(color: AppColors.textButton),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Attachments'.tr,
                  style: AppTextStyles.font14BlackCairoMedium),
              verticalSpace(16),
              Wrap(
                runSpacing: 8.w,
                spacing: 8.w,
                children: List.generate(
                  controller.attachments.length,
                  (index) {
                    return AttachmentCard(
                      model: controller.attachments[index],
                      showDelete: true,
                      onDelete: () {
                        controller
                            .removeAttachment(controller.attachments[index]);
                      },
                    );
                  },
                ),
              ),
              verticalSpace(8),
              GestureDetector(
                onTap: () {
                  controller.uploadAttachments();
                },
                child: Container(
                  height: 34.h,
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        AppAssets.add,
                        color: AppColors.white,
                      ),
                      horizontalSpace(8),
                      Text(
                        'Add More'.tr,
                        style: AppTextStyles.font14BlackCairoMedium
                            .copyWith(color: AppColors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
