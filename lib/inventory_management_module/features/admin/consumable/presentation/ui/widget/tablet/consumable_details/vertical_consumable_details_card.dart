import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../features/employee/consumables/domain/entity/consumables_entity.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';

class VerticalConsumableDetailsCard extends StatelessWidget {
  final ConsumablesEntity consumable;

  const VerticalConsumableDetailsCard({super.key, required this.consumable});

  @override
  Widget build(BuildContext context) {
    ;
    return Container(
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(8.r),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
        vertical: 10.h,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.r),
                    child: Image.asset(
                      AppAssets.pphone,
                      width: 100.w,
                      height: 100.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(4),
                  Text(
                    consumable.model + consumable.brand,
                    style: AppTextStyles.font16BlackCairoRegular,
                  ),
                  verticalSpace(8),
                  verticalSpace(4),
                  Image.asset(
                    AppAssets.qr,
                  ),
                  verticalSpace(8),
                ],
              ),
              horizontalSpace(16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultRichText(
                      label: 'Consumable ID',
                      value: consumable.consumableId,
                    ),
                    DefaultRichText(
                      label: 'Product ID',
                      value: consumable.consumableId,
                    ),
                    verticalSpace(2),
                    DefaultRichText(
                        label: 'Category', value: consumable.category),
                    verticalSpace(2),
                    DefaultRichText(
                        label: 'Subcategory', value: consumable.subcategory),
                    DefaultRichText(label: 'Model'.tr, value: consumable.model),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Brand'.tr,
                      value: consumable.brand,
                    ),
                  ],
                ),
              ),
              horizontalSpace(50),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(2),
                    DefaultRichText(
                        label: 'Expected Lifetime',
                        value: DateTimeHelper.formatDate(
                          consumable.expirationDate!,
                        )),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Unit Of Measurement'.tr,
                      value: consumable.unitOfMeasurement.getName ?? '',
                    ),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Unit Of Frequency'.tr,
                      value: consumable.maintenanceFrequency ?? '',
                    ),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Reorder Quantity'.tr,
                      value: consumable.reorderQuantity.toString(),
                    ),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Reorder Level'.tr,
                      value: consumable.reorderLevel.toString(),
                    ),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Unit Cost'.tr,
                      value: consumable.unitCost,
                    ),
                  ],
                ),
              ),
              DefaultRichText(
                label: 'Status',
                value: consumable.status,
                labelStyle: AppTextStyles.font14SecondaryBlackCairoMedium
                    .copyWith(color: AppColors.secondaryBlack),
                style: AppTextStyles.font14SecondaryBlackCairoMedium.copyWith(
                  color: consumable.status.getColor,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.download,
                    width: 16,
                    height: 16,
                    color: Colors.blue,
                  ),
                  Text(
                    'Download As PNG',
                    style:
                        AppTextStyles.font14SecondaryBlackCairoRegular.copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue,
                      color: AppColors.blue,
                    ),
                  ),
                ],
              ),
              Spacer(),
              DefaultRichText(
                label: 'Supplier Name',
                value: consumable.supplier.supplierName,
                style: AppTextStyles.font12BlackMediumCairo.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
