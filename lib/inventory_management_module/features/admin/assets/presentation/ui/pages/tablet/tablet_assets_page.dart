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
import '../../../../../../products/presentation/controller/products_controller.dart';
import '../../../controller/admin_assets_controller.dart';
import '../../constants/admin_assets_columns_name.dart';
import '../../constants/assets_id_constant.dart';

class TabletAdminAssetsPage extends StatelessWidget {
  const TabletAdminAssetsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
       // id: AssetsAdminIdConstant.assetsData,
        builder: (controller) {
          return controller.loading
              ? const Expanded(child: AppCircleProgress())
              : controller.products.isEmpty
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
                          controller.products.length,
                          (index) => DataRow(
                            color: WidgetStatePropertyAll(
                              index % 2 == 0
                                  ? AppColors.evenRowColor
                                  : AppColors.oddRowColor,
                            ),
                            cells: [
                              DataCell(
                                Text(
                                  controller.products[index].assetEntity!.assetId[index],
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                               'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Center(
                                    child: Text(
                                      'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                              ),
                              const DataCell(
                                Text(
                                  'dd',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              DataCell(
                                Text(
                                  'dd',
                                  style: AppTextStyles.font16BlackRegularCairo,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const DataCell(
                                Text(
                                  'dd',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const DataCell(
                                Text(
                                  'dd',
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
