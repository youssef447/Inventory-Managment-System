part of '../../pages/tablet/tablet_requests_page.dart';

class RequestsOfAssetsTable extends GetView<RequestsController> {
  const RequestsOfAssetsTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
        id: RequestsIds.requestsPage,
        builder: (controller) {
          return DefaultDataTable(
            columns: RequestsColumns.requestAssetColumns
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
              controller.requestsOfAssets.length,
              (index) => DataRow(
                color: WidgetStatePropertyAll(
                  index % 2 == 0
                      ? AppColors.evenRowColor
                      : AppColors.oddRowColor,
                ),
                cells: [
                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].requestId,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].requestType,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  ///
                  DataCell(
                    Text(
                      DateTimeHelper.formatDate(
                        controller.requestsOfAssets[index].requestDate,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].status.tr,
                      style: AppTextStyles.font16BlackRegularCairo.copyWith(
                        color: controller
                            .requestsOfAssets[index].status.tr.getColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].priority,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  DataCell(
                    Text(
                      DateTimeHelper.formatDate(
                        controller.requestsOfAssets[index].expectedRecieved,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      DateTimeHelper.formatDate(
                        controller.requestsOfAssets[index].dateReturn,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      DateTimeHelper.formatInt(
                        controller.requestsOfAssets[index].quantity,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].assetsEntity!
                              .maintenanceFrequency ??
                          'Not Applicable'.tr,
                      style: AppTextStyles.font16BlackRegularCairo.copyWith(
                        color: controller.requestsOfAssets[index].assetsEntity!
                                    .maintenanceFrequency ==
                                null
                            ? AppColors.darkGrey
                            : AppColors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller
                          .requestsOfAssets[index].assetsEntity!.assetName,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].assetsEntity!.category,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller
                          .requestsOfAssets[index].assetsEntity!.subcategory,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].assetsEntity!.model,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfAssets[index].assetsEntity!.brand,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                ],
              ),
            ).toList(),
          );
        });
  }
}
