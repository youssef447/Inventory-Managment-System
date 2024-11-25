part of '../../../pages/tablet/tablet_products_tab_page.dart';

class TabletProductCard extends StatelessWidget {
  final ProductEntity product;
  final bool isConsumable;
  const TabletProductCard(
      {super.key, required this.product, required this.isConsumable});

  @override
  Widget build(BuildContext context) {
    return SizeAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 5.h,
        ),
        decoration: BoxDecoration(color: AppColors.card),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  AppAssets.image,
                  width: 65.w,
                  height: 65.h,
                  fit: BoxFit.cover,
                ),
                horizontalSpace(4),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultRichText(
                            label: 'Product ID',
                            value: product.id,
                          ),
                          DefaultRichText(
                            label: 'Product Type',
                            value: product.productType.getName,
                          ),
                          DefaultRichText(
                            label: 'Supplier',
                            value: product.supplier.supplierName,
                            style:
                                AppTextStyles.font12BlackMediumCairo.copyWith(
                              decoration: TextDecoration.underline,
                              color: AppColors.blue,
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: DefaultRichText(
                            label: 'Status',
                            labelStyle:
                                AppTextStyles.font10SecondaryBlackCairoMedium,
                            value: product.stockStatus.getName,
                            style:
                                AppTextStyles.font10BlackCairoMedium.copyWith(
                              color: product.stockStatus.getColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Text(
              isConsumable
                  ? product.consumablesEntity!.name
                  : product.assetEntity!.assetName,
              style: AppTextStyles.font16BlackCairoRegular,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: DefaultRichText(
                label: 'Last Update',
                labelStyle: AppTextStyles.font10SecondaryBlackCairoMedium,
                value: DateTimeHelper.formatDate(
                  product.lastUpdate,
                ),
                style: AppTextStyles.font10BlackCairoMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
