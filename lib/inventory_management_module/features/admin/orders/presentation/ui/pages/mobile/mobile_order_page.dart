import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';

import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';

import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../constants/order_ids.dart';
import '../../../../domain/order_entity.dart';
import '../../../controller/orders_controller.dart';
part '../../widgets/mobile/order_page/order_card.dart';

//Youssef Ashraf
/// Default Orders Tab in Mobile View
class MobileOrderPage extends StatelessWidget {
  const MobileOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
        id: OrderIds.ordersPage,
        builder: (controller) {
          return controller.loading
              ? const SliverFillRemaining(
                  child: AppCircleProgress(),
                )
              : controller.orders.isEmpty
                  ? const SliverFillRemaining(
                      child: NoDataGif(),
                    )
                  : SliverPadding(
                      padding: EdgeInsets.only(
                        bottom: 12.h,
                      ),
                      sliver: SliverList.separated(
                        separatorBuilder: (_, __) => verticalSpace(16),
                        itemBuilder: (context, index) {
                          return MobileOrderCard(
                            order: controller.orders[index],
                          );
                        },
                        itemCount: controller.orders.length,
                      ),
                    );
        });
  }
}
