// Date: 29/9/2024
// By: Nada Mohammed
// Last update: 29/9/2024
// Objectives: This file is responsible for providing a widget that displays a custom date selector dialog.

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../extensions/extensions.dart';

import '../../constants/app_assets.dart';
import '../../helpers/spacing_helper.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../buttons/app_text_button.dart';

class CustomDataSelectorDialog extends StatelessWidget {
  const CustomDataSelectorDialog({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var isTablet = context.isTablett;

    return Container(
      width: 350.w,
      height: 400.h,
      decoration: BoxDecoration(
        color: AppColors.dialog,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 10.w,
          vertical: 12.h,
        ),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.primary,
                  radius: 15.r,
                  child: SvgPicture.asset(
                    AppAssets.calender,
                    color: AppColors.icon,
                    width: 16.w,
                    height: 16.h,
                  ),
                ),
                horizontalSpace(8),
                Text(
                  'Custom Data Selector'.tr,
                  style: AppTextStyles.font14BlackRegularCairo,
                ),
              ],
            ),
            verticalSpace(23),
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: SizedBox(
                height: 260.h,
                child: SfDateRangePicker(
                  selectionTextStyle:
                      AppTextStyles.font12BlackCairoRegular.copyWith(
                    color: AppColors.textButton,
                  ),
                  todayHighlightColor: AppColors.secondaryPrimary,
                  monthViewSettings: DateRangePickerMonthViewSettings(
                    viewHeaderStyle: DateRangePickerViewHeaderStyle(
                      textStyle: AppTextStyles.font12BlackCairoRegular,
                    ),
                  ),
                  maxDate: DateTime.now(),
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    todayTextStyle:
                        AppTextStyles.font12BlackCairoRegular.copyWith(
                      color: AppColors.secondaryPrimary,
                    ),
                    disabledDatesTextStyle:
                        AppTextStyles.font12SecondaryBlackCairoRegular,
                    textStyle: AppTextStyles.font12BlackCairoRegular,
                  ),
                  selectionColor: AppColors.primary,
                  rangeTextStyle:
                      AppTextStyles.font12BlackCairoRegular.copyWith(
                    color: AppColors.textButton,
                  ),
                  backgroundColor: AppColors.background,
                  headerStyle: DateRangePickerHeaderStyle(
                    backgroundColor: AppColors.background,
                    textAlign: TextAlign.center,
                    textStyle:
                        AppTextStyles.font12PrimaryColorMediumCairo.copyWith(
                      color: AppColors.secondaryPrimary,
                    ),
                  ),
                  view: DateRangePickerView.month,
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  selectionMode: DateRangePickerSelectionMode.range,
                  startRangeSelectionColor: AppColors.secondaryPrimary,
                  rangeSelectionColor: AppColors.primary,
                  endRangeSelectionColor: AppColors.secondaryPrimary,
                ),
              ),
            ),
            verticalSpace(16),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AppTextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                width: isTablet ? 95.w : 71.w,
                height: 40.h,
                text: 'Apply'.tr,
                textStyle: AppTextStyles.font14BlackCairoMedium.copyWith(
                  color: AppColors.textButton,
                ),
                backgroundColor: AppColors.primary,
                borderRadius: 4.r,
              ),
            )
          ],
        ),
      ),
    );
  }
}
