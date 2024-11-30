import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../../core/enums/inventory_categories.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../features/admin/dashboard/constants/dashboard_ids.dart';
import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/enums/category_subactegory.dart';
import '../../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/dropdown/app_dropdown.dart';
import '../../../../controller/dashboard_controller.dart';
import '../../../widgets/common/charts/dashboard_column_bar_chart.dart';

//Youssef Ashraf
///Default Bar Chart List in Mobile Tablet Views
class BarChartList extends GetView<DashboardController> {
  const BarChartList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        id: DashboardIds.barchartFilters,
        builder: (controller) {
          return Column(
            children: [
              DashboardColumnBarChart(
                title: 'Expenses'.tr,
                titleIconAsset: AppAssets.expenses,
                data: controller.expensesHistoryBarChartData,
                dropDowns: [
                  AppDropdown(
                    height: 36.h,
                    onChanged: (v) {
                      controller.updateExpensesInventoryType(v);
                    },
                    items: List.generate(
                      InventoryCategories.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: InventoryCategories.values[index],
                          child: Text(
                            InventoryCategories.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Inventory Type'.tr,
                    textButton:
                        controller.selectedExpensesInventoryType?.getName.tr,
                  ),
                ],
              ),
              verticalSpace(15),
              DashboardColumnBarChart(
                title: 'Maintenance Request'.tr,
                titleIconAsset: AppAssets.maintenancee,
                data: controller.maintenanceHistoryBarChartData,
                dropDowns: [
                  AppDropdown(
                    height: 36.h,
                    onChanged: (v) {
                      controller.updateMaintenanceCategory(v);
                    },
                    items: List.generate(
                      Category.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: Category.values[index],
                          child: Text(
                            Category.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Category'.tr,
                    textButton:
                        controller.selectedMaintenanceCategory?.getName.tr,
                  ),
                  AppDropdown(
                    height: 36.h,
                    onChanged: (v) {
                      controller.updateMaintenanceSubcategory(v);
                    },
                    items: List.generate(
                      SubCategory.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: SubCategory.values[index],
                          child: Text(
                            SubCategory.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Subcategory'.tr,
                    textButton:
                        controller.selectedMaintenanceSubcategory?.getName.tr,
                  )
                ],
              ),
              verticalSpace(15),
              DashboardColumnBarChart(
                title: 'Request'.tr,
                titleIconAsset: AppAssets.requests,
                data: controller.requestsHistoryBarChartData,
                dropDowns: [
                  AppDropdown(
                    height: 36.h,
                    onChanged: (v) {
                      controller.updateReqeustInventoryType(v);
                    },
                    items: List.generate(
                      InventoryCategories.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: InventoryCategories.values[index],
                          child: Text(
                            InventoryCategories.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Inventory Type'.tr,
                    textButton:
                        controller.selectedReqeustInventoryType?.getName.tr,
                  ),
                  AppDropdown(
                    height: 36.h,
                    onChanged: (v) {
                      controller.updateRequestStatus(v);
                    },
                    items: List.generate(
                      RequestStatus.values.length - 1,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: RequestStatus.values[index],
                          child: Text(
                            RequestStatus.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Status'.tr,
                    textButton: controller.selectedRequestStatus?.getName.tr,
                  )
                ],
              ),
              verticalSpace(15),
              DashboardColumnBarChart(
                title: 'Suppliers'.tr,
                titleIconAsset: AppAssets.supplier,
                data: controller.suppliersBarChartData,
              ),
              verticalSpace(15),
              DashboardColumnBarChart(
                title: 'Department'.tr,
                titleIconAsset: AppAssets.departments,
                data: controller.depsBarChartData,
                dropDowns: [
                  AppDropdown(
                    height: 36.h,
                    onChanged: (v) {
                      controller.updateDepInventoryType(v);
                    },
                    items: List.generate(
                      InventoryCategories.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: InventoryCategories.values[index],
                          child: Text(
                            InventoryCategories.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Inventory Type'.tr,
                    textButton: controller.selectedDepInventoryType?.getName.tr,
                  ),
                ],
              ),
              verticalSpace(15),
              DashboardColumnBarChart(
                title: 'Low Stock'.tr,
                titleIconAsset: AppAssets.stockOut,
                data: controller.lowStockBarChartData,
                dropDowns: [
                  AppDropdown(
                    height: 36.h,
                    width: !context.isTablett ? 103.w : null,
                    onChanged: (v) {
                      controller.updateStockInventoryType(v);
                    },
                    items: List.generate(
                      InventoryCategories.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: InventoryCategories.values[index],
                          child: Text(
                            InventoryCategories.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Inventory Type'.tr,
                    textButton:
                        controller.selectedStockInventoryType?.getName.tr,
                  ),
                  AppDropdown(
                    height: 36.h,
                    width: !context.isTablett ? 86.w : null,
                    onChanged: (v) {
                      controller.updateStockCategory(v);
                    },
                    items: List.generate(
                      Category.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: Category.values[index],
                          child: Text(
                            Category.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Category'.tr,
                    textButton: controller.selectedStockCategory?.getName.tr,
                  ),
                  AppDropdown(
                    height: 36.h,
                    width: !context.isTablett ? 107.w : null,
                    onChanged: (v) {
                      controller.updateStockSubcategory(v);
                    },
                    items: List.generate(
                      SubCategory.values.length,
                      (index) {
                        return DropdownMenuItem(
                          alignment: AlignmentDirectional.centerStart,
                          value: SubCategory.values[index],
                          child: Text(
                            SubCategory.values[index].getName.tr,
                            style:
                                AppTextStyles.font14SecondaryBlackCairoMedium,
                          ),
                        );
                      },
                    ),
                    hintText: 'Subcategory'.tr,
                    textButton: controller.selectedStockSubcategory?.getName.tr,
                  ),
                ],
              ),
            ],
          );
        });
  }
}
