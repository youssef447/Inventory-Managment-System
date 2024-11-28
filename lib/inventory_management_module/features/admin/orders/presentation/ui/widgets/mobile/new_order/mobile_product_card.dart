part of '../../../pages/mobile/mobile_new_order_page.dart';

class MobileProductCard extends StatelessWidget {
  final ProductEntity product;
  final bool isConsumable;
  const MobileProductCard(
      {super.key, required this.product, required this.isConsumable});

  @override
  Widget build(BuildContext context) {
    return SizeAnimation(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 8.h,
        ),
        decoration: BoxDecoration(color: AppColors.card),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                      Row(
                        children: [
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
                                valueColor: product.stockStatus.getColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      DefaultRichText(
                        label: 'Category',
                        value: isConsumable
                            ? product.consumablesEntity!.category
                            : product.assetEntity!.category,
                      ),
                      DefaultRichText(
                        label: 'Subcategory',
                        value: isConsumable
                            ? product.consumablesEntity!.subcategory
                            : product.assetEntity!.subcategory,
                      ),
                      verticalSpace(3),
                    ],
                  ),
                )
              ],
            ),
            DefaultRichText(
              label: 'Quantity In Stock',
              value: DateTimeHelper.formatInt(product.totalQuantity),
            ),
            DefaultRichText(
              label: 'Supplier Name',
              value: product.supplier.supplierName,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: DefaultRichText(
                label: 'Last Update',
                value: DateTimeHelper.formatDate(
                  product.lastUpdate,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
