import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/animations/horizontal_animation.dart';
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
import '../../widgets/common/horizontal/requests_summary_circles.dart';
import '../../widgets/common/request_category_filter.dart';
import '../../widgets/common/vertical/requests_summary_circles.dart';
part '../../widgets/tablet/requests_of_assets_table.dart';
part '../../widgets/tablet/requests_of_consumables_table.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Represents The Requests Tab Page in Tablet View
class TabletRequestsPage extends GetView<RequestsController> {
  const TabletRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
      id: RequestsIds.requestsPage,
      builder: (controller) {
        return controller.loading
            ? const Expanded(child: AppCircleProgress())
            : controller.requests.isEmpty
                ? const NoDataGif()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SlideAnimation(
                          leftToRight: !context.isArabic,
                          child: const OrientationHelper(
                            landScape: HorizontalRequstsSummaryCircles(),
                            portrait: VerticalRequstsSummaryCircles(),
                          ),
                        ),
                        verticalSpace(10),
                        const RequestCategoryFilter(),
                        verticalSpace(10),
                        Obx(
                          () {
                            if (controller.currentCategoryIndex.value == 0) {
                              return controller.requestsOfAssets.isNotEmpty
                                  ? const RequestsOfAssetsTable()
                                  : const NoDataGif();
                            } else {
                              return controller.requestsOfConsumables.isNotEmpty
                                  ? const RequestsOfConsumablesTable()
                                  : const NoDataGif();
                            }
                          },
                        )
                      ],
                    ),
                  );
      },
    );
  }
}
