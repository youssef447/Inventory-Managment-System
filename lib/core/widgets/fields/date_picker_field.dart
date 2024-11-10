// Date: 29/9/2024
// By: Youssef Ashraf
// Objectives: This file is responsible for providing the default date picker field widget for the application.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/theme/app_colors.dart';

import '../../constants/app_assets.dart';
import '../../helpers/date_time_helper.dart';
import '../../helpers/get_date_picker_helper.dart';
import '../../theme/app_text_styles.dart';

import '../../helpers/validation_helper.dart';
import 'app_form_field.dart';

class DatePickerField extends StatelessWidget {
  final TextEditingController textEditingController;

  final String? hintText;
  final String? icon;
  final double? width;
  final bool showIcon;
  final bool openDatePiker;

  final Function(DateTime)? onDateChanged;

  const DatePickerField({
    super.key,
    required this.textEditingController,
    this.onDateChanged,
    this.hintText,
    this.width,
    this.icon,
    this.showIcon = true, this.openDatePiker = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { openDatePiker?
        GetDatePickerHelper.customDatePicker(context: context).then(
          (value) {
            if (value != null) {
              textEditingController.text = DateTimeHelper.formatDate(value[0]!);

              if (onDateChanged != null) {
                onDateChanged!(value[0]!);
              }
            }
          }
        ): null;
      },
      child: SizedBox(
        height: 40.h,
        child: AppTextFormField(
          readOnly: true,
          enabled: false,
          backGroundColor: AppColors.base,
          controller: textEditingController,
          hintText: hintText,
          suffixIcon: showIcon
              ? SvgPicture.asset(
                  AppAssets.calender,
                )
              : const SizedBox(),
          hintStyle: AppTextStyles.font12SecondaryBlackCairoRegular,
          style: AppTextStyles.font14BlackCairoRegular,
          width: width ?? 186.w,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 8.h,
          ),
          validator: (value) {
            return ValidationHelper.isEmpty(value, 'Date'.tr);
          },
        ),
      ),
    );
  }
}
