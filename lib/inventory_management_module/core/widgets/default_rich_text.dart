import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../theme/app_text_styles.dart';
import '../extensions/extensions.dart';

//Youssef Ashraf
/// Default Rich Text As (Label : Value).
class DefaultRichText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final Color? valueColor;
  final bool fullText;
  final String? icon;
  const DefaultRichText({
    super.key,
    required this.label,
    required this.value,
    this.style,
    this.valueColor,
    this.icon,
    this.labelStyle,
    this.fullText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Padding(
            padding: EdgeInsetsDirectional.only(end: 4.0.w),
            child: SvgPicture.asset(
              icon!,
              width: 11.w,
              height: 11.h,
            ),
          ),
        RichText(
          textAlign: TextAlign.start,
          overflow: fullText ? TextOverflow.visible : TextOverflow.ellipsis,
          text: TextSpan(
            text: '${label.tr}: ',
            style: labelStyle ??
                (context.isTablett
                    ? AppTextStyles.font14SecondaryBlackCairoMedium
                    : AppTextStyles.font12SecondaryBlackCairoMedium),
            children: [
              TextSpan(
                text: value,
                style: style ??
                    (context.isTablett
                        ? AppTextStyles.font14BlackCairoMedium.copyWith(
                            color: valueColor ?? value.split(' ')[0].getColor)
                        : AppTextStyles.font12BlackMediumCairo.copyWith(
                            color: valueColor ?? value.split(' ')[0].getColor)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
