// by : Mohamed ashraf
// date : 10/8/2024
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

import '../../helpers/spacing_helper.dart';
import '../../theme/app_text_styles.dart';
import 'app_form_field.dart';

class TextSingleField extends StatelessWidget {
  final String typeName;
  final String hintText;
  final Widget? icon;
  final TextEditingController controller;
  final bool isArabic;
  final String? Function(String?)? validator;
  final bool isReadOnly;
  final void Function()? onTap;
  final String? helperText;
  final TextStyle? style;

  const TextSingleField(
      {super.key,
      this.isArabic = false,
      this.validator,
      this.hintText = 'Text Here',
      required this.controller,
      required this.typeName,
      this.isReadOnly = false,
      this.icon,
      this.onTap,
      this.helperText,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          typeName,
          style: AppTextStyles.font16BlackMediumCairo,
        ),
        verticalSpace(12),
        AppTextFormField(
          helperText: helperText,
          hintText: hintText,
          maxLines: 1,
          prefixIcon: icon,
          hintStyle: AppTextStyles.font12SecondaryBlackCairoRegular,
          style: style ?? AppTextStyles.font12BlackCairoRegular,
          showBorder: true,
          width: double.infinity,
          controller: controller,
          validator: validator,
          readOnly: isReadOnly,
          onTap: onTap,
          backGroundColor: AppColors.base,
        ),
      ],
    );
  }
}
