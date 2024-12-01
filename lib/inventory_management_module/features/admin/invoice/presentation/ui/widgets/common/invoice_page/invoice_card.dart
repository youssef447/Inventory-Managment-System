import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/animations/scale_animation.dart';
import '../../../../../../../../core/enums/orders_status.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../products/enums/product_enums.dart';
import '../../../../../../orders/domain/order_entity.dart';

///Youssef Ashraf
///Represents The Invoice Card in Tablet - Mobile Views
class InvoiceCard extends StatelessWidget {
  final OrderEntity invoice;
  const InvoiceCard({super.key, required this.invoice});

  @override
  Widget build(BuildContext context) {
    final isConsumable =
        invoice.productEntity[0].productType == ProductType.consumable;
    return ScaleAnimation(
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
                          DefaultRichText(
                            label: 'Order ID',
                            value: invoice.orderId,
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional.centerEnd,
                              child: DefaultRichText(
                                label: 'Status',
                                value: invoice.orderStatus.getName,
                                valueColor: invoice.orderStatus.getColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      DefaultRichText(
                        label: 'Product Name',
                        value: isConsumable
                            ? invoice.productEntity[0].consumablesEntity!.name
                            : invoice.productEntity[0].assetEntity!.assetName,
                      ),
                      DefaultRichText(
                        label: 'Product Type',
                        value: invoice.productEntity[0].productType.getName,
                      ),
                    ],
                  ),
                )
              ],
            ),
            DefaultRichText(
              label: 'Supplier Name',
              value: invoice.productEntity[0].supplier.supplierName,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultRichText(
                  label: 'Order Date',
                  value: DateTimeHelper.formatDate(invoice.orderDate),
                ),
                DefaultRichText(
                  label: 'Recieving Date',
                  value: DateTimeHelper.formatDate(invoice.expectedRecieved),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
