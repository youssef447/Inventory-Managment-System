// Date: 29/9/2024
// By: Youssef Ashraf

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/file_type_helper.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../requests/entities/attachment_entity.dart';
import '../../../controller/request_assets_controller.dart';

class AttachmentCard extends GetView<RequestAssetsController> {
  final AttachmentEntity model;
  final bool? showDelete;
  const AttachmentCard({
    super.key,
    required this.model,
    this.showDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: context.isPhone ? double.infinity : 193.w,
      padding: EdgeInsets.symmetric(
        horizontal: 6.w,
        vertical: 12.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: AppColors.whiteShadow),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            FileTypeHelper.getExstensionImage(model.file),
            width: 50.w,
            height: 50.h,
          ),
          horizontalSpace(5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.fileName!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font14BlackCairoMedium),
                Text('${model.totalSize.toStringAsFixed(2)} ${'MB'.tr}',
                    style: AppTextStyles.font12SecondaryBlackMediumCairo),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (showDelete ?? false)
                GestureDetector(
                  onTap: () {
                    controller.removeAttachment(model);
                  },
                  child: SvgPicture.asset(
                    AppAssets.delete,
                  ),
                ),
              const Spacer(),
              SvgPicture.asset(
                AppAssets.download2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
