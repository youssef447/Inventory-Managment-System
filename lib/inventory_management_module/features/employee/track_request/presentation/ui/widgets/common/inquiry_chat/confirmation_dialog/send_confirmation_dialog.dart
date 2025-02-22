// Date: 12/11/2024
// By: Youssef Ashraf
// the confirmation dialog to confirm sending Attachments in chat
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../../core/widgets/buttons/app_default_button.dart';

class SendConfirmationDialog extends StatelessWidget {
  final int? count;
  const SendConfirmationDialog({super.key, this.count});

  @override
  Widget build(BuildContext context) {
    var isTablet = context.isTablett;

    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 24.w : 16.w,
          // vertical: isTablet ? 16.h : 12.h,
        ),
        width: Get.width * 0.3,
        height: isTablet ? 140.h : 150.h,
        // width: isTablet ? 214.w : 179.w,
        decoration: BoxDecoration(
          color: AppColors.dialog,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (count != null)
              Column(
                children: [
                  Text(
                    'Total Picked Files'.tr,
                    style: AppTextStyles.font16BlackMediumCairo,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    count.toString(),
                    style: AppTextStyles.font14BlackCairoRegular,
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppDefaultButton(
                  text: 'Cancel'.tr,
                  color: Colors.white,
                  borderColor: AppColors.lightGrey,
                  width: context.isTablett ? 100.w : 80.w,
                  style: AppTextStyles.font14BlackCairo.copyWith(
                    color: AppColors.black,
                  ),
                  height: 35.h,
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                AppDefaultButton(
                    text: 'Send'.tr,
                    width: context.isTablett ? 100.w : 80.w,
                    height: 35.h,
                    style: AppTextStyles.font14BlackCairo.copyWith(
                      color: AppColors.textButton,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    }),
              ],
            ),
          ],
        ));
  }
}
