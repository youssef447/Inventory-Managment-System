import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../constants/app_assets.dart';
import '../../helpers/haptic_feedback_helper.dart';
import '../../helpers/spacing_helper.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class MobileCustomAppbar extends StatelessWidget {
  final String title;
  const MobileCustomAppbar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            HapticFeedbackHelper.triggerHapticFeedback(
              vibration: VibrateType.mediumImpact,
              hapticFeedback: HapticFeedback.mediumImpact,
            );
            Get.back();
          },
          child: SvgPicture.asset(
            context.isArabic ? AppAssets.arrowForward : AppAssets.arrowBack,
            color: AppColors.text,
            width: 16.w,
            height: 16.h,
          ),
        ),
        verticalSpace(8),
        Text(
          title,
          style: AppTextStyles.font16BlackMediumCairo,
        ),
      ],
    );
  }
}
