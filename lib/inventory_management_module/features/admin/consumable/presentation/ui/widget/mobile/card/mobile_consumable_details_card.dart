import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../features/employee/consumables/domain/entity/consumables_entity.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';

class MobileConsumableDetailsCard extends StatelessWidget {
  final ConsumablesEntity consumable;

  const MobileConsumableDetailsCard({super.key, required this.consumable});

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
              horizontalSpace(6),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    consumable.model + consumable.brand,
                    style: AppTextStyles.font16BlackCairoRegular,
                  ),
                  DefaultRichText(
                    label: 'Status',
                    value: consumable.status,
                    labelStyle: AppTextStyles.font14SecondaryBlackCairoMedium
                        .copyWith(color: AppColors.secondaryBlack),
                    style:
                        AppTextStyles.font14SecondaryBlackCairoMedium.copyWith(
                      color: consumable.status.getColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(8),
          DefaultRichText(
            label: 'Consumable ID',
            value: consumable.consumableId,
          ),
          DefaultRichText(
            label: 'Product ID',
            value: consumable.consumableId,
          ),
          verticalSpace(2),
          DefaultRichText(label: 'Category'.tr, value: consumable.category),
          verticalSpace(2),
          DefaultRichText(
              label: 'Subcategory'.tr, value: consumable.subcategory),
          horizontalSpace(50),
          DefaultRichText(label: 'Model'.tr, value: consumable.model),
          verticalSpace(2),
          DefaultRichText(
            label: 'Brand'.tr,
            value: consumable.brand,
          ),
          verticalSpace(2),
          DefaultRichText(
            label: 'Maintenance Frequency'.tr,
            value: consumable.maintenanceFrequency ?? '',
          ),
          DefaultRichText(
            label: 'Expected Date'.tr,
            value: consumable.expectedLifeTime != null
                ? DateTimeHelper.formatDate(
                    consumable.expectedLifeTime!,
                  )
                : 'Not Applicable'.tr,
          ),
          verticalSpace(2),
          DefaultRichText(
            label: 'Expected Lifetime'.tr,
            value: consumable.expectedLifeTime != null
                ? DateTimeHelper.formatDate(
                    consumable.expectedLifeTime!,
                  )
                : 'Not Applicable'.tr,
          ),
          DefaultRichText(
            label: 'Unit Of Measurement',
            value: consumable.maintenanceFrequency ?? '',
          ),
          verticalSpace(2),
          DefaultRichText(
            label: 'Unit Cost',
            value: consumable.unitCost,
          ),
          verticalSpace(8),
          DefaultRichText(
            label: 'Supplier Name',
            value: consumable.supplier.supplierName,
            style: AppTextStyles.font12BlackMediumCairo.copyWith(
              decoration: TextDecoration.underline,
              color: AppColors.blue,
            ),
          ),
          verticalSpace(8),
          Align(
            alignment: AlignmentDirectional.bottomEnd,
            child: Image.asset(
              AppAssets.qr,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
            ],
          ),
        ],
      ),
    );
  }
}
