// Date: 7/11/2024
// By:Mohamed Ashraf
// This widget displays a table of consumables items using data from AssetsController in tablet and windows view

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/widgets/table/default_data_table.dart';
import '../../../../../../products/constants/ids.dart';
import '../../../../../../products/presentation/controller/products_controller.dart';
import '../../constants/admin_consumable_columns_name.dart';

class TabletConsumablePage extends StatelessWidget {
  const TabletConsumablePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        id: ProductsIds.productsTab,
        builder: (controller) {
          return controller.loading
              ? const Expanded(child: AppCircleProgress())
              : controller.consumables.isEmpty
                  ? const Expanded(child: NoDataGif())
                  : Expanded(
                      child: DefaultDataTable(
                        columns: AdminConsumableColumnsName.tableColumnsName
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
                          controller.consumables.length,
                          (index) => DataRow(
                            color: WidgetStatePropertyAll(
                              index % 2 == 0
                                  ? AppColors.evenRowColor
                                  : AppColors.oddRowColor,
                            ),
                            onSelectChanged: (value) {
                              if (value ?? false) {
                                HapticFeedbackHelper.triggerHapticFeedback(
                                  vibration: VibrateType.mediumImpact,
                                  hapticFeedback: HapticFeedback.mediumImpact,
                                );
                                context.navigateTo(
                                    Routes.adminConsumablesDetails,
                                    arguments: {
                                      RouteArguments.consumables:
                                          controller.consumables[index],
                                    });
                              }
                            },
                            cells: [
                              DataCell(
                                Text(
                                  controller.consumables[index].consumableId,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].brand +
                                      controller.consumables[index].model,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].supplierId,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].supplierName,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].storageLocation,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].quantityOnHand
                                      .toString(),
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].category,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].subcategory,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].model,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].brand,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index]
                                      .unitOfMeasurement.getName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].reorderLevel
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.consumables[index].reorderQuantity
                                      .toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ).toList(),
                      ),
                    );
        });
  }
}
