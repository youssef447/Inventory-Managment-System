import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/widgets/fields/date_picker_field.dart';

import '../../helpers/spacing_helper.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'app_form_field.dart';

class LabeledFormField extends StatelessWidget {
  final bool? date;
  final bool? readOnly;
  final String? hintText;
  final bool? expands;
  final Color? backGroundColor;
  final Function(DateTime)? onDateChanged;
  const LabeledFormField({
    super.key,
    required this.controller,
    this.date,
    this.readOnly,
    this.backGroundColor,
    this.hintText,
    this.expands,
    required this.label,
    this.onDateChanged,
  });
  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.tr,
          style: AppTextStyles.font16BlackCairoRegular,
        ),
        verticalSpace(8),
        date ?? false
            ? DatePickerField(
                textEditingController: controller,
                width: double.infinity,
                hintText: hintText ?? '${'Pick'.tr} ${label.tr}',
                backGroundColor: backGroundColor ?? AppColors.field,
                onDateChanged: onDateChanged,
              )
            : SizedBox(
                height: expands ?? false ? 88.h : 44.h,
                child: AppTextFormField(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                  hintText: hintText ?? '${'Enter'.tr} ${label.tr}',
                  textAlignVertical:
                      expands ?? false ? TextAlignVertical.top : null,
                  readOnly: readOnly ?? true,
                  showBorder: true,
                  width: double.infinity,
                  backGroundColor: backGroundColor,
                  controller: controller,
                  expands: expands,
                ),
              ),
      ],
    );
  }
}
