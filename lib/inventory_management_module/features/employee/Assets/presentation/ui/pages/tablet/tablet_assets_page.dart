// Date: 7/11/2024
// By:Mohamed Ashraf
// This widget displays a table of assets items using data from AssetsController in tablet and windows view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/widgets/table/default_data_table.dart';
import '../../../controller/assets_controller.dart';
import '../../constants/assets_columns_name.dart';
import '../../constants/assets_id_constant.dart';

class TabletAssetsPage extends StatelessWidget {
  const TabletAssetsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetsController>(
        id: AssetsIdConstant.assetsData,
        builder: (controller) {
          return controller.loading
              ? const Expanded(child: AppCircleProgress())
              : controller.assetsList.isEmpty
                  ? const Expanded(child: NoDataGif())
                  : Expanded(
                      child: DefaultDataTable(
                        columns: AssetsColumnsName.tableColumnsName
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
                          controller.assetsList.length,
                          (index) => DataRow(
                            color: WidgetStatePropertyAll(
                              index % 2 == 0
                                  ? AppColors.evenRowColor
                                  : AppColors.oddRowColor,
                            ),
                            cells: [
                              DataCell(
                                Text(
                                  controller.assetsList[index].assetId,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].status.tr,
                                  style: AppTextStyles.font16BlackRegularCairo
                                      .copyWith(
                                          color: controller.assetsList[index]
                                              .status.getColor),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].brand +
                                      controller.assetsList[index].model,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].category,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].subcategory,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].model,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].brand,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                  DateTimeHelper.formatDate(
                                    controller.assetsList[index].dateReceived,
                                  ),
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].dateReturn !=
                                          null
                                      ? DateTimeHelper.formatDate(
                                          controller
                                              .assetsList[index].dateReturn!,
                                        )
                                      : 'Not Applicable'.tr,
                                  style: controller
                                              .assetsList[index].dateReturn !=
                                          null
                                      ? AppTextStyles.font16BlackRegularCairo
                                      : AppTextStyles
                                          .font16DarkGreyRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].quantity,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index]
                                              .maintenanceFrequency !=
                                          null
                                      ? controller.assetsList[index]
                                          .maintenanceFrequency!.tr
                                      : 'Not Applicable'.tr,
                                  style: controller.assetsList[index]
                                              .maintenanceFrequency !=
                                          null
                                      ? AppTextStyles.font16BlackRegularCairo
                                      : AppTextStyles
                                          .font16DarkGreyRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index]
                                              .nextMaintenanceSchedule !=
                                          null
                                      ? DateTimeHelper.formatDate(
                                          controller.assetsList[index]
                                              .nextMaintenanceSchedule!,
                                        )
                                      : 'Not Applicable'.tr,
                                  style: controller.assetsList[index]
                                              .nextMaintenanceSchedule !=
                                          null
                                      ? AppTextStyles.font16BlackRegularCairo
                                      : AppTextStyles
                                          .font16DarkGreyRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index]
                                              .expectedLifeTime !=
                                          null
                                      ? DateTimeHelper.formatDate(
                                          controller.assetsList[index]
                                              .expectedLifeTime!,
                                        )
                                      : 'Not Applicable'.tr,
                                  style: controller.assetsList[index]
                                              .expectedLifeTime !=
                                          null
                                      ? AppTextStyles.font16BlackRegularCairo
                                      : AppTextStyles
                                          .font16DarkGreyRegularCairo,
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
