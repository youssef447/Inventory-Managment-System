import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/animations/scale_animation.dart';
import '../../../../../../core/animations/size_animation.dart';
import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids_constants.dart';
import '../../../../entities/request_entity.dart';
import '../../../controller/requests_controller.dart';
import '../../widgets/common/request_category_filter.dart';
import '../../widgets/common/vertical/requests_summary_circles.dart';
part '../../widgets/mobile/request_card.dart';

class MobileRequestsPage extends GetView<RequestsController> {
  const MobileRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
        id: RequestsIds.requestsPage,
        builder: (controller) {
          return controller.loading
              ? const AppCircleProgress()
              : controller.requests.isEmpty
                  ? const NoDataGif()
                  : Column(children: [
                      const ScaleAnimation(
                          child: VerticalRequstsSummaryCircles()),
                      verticalSpace(10),
                      const RequestCategoryFilter(),
                      verticalSpace(10),
                      Obx(
                        () => ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MobileRequestCard(
                              request:
                                  controller.currentCategoryIndex.value == 0
                                      ? controller.requestsOfAssets[index]
                                      : controller.requestsOfConsumables[index],
                            );
                          },
                          separatorBuilder: (_, __) => SizedBox(
                            height: 16.h,
                          ),
                          itemCount: controller.currentCategoryIndex.value == 0
                              ? controller.requestsOfAssets.length
                              : controller.requestsOfConsumables.length,
                        ),
                      )
                    ]);
        });
  }
}
