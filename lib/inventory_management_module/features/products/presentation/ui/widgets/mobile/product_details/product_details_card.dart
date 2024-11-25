part of '../../../pages/mobile/mobile_product_details_page.dart';

class MobileProductDetailsCard extends StatelessWidget {
  final ProductEntity product;

  const MobileProductDetailsCard({super.key, required this.product});

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
              Image.asset(
                AppAssets.image,
                width: 80.w,
                height: 80.h,
              ),
              horizontalSpace(4),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          isConsumable
                              ? product.consumablesEntity!.name
                              : product.assetEntity!.assetName,
                          style: AppTextStyles.font16BlackCairoRegular,
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: DefaultRichText(
                              label: 'Status',
                              value: product.stockStatus.getName,
                              labelStyle: AppTextStyles.font10BlackCairoMedium
                                  .copyWith(color: AppColors.secondaryBlack),
                              style:
                                  AppTextStyles.font10BlackCairoMedium.copyWith(
                                color: product.stockStatus.getColor,
                              ),
                            ),
                          ),
                        ),
                      ])
                    ]),
              ),
            ],
          ),
          verticalSpace(9),
          DefaultRichText(
            label: 'Product ID',
            value: product.id,
          ),
          verticalSpace(2),
          DefaultRichText(
            label: 'Product Type',
            value: product.productType.getName,
          ),
          verticalSpace(2),
          DefaultRichText(
            label: 'Category',
            value: isConsumable
                ? product.consumablesEntity!.category
                : product.assetEntity!.category,
          ),
          verticalSpace(2),
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
            value: DateTimeHelper.formatDate(product.expectedLifeTime),
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
