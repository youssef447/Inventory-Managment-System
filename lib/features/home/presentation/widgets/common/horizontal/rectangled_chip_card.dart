import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/spacing_helper.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_theme.dart';
import '../../../../../../core/theme/app_text_styles.dart';

class RectangledChipCard extends StatelessWidget {
  final String image;
  final String text;
  final Color color;
  final double? width;
  final Function()? onTap;
  const RectangledChipCard({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.color,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 37.h,
        width: width ?? 120.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: AppTheme.isDark ?? false ? AppColors.card : color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              color: AppColors.icon,
            ),
            horizontalSpace(5),
            Flexible(
              child: Text(
                text.tr,
                overflow: TextOverflow.ellipsis,
                style: context.isPhone
                    ? AppTextStyles.font16BlackMediumCairo
                        .copyWith(color: AppColors.textButton)
                    : AppTextStyles.font18BlackMediumCairo
                        .copyWith(color: AppColors.textButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
