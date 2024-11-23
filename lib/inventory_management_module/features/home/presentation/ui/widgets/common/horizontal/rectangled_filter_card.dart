import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';

class RectangledFilterCard extends StatelessWidget {
  final String image;
  final String text;
  final Color color;
  final double? width;
  final Color? textColor;
  final Function()? onTap;
  const RectangledFilterCard({
    super.key,
    required this.image,
    required this.text,
    required this.onTap,
    required this.color,
    this.textColor,
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
          color: color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              image,
              color: textColor ?? AppColors.icon,
            ),
            horizontalSpace(5),
            Flexible(
              child: Text(
                text.tr,
                overflow: TextOverflow.ellipsis,
                style: context.isPhone
                    ? AppTextStyles.font16BlackMediumCairo
                        .copyWith(color: textColor ?? AppColors.textButton)
                    : AppTextStyles.font18BlackMediumCairo
                        .copyWith(color: textColor ?? AppColors.textButton),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
