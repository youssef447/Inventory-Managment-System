// Date: 7/11/2024
// By:Mohamed Ashraf
// This widget displays a table of assets items using data from AssetsController in tablet and windows view

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/widgets/table/default_data_table.dart';
import '../../../../../../employee/Assets/presentation/controller/assets_controller.dart';
import '../../../controller/admin_assets_controller.dart';
import '../../constants/admin_assets_columns_name.dart';
import '../../constants/assets_id_constant.dart';

class TabletAdminAssetsPage extends StatelessWidget {
  const TabletAdminAssetsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AssetsController>(
        id: AssetsAdminIdConstant.assetsData,
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
                                  controller.assetsList[index].brand +
                                      controller.assetsList[index].model,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].supplierId,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].supplierName,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].storageLocation,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].quantityOnHand.toString(),
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].unitCost,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                      controller.assetsList[index].currency,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].category,
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
                                  controller.assetsList[index].subcategory,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].model,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assetsList[index].brand,
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
