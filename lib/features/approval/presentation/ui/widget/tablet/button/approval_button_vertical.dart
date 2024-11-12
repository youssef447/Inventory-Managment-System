//by : mohamed Ashraf
//date : 11/11/2024


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/helpers/get_date_picker_helper.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';


class ApprovalButtonVertical extends StatelessWidget {
  const ApprovalButtonVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Reject Button
        GestureDetector(
          onTap: () {
            // Add your reject action here
          },
          child: Container(
            height: 40.h,
            width: 130.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(5),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.cancel,
                  color: Colors.red,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                    'Reject'.tr,
                    style: AppTextStyles.font16InputColorCairo.copyWith(color: AppColors.red)
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Approve Button
        GestureDetector(
          onTap: () {
            // Add your approve action here
          },
          child: Container(
            height: 40.h,
            width: 130.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
              borderRadius: BorderRadius.circular(8),
            ),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                    'Approve'.tr,
                    style: AppTextStyles.font16InputColorCairo.copyWith(color: AppColors.green)
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}