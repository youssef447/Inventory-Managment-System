// by : mohamed ashraf

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../products/presentation/controller/products_controller.dart';


class MobileConsumableAdminCard extends GetView<ProductsController> {
  final int index;

  const MobileConsumableAdminCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(color: AppColors.card),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppAssets.image,
                width: 65.w,
                height: 65.h,
              ),
              horizontalSpace(4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'Asset ID'.tr} : ${controller.consumables[index].consumableId}',
                    style: AppTextStyles.font14BlackCairoMedium,
                  ),
                  verticalSpace(3),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: '${'Storage Location'.tr} : ',
                        style: AppTextStyles.font12SecondaryBlackCairoMedium,
                        children: [
                          TextSpan(
                              text: controller.consumables[index].storageLocation,
                              style: AppTextStyles.font12BlackCairo)
                        ]),
                  ),
                  verticalSpace(3),
                  RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                        text: '${'Supplier Name'.tr} : ',
                        style: AppTextStyles.font12SecondaryBlackCairoMedium,
                        children: [
                          TextSpan(
                              text: controller.consumables[index].supplierName,
                              style: AppTextStyles.font12BlackCairo)
                        ]),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(3),
          Text(
          controller.consumables[index].model + controller.consumables[index].brand,
            style: AppTextStyles.font14BlackCairoMedium,
          ),
          verticalSpace(3),
        ],
      ),
    );
  }
}
