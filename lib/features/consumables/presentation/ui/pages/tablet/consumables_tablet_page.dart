// Date: 7/11/2024
// By:Mohamed Ashraf
// This widget displays a table of consumable items using data from ConsumablesController in tablet and windows view
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/constants/enums.dart';

import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../core/widgets/table/default_data_table.dart';
import '../../../constants/consumables_id_constant.dart';
import '../../../controller/consumables_controller.dart';

class ConsumablesTabletPage extends StatelessWidget {
  const ConsumablesTabletPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GetBuilder<ConsumablesController>(
          init: ConsumablesController(),
          id: ConsumablesIdConstant.consumablesTable,
          builder: (controller) {
            return controller.consumablesList.isEmpty
                ? const NoDataGif()
                : DefaultDataTable(
                    columns: controller.tableColumnsConsumablesName
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
                      controller.consumablesList.length,
                      (index) => DataRow(
                        color: WidgetStatePropertyAll(
                          index % 2 == 0
                              ? AppColors.evenRowColor
                              : AppColors.oddRowColor,
                        ),
                        cells: [
                          DataCell(
                            Text(
                              controller.consumablesList[index].consumableId,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].name,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].category,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].subcategory,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].model,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].brand,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Center(
                                child: Text(
                              DateTimeHelper.formatDate(
                                controller.consumablesList[index].dateReceived,
                              ),
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].quantity,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller
                                  .consumablesList[index].unitOfMeasurement,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].usageFrequency,
                              style: AppTextStyles.font16BlackRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index]
                                          .expirationDate !=
                                      null
                                  ? DateTimeHelper.formatDate(
                                      controller.consumablesList[index]
                                          .expirationDate!,
                                    )
                                  : 'Not Applicable',
                              style: controller.consumablesList[index]
                                          .expirationDate !=
                                      null
                                  ? AppTextStyles.font16BlackRegularCairo
                                  : AppTextStyles.font16DarkGreyRegularCairo,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          DataCell(
                            Text(
                              controller.consumablesList[index].status.getName,
                              style: AppTextStyles.font16BlackRegularCairo
                                  .copyWith(
                                      color: controller.consumablesList[index]
                                          .status.getColor),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ).toList(),
                  );
          }),
    );
  }
}
