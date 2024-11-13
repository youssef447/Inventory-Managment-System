import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../theme/app_text_styles.dart';

//Youssef Ashraf
/// Displays a rich text with a label and a value.
class DefaultRichText extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? style;
  final TextStyle? labelStyle;
  const DefaultRichText(
      {super.key,
      required this.label,
      required this.value,
      this.style,
      this.labelStyle});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        text: '${label.tr} :',
        style: labelStyle ?? AppTextStyles.font14SecondaryBlackCairoMedium,
        children: [
          TextSpan(
            text: value,
            style: style == null
                ? AppTextStyles.font14BlackCairoMedium
                    .copyWith(color: value.split(' ')[0].getColor)
                : style?.copyWith(color: value.split(' ')[0].getColor),
          ),
        ],
      ),
    );
  }
}
