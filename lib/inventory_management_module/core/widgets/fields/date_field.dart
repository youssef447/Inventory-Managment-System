import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/spacing_helper.dart';
import '../../theme/app_text_styles.dart';
import 'date_picker_field.dart';

//Mohamed Ashraf
class DateField extends StatelessWidget {
  final TextEditingController dateController;
  final String headerName;
  // final Function(DateTime)? onDateChanged;

  const DateField({
    super.key,
    required this.dateController,
    required this.headerName,
    // required this.onDateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerName.tr,
          style: AppTextStyles.font16BlackMediumCairo,
        ),
        verticalSpace(12),
        DatePickerField(
          openDatePiker: false,
          showIcon: true,
          // onDateChanged: onDateChanged,
          textEditingController: dateController,
          // hintText: 'Choose Date'.tr,
        ),
      ],
    );
  }
}
