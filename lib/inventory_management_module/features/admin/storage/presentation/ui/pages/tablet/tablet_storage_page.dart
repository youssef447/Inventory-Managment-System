import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/widgets/table/default_data_table.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../constants/storage_ids.dart';
import '../../../controller/storage_controller.dart';
import '../../../controller/storage_form_controller.dart';

//Youssef Ashraf
///Default Storage Table Tab in Tablet View
class TabletStoragePage extends StatelessWidget {
  const TabletStoragePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StorageController>(
      id: StorageIds.storagePage,
      builder: (controller) {
        return controller.loading
            ? const Expanded(child: AppCircleProgress())
            : controller.storages.isEmpty
                ? const Expanded(child: NoDataGif())
                : Expanded(
                    child: DefaultDataTable(
                    columns: controller.storageHeaders
                        .map(
                          (element) => DataColumn(
                            label: Text(
                              element..tr,
                              style: AppTextStyles.font16WhiteRegularCairo,
                            ),
                          ),
                        )
                        .toList(),
                    rows: List.generate(
                      controller.storages.length,
                      (index) {
                        return DataRow(
                          onSelectChanged: (value) {
                            if (value ?? false) {
                              Get.lazyPut(
                                () => StorageFormController()
                                  ..setStorageData(controller.storages[index])
                                  ..isEditable = false,
                              );

                              context.navigateTo(
                                Routes.storageForm,
                                arguments: {
                                  RouteArguments.storage:
                                      controller.storages[index]
                                },
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
                                controller.storages[index].locationID,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].locationName,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].locationType,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].country,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].stateOrProvince,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].city,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].postalCode,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                DateTimeHelper.formatInt(
                                    controller.storages[index].storageCapacity),
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].conditionOfStorage,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].envControlType,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].products.first
                                            .productType ==
                                        ProductType.consumable
                                    ? controller.storages[index].products.first
                                        .consumablesEntity!.name
                                    : controller.storages[index].products.first
                                        .assetEntity!.assetName,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].accessLevel,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.storages[index].equipmentAvailable,
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
