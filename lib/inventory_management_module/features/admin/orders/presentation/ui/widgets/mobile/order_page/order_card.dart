part of '../../../pages/mobile/mobile_order_page.dart';

//Youssef Ashraf
/// Default Order Card in Mobile View when user is in Orders Tab
class MobileOrderCard extends StatelessWidget {
  final OrderEntity order;
  const MobileOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final bool isConsumable =
        order.productEntity.productType == ProductType.consumable;
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultRichText(
                            label: 'Order ID',
                            value: order.orderId,
                          ),
                          DefaultRichText(
                            label: 'Order Date',
                            value: DateTimeHelper.formatDate(order.orderDate),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: DefaultRichText(
                            label: 'Quantity',
                            value: DateTimeHelper.formatInt(order.quantity),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            DefaultRichText(
              label: 'Product Name',
              value: isConsumable
                  ? order.productEntity.consumablesEntity!.name
                  : order.productEntity.assetEntity!.assetName,
            ),
            DefaultRichText(
              label: 'Expected Delivery',
              value: DateTimeHelper.formatDate(order.expectedRecieved),
            ),
          ],
        ),
      ),
    );
  }
}
