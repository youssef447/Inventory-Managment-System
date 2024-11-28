import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/animations/scale_animation.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/loading.dart';
import '../../../../../../../core/widgets/no_data_gif.dart';
import '../../../../constants/ids_constants.dart';
import '../../../../entities/request_entity.dart';
import '../../../controller/requests_controller.dart';
import '../../widgets/common/request_category_filter.dart';
import '../../widgets/common/vertical/requests_summary_circles.dart';
part '../../widgets/mobile/request_card.dart';

//Youssef Ashraf
//Date: 7/11/2024
///Represents The Requests Tab Page in Mobile View
class MobileRequestsPage extends GetView<RequestsController> {
  const MobileRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestsController>(
        id: RequestsIds.requestsPage,
        builder: (controller) {
          return controller.loading
              ? const SliverFillRemaining(
                  child: AppCircleProgress(),
                )
              : controller.requests.isEmpty
                  ? const SliverFillRemaining(
                      child: NoDataGif(),
                    )
                  : SliverMainAxisGroup(slivers: [
                      const SliverToBoxAdapter(
                        child: ScaleAnimation(
                          child: VerticalRequstsSummaryCircles(),
                        ),
                      ),
                      SliverToBoxAdapter(child: verticalSpace(10)),
                      const SliverToBoxAdapter(child: RequestCategoryFilter()),
                      SliverToBoxAdapter(child: verticalSpace(10)),
                      Obx(() => SliverPadding(
                            padding: EdgeInsets.only(
                              bottom: 12.h,
                            ),
                            sliver: SliverList.separated(
                              separatorBuilder: (_, __) => verticalSpace(16),
                              itemBuilder: (context, index) {
                                return MobileRequestCard(
                                  request:
                                      controller.currentCategoryIndex.value == 0
                                          ? controller.requestsOfAssets[index]
                                          : controller
                                              .requestsOfConsumables[index],
                                );
                              },
                              itemCount:
                                  controller.currentCategoryIndex.value == 0
                                      ? controller.requestsOfAssets.length
                                      : controller.requestsOfConsumables.length,
                            ),
                          ))
                    ]);
        });
  }
}
