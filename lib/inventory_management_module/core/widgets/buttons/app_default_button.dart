import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../extensions/extensions.dart';

import '../../helpers/haptic_feedback_helper.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

// mohamed && youssef ashraf work
class AppDefaultButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final double? width;
  final double? radius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  final double? height;
  final Color? textColor, iconColor;
  final TextStyle? style;
  final Color borderColor;
  final String? icon;

  const AppDefaultButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.padding,
    this.radius,
    this.color,
    this.textColor,
    this.height,
    this.iconColor,
    this.style,
    this.icon,
    this.borderColor = Colors.transparent,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 120.w,
      height: height,
      child: MaterialButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 4.r),
          side: BorderSide(color: borderColor),
        ),
        height: height ?? (context.isTablett ? 43.h : 40.h),
        color: color ?? AppColors.primary,
        onPressed: () {
          HapticFeedbackHelper.triggerHapticFeedback(
            vibration: VibrateType.mediumImpact,
            hapticFeedback: HapticFeedback.mediumImpact,
          );
          onPressed?.call();
        },
        minWidth: width,
        disabledColor:
            Get.isDarkMode ? AppColors.card : AppColors.moreLightGrey,
        padding: padding,
        child: FittedBox(
          child: Text(
            text,
            style: style?.copyWith(color: textColor) ??
                AppTextStyles.font14BlackCairo.copyWith(
                  color: AppColors.textButton,
                ),
          ),
        ),
      ),
    );
  }
}
