import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../requests/entities/message_entity.dart';

class EditDeleteDropdown extends StatelessWidget {
  final MessageEntity messageEntity;
  final OverlayEntry overlayEntry;
  final Offset position;
  const EditDeleteDropdown({
    super.key,
    required this.messageEntity,
    required this.overlayEntry,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    var isMe = messageEntity.isMe;
    final spaceBelow = Get.height - position.dy;

    final double? adjustTop =
        spaceBelow < Get.height * 0.3 ? null : position.dy - 44.h;

    return Stack(
      children: [
        Container(
          color: AppColors.darkWhiteShadow,
        ),
        PositionedDirectional(
          start: isMe
              ? null
              : !context.isTablett
                  ? 16.w
                  : 305.w,
          end: isMe
              ? context.isPhone
                  ? 16.w
                  : 320.w
              : 32.w,
          top: adjustTop,
          bottom: adjustTop == null ? Get.bottomBarHeight : null,
          child: Material(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  child: Row(
                    children: [
                      Icon(
                        Icons.edit,
                        color: AppColors.secondaryBlack,
                        size: 14.sp,
                      ),
                      horizontalSpace(4),
                      Text('Edit'.tr)
                    ],
                  ),
                ),
                GestureDetector(
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.trash),
                      horizontalSpace(4),
                      Text('Delete'.tr)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
