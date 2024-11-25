
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../..//core/widgets/fields/date_picker_field.dart';

import '../../helpers/spacing_helper.dart';
import '../../theme/app_text_styles.dart';
import '../dropdown/app_dropdown.dart';
import 'app_form_field.dart';

class LabeledDropdownField extends StatelessWidget {


  final String? hintText;
  final String? textButton;
  final List<DropdownMenuItem> items;
  final dynamic value;
  final Function(dynamic) onChanged;
  const LabeledDropdownField({
    super.key,
    required this.controller,
    this.hintText,
    required this.label,
    required this.value,
    required this.onChanged, required this.items, this.textButton
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
        AppDropdown(
          showDropdownIcon: true,
          onChanged: onChanged,
          hintText: hintText ?? 'choice',
          height: 44.h,
          value: value,
          textButton: textButton,
          items: items,
        ),
      ],
    );
  }
}
