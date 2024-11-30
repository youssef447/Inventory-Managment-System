// Date: 7/11/2024
// By:Mohamed Ashraf
// This widget displays a table of assets items using data from AssetsController in tablet and windows view

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

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
import '../../constants/admin_assets_columns_name.dart';

class TabletAdminAssetsPage extends StatelessWidget {
  const TabletAdminAssetsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
        id: ProductsIds.productsTab,
        builder: (controller) {
          return controller.loading
              ? const Expanded(child: AppCircleProgress())
              : controller.assets.isEmpty
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
                          controller.assets.length,
                          (index) => DataRow(
                            onSelectChanged: (value) {
                              if (value ?? false) {
                                HapticFeedbackHelper.triggerHapticFeedback(
                                  vibration: VibrateType.mediumImpact,
                                  hapticFeedback: HapticFeedback.mediumImpact,
                                );
                                context.navigateTo(
                                  Routes.adminAssetDetails,
                                    arguments: {
                                      RouteArguments.asset: controller.assets[index],
                                    }
                                );
                              }
                            },

                            color: WidgetStatePropertyAll(
                              index % 2 == 0
                                  ? AppColors.evenRowColor
                                  : AppColors.oddRowColor,
                            ),
                            cells: [
                              DataCell(
                                Text(
                                  controller.assets[index].assetId,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].brand +
                                      controller.assets[index].model,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].supplierId,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].supplierName,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].storageLocation,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].quantityOnHand
                                      .toString(),
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].unitCost,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                  controller.assets[index].currency,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].category,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].subcategory,
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].model,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  controller.assets[index].brand,
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
