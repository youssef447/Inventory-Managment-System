import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../products/domain/product_entity.dart';

import '../../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../products/enums/product_enums.dart';

class EmployeeProductCard extends StatelessWidget {
  final ProductEntity productEntity;
  const EmployeeProductCard({super.key, required this.productEntity});

  @override
  Widget build(BuildContext context) {
    final bool isConsumable =
        productEntity.productType == ProductType.consumable;
    return SizeAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(color: AppColors.card),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: Image.asset(
                    AppAssets.pphone,
                    width: 45.w,
                    height: 65.h,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              isConsumable
                                  ? productEntity.consumablesEntity!.name
                                  : productEntity.assetEntity!.assetName,
                              style: AppTextStyles.font16BlackCairoRegular,
                            ),
                          ),
                          const Spacer(),
                          DefaultRichText(
                            label: 'Status',
                            labelStyle:
                                AppTextStyles.font10SecondaryBlackCairoMedium,
                            value: productEntity.status,
                            style:
                                AppTextStyles.font10BlackCairoMedium.copyWith(
                              color: productEntity.status.getColor,
                            ),
                          ),
                        ],
                      ),
                      DefaultRichText(
                        label: 'Category',
                        value: isConsumable
                            ? productEntity.consumablesEntity!.category
                            : productEntity.assetEntity!.category,
                      ),
                      DefaultRichText(
                        label: 'Subcategory',
                        value: isConsumable
                            ? productEntity.consumablesEntity!.subcategory
                            : productEntity.assetEntity!.subcategory,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Spacer(),
                DefaultRichText(
                  label: 'Last Update',
                  labelStyle: AppTextStyles.font10SecondaryBlackCairoMedium,
                  value: DateTimeHelper.formatDate(
                    productEntity.lastUpdate,
                  ),
                  style: AppTextStyles.font10BlackCairoMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
