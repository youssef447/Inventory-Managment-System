import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../theme/app_text_styles.dart';

//Youssef Ashraf
class DefaultRichText extends StatelessWidget {
  final String label;
  final String value;
  const DefaultRichText({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '${label.tr} :',
        style: AppTextStyles.font14SecondaryBlackCairoMedium,
        children: [
          TextSpan(
            text: value,
            style: AppTextStyles.font14BlackCairoMedium
                .copyWith(color: value.split(' ')[0].getColor),
          ),
        ],
      ),
    );
  }
}
