import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../features/employee/Assets/domain/entity/assets_entity.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';

class HorizontalAssetsDetailsCard extends StatelessWidget {
  final AssetsEntity assets;

  const HorizontalAssetsDetailsCard({super.key, required this.assets});

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
                    assets.model + assets.brand,
                    style: AppTextStyles.font16BlackCairoRegular,
                  ),
                ],
              ),
              horizontalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(
                    label: 'Asset ID'.tr,
                    value: assets.assetId,
                  ),
                  DefaultRichText(
                    label: 'Product ID'.tr,
                    value: assets.assetId,
                  ),
                  verticalSpace(2),
                  DefaultRichText(label: 'Category'.tr, value: assets.category),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(label: 'Model'.tr, value: assets.model),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Brand',
                    value: assets.brand,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                      label: 'Subcategory'.tr, value: assets.subcategory),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expected Date'.tr,
                    value: assets.expectedLifeTime != null
                        ? DateTimeHelper.formatDate(
                            assets.expectedLifeTime!,
                          )
                        : 'Not Applicable'.tr,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Expected Lifetime'.tr,
                    value: assets.expectedLifeTime != null
                        ? DateTimeHelper.formatDate(
                            assets.expectedLifeTime!,
                          )
                        : 'Not Applicable'.tr,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Unit Of Measurement'.tr,
                    value: assets.maintenanceFrequency ?? '',
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Unit Cost'.tr,
                    value: assets.unitCost,
                  ),
                  verticalSpace(2),
                  DefaultRichText(
                    label: 'Storage Requirement'.tr,
                    value: assets.storageRequirement,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DefaultRichText(
                    label: 'Status'.tr,
                    value: assets.status,
                    labelStyle: AppTextStyles.font14SecondaryBlackCairoMedium
                        .copyWith(color: AppColors.secondaryBlack),
                    style:
                        AppTextStyles.font14SecondaryBlackCairoMedium.copyWith(
                      color: assets.status.getColor,
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
                        'Download As PNG'.tr,
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
            label: 'Supplier Name'.tr,
            value: assets.supplier.supplierName,
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
