import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/widgets/table/default_data_table.dart';
import '../../../../constants/order_ids.dart';
import '../../../controller/orders_controller.dart';

class TabletOrderPage extends StatelessWidget {
  const TabletOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersController>(
      id: OrderIds.ordersPage,
      builder: (controller) {
        return controller.loading
            ? const Expanded(child: AppCircleProgress())
            : controller.orders.isEmpty
                ? const Expanded(child: NoDataGif())
                : Expanded(
                    child: const SizedBox(),
                  );
      },
    );
  }
}
