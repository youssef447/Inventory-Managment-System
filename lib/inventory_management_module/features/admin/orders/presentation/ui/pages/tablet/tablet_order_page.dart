import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/orders_status.dart';

import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/widgets/table/default_data_table.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../constants/order_ids.dart';
import '../../../controller/orders_controller.dart';

//Youssef Ashraf
/// Default Orders Tab in Tablet View
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
                    child: DefaultDataTable(
                    columns: controller.orderHeaders
                        .map(
                          (element) => DataColumn(
                            label: Text(
                              element.tr,
                              style: AppTextStyles.font16WhiteRegularCairo,
                            ),
                          ),
                        )
                        .toList(),
                    rows: List.generate(
                      controller.orders.length,
                      (index) {
                        final isConsumable = controller
                                .orders[index].productEntity[0].productType ==
                            ProductType.consumable;
                        return DataRow(
                          color: WidgetStatePropertyAll(
                            index % 2 == 0
                                ? AppColors.evenRowColor
                                : AppColors.oddRowColor,
                          ),
                          cells: [
                            DataCell(
                              Text(
                                controller.orders[index].orderId,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                DateTimeHelper.formatDate(
                                  controller.orders[index].orderDate,
                                ),
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.orders[index].orderStatus.getName.tr,
                                style: AppTextStyles.font16BlackRegularCairo
                                    .copyWith(
                                  color: controller
                                      .orders[index].orderStatus.getColor,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                DateTimeHelper.formatDate(
                                  controller.orders[index].expectedRecieved,
                                ),
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.orders[index].productEntity[0].id,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                isConsumable
                                    ? controller.orders[index].productEntity[0]
                                        .consumablesEntity!.name
                                    : controller.orders[index].productEntity[0]
                                        .assetEntity!.assetName,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.orders[index].productEntity[0]
                                    .supplier.supplierName,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.orders[index].productEntity[0]
                                    .storage[0].locationName,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                isConsumable
                                    ? controller.orders[index].productEntity[0]
                                        .consumablesEntity!.category
                                    : controller.orders[index].productEntity[0]
                                        .assetEntity!.category,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                isConsumable
                                    ? controller.orders[index].productEntity[0]
                                        .consumablesEntity!.subcategory
                                    : controller.orders[index].productEntity[0]
                                        .assetEntity!.subcategory,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                isConsumable
                                    ? controller.orders[index].productEntity[0]
                                        .consumablesEntity!.brand
                                    : controller.orders[index].productEntity[0]
                                        .assetEntity!.brand,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                isConsumable
                                    ? controller.orders[index].productEntity[0]
                                        .consumablesEntity!.model
                                    : controller.orders[index].productEntity[0]
                                        .assetEntity!.model,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                DateTimeHelper.formatDouble(
                                  controller
                                      .orders[index].productEntity[0].unitCost,
                                ),
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ));
      },
    );
  }
}
