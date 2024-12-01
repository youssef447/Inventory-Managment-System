import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/enums/requests_enums.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/features/employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
// by :mohamed ashraf
class HorizontalConsumableDetailsCard extends StatelessWidget {
  final ConsumablesEntity consumable;

  const HorizontalConsumableDetailsCard({super.key, required this.consumable});

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                ],
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(
                    label: 'Consumable ID'.tr,
                    value: consumable.consumableId,
                  ),
                  DefaultRichText(
                    label: 'Product ID'.tr,
                    value: consumable.consumableId,
                  ),
                  verticalSpace(2),
                  DefaultRichText(label: 'Category'.tr, value: consumable.category),
                  verticalSpace(2),
                  DefaultRichText(
                      label: 'Subcategory'.tr, value: consumable.subcategory),
                ],
              ),
             const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(label: 'Model'.tr, value: consumable.model),
                  DefaultRichText(
                    label: 'Brand'.tr,
                    value: consumable.brand,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expected Date'.tr,
                    value: consumable.expirationDate != null
                        ? DateTimeHelper.formatDate(
                            consumable.expirationDate!,
                          )
                        : 'Not Applicable'.tr,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expected Lifetime',
                    value: DateTimeHelper.formatDate(consumable.expirationDate!,)
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
             const Spacer(),
              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
              DefaultRichText(
                label: 'Status',
                value: consumable.status,
                labelStyle: AppTextStyles.font14SecondaryBlackCairoMedium
                    .copyWith(color: AppColors.secondaryBlack),
                style: AppTextStyles.font14SecondaryBlackCairoMedium.copyWith(
                  color: consumable.status.getColor,
                ),
              ),
              verticalSpace(4),
              Image.asset(
                AppAssets.qr,
              ),
              verticalSpace(8),
              Row(
                children: [
                  SvgPicture.asset(
                    AppAssets.download,
                    width: 16,
                    height: 16,
                    color: Colors.blue,
                  ),
                  horizontalSpace(4),
                  Text(
                    'Download As PNG',
                    style: AppTextStyles.font14SecondaryBlackCairoRegular
                        .copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue,
                      color: AppColors.blue,
                    ),
                  ),
                ],
              )
                              ],
                            )
            ],
          ),
          verticalSpace(2),
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
    );
  }
}
