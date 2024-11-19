import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../theme/app_text_styles.dart';

//Youssef Ashraf
/// Default Rich Text As (Label : Value).
class DefaultRichText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;
  final TextStyle? labelStyle;
  const DefaultRichText({
    super.key,
    required this.label,
    required this.value,
    this.style,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: '${label.tr}: ',
        style: (context.isTablett
            ? AppTextStyles.font14SecondaryBlackCairoMedium
            : AppTextStyles.font12SecondaryBlackCairoMedium),
        children: [
          TextSpan(
            text: value,
            style: context.isTablett
                ? AppTextStyles.font14BlackCairoMedium
                    .copyWith(color: value.split(' ')[0].getColor)
                : AppTextStyles.font12BlackMediumCairo
                    .copyWith(color: value.split(' ')[0].getColor),
          ),
        ],
      ),
    );
  }
}
