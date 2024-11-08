import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../core/widgets/table/default_data_table.dart';
import '../../../../constants/ids_constants.dart';
import '../../../../constants/requests_columns.dart';
import '../../../controller/requests_controller.dart';
import '../../widgets/common/horizontal/requests_summary_row.dart';
import '../../widgets/common/request_category_row.dart';
import '../../widgets/common/vertical/requests_summary_row.dart';

class TabletRequestsPage extends GetView<RequestsController> {
  const TabletRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
        id: RequestsIds.requestsPage,
        builder: (controller) {
          return controller.loading
              ? const AppCircleProgress()
              : controller.requests.isEmpty
                  ? const NoDataGif()
                  : Column(
                      children: [
                        const OrientationHelper(
                          landScape: HorizontalRequstsSummary(),
                          portrait: VerticalRequstsSummary(),
                        ),
                        verticalSpace(10),
                        const RequestCategoryRow(),
                        verticalSpace(10),
                        DefaultDataTable(
                          columns: RequestsColumns.requestsColumns
                              .map(
                                (element) => DataColumn(
                                  label: Text(
                                    element.tr,
                                    style:
                                        AppTextStyles.font16WhiteRegularCairo,
                                  ),
                                ),
                              )
                              .toList(),
                          rows: List.generate(
                            controller.requests.length,
                            (index) => DataRow(
                              onSelectChanged: (value) {
                                /*  if (value ?? false) {
                            HapticFeedbackHelper.triggerHapticFeedback(
                              vibration: VibrateType.mediumImpact,
                              hapticFeedback: HapticFeedback.mediumImpact,
                            );
                            controller.selectedReqStatus = controller
                                .approvalRequests[index].requestStatus;
                            Get.toNamed(
                              Routes.requestDetails,
                              arguments: {
                                'requestModelIndex': index,
                              },
                            );
                          } */
                              },
                              color: WidgetStatePropertyAll(
                                index % 2 == 0
                                    ? AppColors.evenRowColor
                                    : AppColors.oddRowColor,
                              ),
                              cells: [
                                DataCell(
                                  Text(
                                    controller.requests[index].requestId,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].requestType,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                ///
                                DataCell(
                                  Text(
                                    DateTimeHelper.formatDate(
                                      controller.requests[index].requestDate,
                                    ),
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].status.tr,
                                    style: AppTextStyles.font16BlackRegularCairo
                                        .copyWith(
                                      color: controller
                                          .requests[index].status.getColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].priority,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),

                                DataCell(
                                  Text(
                                    controller
                                        .requests[index].maintenanceFrequency,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].assetName,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].category,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].subCategory,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].model,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    controller.requests[index].brand,
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    DateTimeHelper.formatDate(
                                      controller
                                          .requests[index].expectedRecieved,
                                    ),
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    DateTimeHelper.formatDate(
                                      controller.requests[index].dateReturn,
                                    ),
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    DateTimeHelper.formatInt(
                                      controller.requests[index].quantity,
                                    ),
                                    style:
                                        AppTextStyles.font16BlackRegularCairo,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ).toList(),
                        ),
                      ],
                    );
        });
  }
}
