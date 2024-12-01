part of '../../../pages/tablet/tablet_product_details_page.dart';

class HorizontalProductDetailsCard extends StatelessWidget {
  final ProductEntity product;

  const HorizontalProductDetailsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final bool isConsumable = product.productType == ProductType.consumable;
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
                    isConsumable
                        ? product.consumablesEntity!.name
                        : product.assetEntity!.assetName,
                    style: AppTextStyles.font16BlackCairoRegular,
                  ),
                  DefaultRichText(
                    label: 'Status',
                    value: product.stockStatus.getName,
                    labelStyle: AppTextStyles.font10BlackCairoMedium
                        .copyWith(color: AppColors.secondaryBlack),
                    style: AppTextStyles.font10BlackCairoMedium.copyWith(
                      color: product.stockStatus.getColor,
                    ),
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
                      value:
                          DateTimeHelper.formatDate(product.expectedLifeTime),
                    ),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Unit Cost',
                      value: DateTimeHelper.formatDouble(product.unitCost),
                    ),
                    verticalSpace(2),
                    DefaultRichText(
                      label: 'Total Quantity',
                      value: DateTimeHelper.formatInt(product.totalQuantity),
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
                        value: product.consumablesEntity!.unitOfMeasurement.getName,
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
            ],
          ),
          verticalSpace(2),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 10.h,
            children: [
              Text(
                'Storage Location And Quantity: '.tr,
                style: AppTextStyles.font12SecondaryBlackCairoMedium,
              ),
              ...List.generate(
                product.storage.length,
                (index) => Container(
                  margin: EdgeInsetsDirectional.only(
                      end: index == product.storage.length - 1 ? 0 : 10.w),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                    vertical: 3.h,
                  ),
                  child: Text(
                    '${product.storage[index].locationName} | ${DateTimeHelper.formatInt(product.storage[index].quantity)}',
                    style: AppTextStyles.font14BlackCairoMedium,
                  ),
                ),
              ),
            ],
          ),
          verticalSpace(22),
          DefaultRichText(
            label: 'Additional Info',
            value: product.additionalNotes ?? 'N/A',
            fullText: true,
          ),
        ],
      ),
    );
  }
}
