// Date: 29/9/2024
// By: Youssef Ashraf

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants/app_assets.dart';
import '../../helpers/files/file_save_helper.dart';
import '../../helpers/files/file_type_helper.dart';
import '../../helpers/spacing_helper.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../../../features/requests/entities/attachment_entity.dart';

//Youssef Ashraf
///Default Attachment Card for any file
class AttachmentCard extends StatelessWidget {
  final AttachmentEntity model;
  final bool? showDelete;
  final bool? showDownload;
  final void Function()? onDelete;
  const AttachmentCard({
    super.key,
    required this.model,
    this.onDelete,
    this.showDelete,
    this.showDownload,
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
        color: AppColors.card,
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
                  onTap: onDelete,
                  child: SvgPicture.asset(
                    AppAssets.delete,
                  ),
                ),
              const Spacer(),
              // if (showDownload ?? false)
              GestureDetector(
                onTap: () {
                  FileSaveHelper.saveFile(model.file);
                },
                child: SvgPicture.asset(
                  AppAssets.download2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
