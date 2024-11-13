// by : mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/theme/app_text_styles.dart';

class RichTextRow extends StatelessWidget {
  final String type;
  final String value;
  const RichTextRow({
    super.key, required this.type, required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.end,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          text: '${type.tr} : ',
          style:context.isLandscape? AppTextStyles.font14SecondaryBlackCairoRegular :  AppTextStyles.font16secondaryBlackRegularCairo ,
          children: [
            TextSpan(
                text: value.tr,
                style: context.isLandscape? AppTextStyles.font14BlackCairoRegular : AppTextStyles.font16BlackCairoMedium
            )
          ]),
    );
  }
}