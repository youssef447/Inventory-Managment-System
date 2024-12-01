part of '../../../pages/mobile/mobile_new_order_page.dart';

class MobileProductCard extends StatelessWidget {
  final ProductEntity product;
  final bool checked;
  final void Function(bool?)? onCheckBoxChanged;
  const MobileProductCard(
      {super.key,
      required this.product,
      required this.checked,
      required this.onCheckBoxChanged});

  @override
  Widget build(BuildContext context) {
    final isConsumable = product.productType == ProductType.consumable;
    return Container(
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
                              child: Checkbox(
                                value: checked,
                                activeColor: AppColors.primary,
                                checkColor: AppColors.white,
                                materialTapTargetSize:
                                    MaterialTapTargetSize.padded,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                overlayColor: WidgetStateProperty.all(
                                  Colors.transparent,
                                ),
                                visualDensity: const VisualDensity(
                                  horizontal: -4,
                                  vertical: -4,
                                ),
                                side: BorderSide(
                                  color: AppColors.fieldBorder,
                                ),
                                onChanged: onCheckBoxChanged,
                              )),
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
    );
  }
}
