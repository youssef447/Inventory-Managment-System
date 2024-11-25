//by : Mohamed Ashraf

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/widgets/buttons/app_default_button.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';

class AddProductDialog extends StatelessWidget {
  const AddProductDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: Get.width * 0.6,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.dialog,
          borderRadius: BorderRadius.circular(8.r),
        ),
        constraints: BoxConstraints(
          maxHeight: Get.height * 0.2,
        ),
        child:  Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                    backgroundColor: AppColors.primary,
                    radius: 16,
                    child: SvgPicture.asset(
                      AppAssets.add,
                      width: 16,
                      height: 16,
                      color: Colors.black,
                    )),
                horizontalSpace(8),
                Text(
                  'Add New Product'.tr,
                  style: AppTextStyles.font24MediumBlackCairo,
                ),
                
              ],
            ),
            const Spacer(),
            AppDefaultButton(text: 'Next'.tr,onPressed: (){},)
          ],
        )

    );
  }
}
