import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../core/extensions/extensions.dart';

import '../../helpers/spacing_helper.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class RectangledFilterCard extends StatelessWidget {
  final String? image;
  final String text;
  final Color color;
  final double? width, height, iconHeight, iconWidth;
  final Color? textColor;
  final Color? iconColor;
  final Function()? onTap;
  const RectangledFilterCard({
    super.key,
    this.image,
    required this.text,
    required this.onTap,
    required this.color,
    this.textColor,
    this.width,
    this.height,
    this.iconWidth,
    this.iconHeight,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 37.h,
        width: width ?? 120.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: color,
        ),
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        child: image == null
            ? Center(
                child: Text(
                  text.tr,
                  overflow: TextOverflow.ellipsis,
                  style: !context.isTablett
                      ? AppTextStyles.font16BlackMediumCairo
                          .copyWith(color: textColor ?? AppColors.textButton)
                      : AppTextStyles.font18BlackMediumCairo
                          .copyWith(color: textColor ?? AppColors.textButton),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    image!,
                    color: iconColor ?? textColor ?? AppColors.icon,
                    width: iconWidth ?? 15.w,
                    height: iconHeight ?? 15.h,
                  ),
                  horizontalSpace(4),
                  Flexible(
                    child: Text(
                      text.tr,
                      overflow: TextOverflow.ellipsis,
                      style: !context.isTablett
                          ? AppTextStyles.font16BlackMediumCairo.copyWith(
                              color: textColor ?? AppColors.textButton)
                          : AppTextStyles.font18BlackMediumCairo.copyWith(
                              color: textColor ?? AppColors.textButton),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
