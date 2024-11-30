import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/business_type.dart';
import '../../../../../../../core/extensions/extensions.dart';

import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../../core/widgets/table/default_data_table.dart';
import '../../../../../../products/enums/product_enums.dart';
import '../../../../constants/suppliers_ids.dart';
import '../../../controller/supplier_form_controller.dart';
import '../../../controller/suppliers_controller.dart';

//Youssef Ashraf
/// Default Suppliers Tab in Tablet View
class TabletSuppliersPage extends StatelessWidget {
  const TabletSuppliersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuppliersController>(
      id: SuppliersIds.suppliersPage,
      builder: (controller) {
        return controller.loading
            ? const Expanded(child: AppCircleProgress())
            : controller.suppliers.isEmpty
                ? const Expanded(child: NoDataGif())
                : Expanded(
                    child: DefaultDataTable(
                    columns: controller.orderHeaders
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
                      controller.suppliers.length,
                      (index) {
                        ProductType.consumable;
                        return DataRow(
                          onSelectChanged: (value) {
                            if (value ?? false) {
                              Get.lazyPut(
                                () => SupplierFormController()
                                  ..setSupplierData(controller.suppliers[index])
                                  ..isEditable = false,
                              );

                              context.navigateTo(
                                Routes.supplierForm,
                                arguments: {
                                  RouteArguments.supplier:
                                      controller.suppliers[index]
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
                                controller.suppliers[index].supplierId,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].supplierName,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].country,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].city,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].postalCode,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller
                                    .suppliers[index].businessType.getName,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].catalogOfProduct,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                '${controller.suppliers[index].firstName} ${controller.suppliers[index].firstName}',
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].title,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].postalCode,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].phoneNumber,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].email,
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                DateTimeHelper.formatDate(controller
                                    .suppliers[index]
                                    .contractDetails
                                    .startDate),
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                DateTimeHelper.formatDate(controller
                                    .suppliers[index].contractDetails.endDate),
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].contractDetails
                                        .attachmentEntity.fileName ??
                                    'Exampble.pdf',
                                style: AppTextStyles.font16BlackRegularCairo,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                controller.suppliers[index].contractDetails
                                        .attachmentEntity.fileName ??
                                    'Exampble.pdf',
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
