part of '../../../pages/mobile/mobile_new_order_form_page.dart';

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
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  AppAssets.pphone,
                  width: 65.w,
                  height: 65.h,
                  fit: BoxFit.cover,
                ),
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
                  ],
                ),
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
          verticalSpace(2),
          DefaultRichText(
            label: 'Unit Cost',
            value: DateTimeHelper.formatDouble(product.unitCost),
          ),
          if (isConsumable)
            Padding(
              padding: EdgeInsets.all(2.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                            DateTime.now()),
                  ),
                ],
              ),
            ),
          verticalSpace(10),
          Row(
            children: [
              const Spacer(),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Image.asset(
                  AppAssets.qr,
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppAssets.system, color: AppColors.blue),
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
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
