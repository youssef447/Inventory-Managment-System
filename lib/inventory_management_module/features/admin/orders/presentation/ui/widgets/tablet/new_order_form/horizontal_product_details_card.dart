part of '../../../pages/tablet/tablet_new_order_form_page.dart';

class HorizontalProductDetailsCard extends StatelessWidget {
  final ProductEntity product;

  const HorizontalProductDetailsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final bool isConsumable = product.productType == ProductType.consumable;
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Container(
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
                        isConsumable
                            ? product.consumablesEntity!.name
                            : product.assetEntity!.assetName,
                        style: AppTextStyles.font16BlackCairoRegular,
                      ),
                    ],
                  ),
                  horizontalSpace(6),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultRichText(
                          label: 'Product ID',
                          value: product.id,
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Product Type',
                          value: product.productType.getName,
                        ),
                        DefaultRichText(
                          label: 'Supplier Name',
                          value: product.supplier.supplierName,
                          style: AppTextStyles.font12BlackMediumCairo.copyWith(
                            decoration: TextDecoration.underline,
                            color: AppColors.blue,
                          ),
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Category',
                          value: isConsumable
                              ? product.consumablesEntity!.category
                              : product.assetEntity!.category,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultRichText(
                          label: 'Subcategory',
                          value: isConsumable
                              ? product.consumablesEntity!.subcategory
                              : product.assetEntity!.subcategory,
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Model',
                          value: isConsumable
                              ? product.consumablesEntity!.model
                              : product.assetEntity!.model,
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Brand',
                          value: isConsumable
                              ? product.consumablesEntity!.brand
                              : product.assetEntity!.brand,
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Expected Lifetime',
                          value: DateTimeHelper.formatDate(
                              product.expectedLifeTime),
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Unit Cost',
                          value: DateTimeHelper.formatDouble(product.unitCost),
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Total Quantity',
                          value:
                              DateTimeHelper.formatInt(product.totalQuantity),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DefaultRichText(
                          label: 'Storage Requirement',
                          value: product.storageRequirement,
                        ),
                        verticalSpace(2),
                        DefaultRichText(
                          label: 'Currency',
                          value: product.currency,
                        ),
                        if (isConsumable) ...[
                          verticalSpace(2),
                          DefaultRichText(
                            label: 'Unit Of Measurement',
                            value: product.consumablesEntity!.unitOfMeasurement,
                          ),
                          verticalSpace(2),
                          DefaultRichText(
                            label: 'Reorder Level',
                            value: DateTimeHelper.formatInt(
                                product.consumablesEntity!.reorderLevel),
                          ),
                          verticalSpace(2),
                          DefaultRichText(
                            label: 'Reorder Quantity',
                            value: DateTimeHelper.formatInt(
                                product.consumablesEntity!.reorderQuantity),
                          ),
                          verticalSpace(2),
                          DefaultRichText(
                            label: 'Expiration Date',
                            value: DateTimeHelper.formatDate(
                              product.consumablesEntity!.expirationDate ??
                                  DateTime.now(),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: DefaultRichText(
                        label: 'Status',
                        value: product.stockStatus.getName,
                        labelStyle: AppTextStyles.font10BlackCairoMedium
                            .copyWith(color: AppColors.secondaryBlack),
                        style: AppTextStyles.font10BlackCairoMedium.copyWith(
                          color: product.stockStatus.getColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              DefaultRichText(
                label: 'Supplier Name',
                value: product.supplier.supplierName,
                style: AppTextStyles.font12BlackMediumCairo.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
        PositionedDirectional(
          end: 16.w,
          bottom: 16.h,
          child: Column(
            children: [
              Image.asset(AppAssets.qr, width: 70.w, height: 70.h),
              verticalSpace(8),
              Row(
                children: [
                  SvgPicture.asset(AppAssets.system, color: AppColors.blue),
                  horizontalSpace(4),
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
        )
      ],
    );
  }
}
