part of '../../pages/tablet/tablet_requests_page.dart';

//Youssef Ashraf
/// Default Requests Of Consumables Table when user is in Requests Tab and selecting Assets Category
class RequestsOfConsumablesTable extends GetView<RequestsController> {
  const RequestsOfConsumablesTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
        id: RequestsIds.requestsPage,
        builder: (controller) {
          return DefaultDataTable(
            columns: RequestsColumns.requestConsumableColumns
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
              controller.requestsOfConsumables.length,
              (index) => DataRow(
                color: WidgetStatePropertyAll(
                  index % 2 == 0
                      ? AppColors.evenRowColor
                      : AppColors.oddRowColor,
                ),
                cells: [
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].requestId,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].requestType,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  ///
                  DataCell(
                    Text(
                      DateTimeHelper.formatDate(
                        controller.requestsOfConsumables[index].requestDate,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].status.tr,
                      style: AppTextStyles.font16BlackRegularCairo.copyWith(
                        color: controller
                            .requestsOfConsumables[index].status.tr.getColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].priority,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  DataCell(
                    Text(
                      DateTimeHelper.formatDate(
                        controller
                            .requestsOfConsumables[index].expectedRecieved,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].consumablesEntity!
                          .consumableId,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller
                          .requestsOfConsumables[index].consumablesEntity!.name,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].consumablesEntity!
                          .category,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].consumablesEntity!
                          .subcategory,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].consumablesEntity!
                          .model,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].consumablesEntity!
                          .brand,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  DataCell(
                    Text(
                      DateTimeHelper.formatInt(
                        controller.requestsOfConsumables[index].quantity,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].consumablesEntity!
                          .unitOfMeasurement,
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      DateTimeHelper.formatInt(
                        controller.requestsOfConsumables[index]
                            .consumablesEntity!.reorderLevel,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      DateTimeHelper.formatInt(
                        controller.requestsOfConsumables[index]
                            .consumablesEntity!.reorderQuantity,
                      ),
                      style: AppTextStyles.font16BlackRegularCairo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  DataCell(
                    Text(
                      controller.requestsOfConsumables[index].consumablesEntity!
                          .usageFrequency,
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
