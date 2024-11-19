import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/animations/size_animation.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';

import '../../../../../requests/entities/request_entity.dart';
import '../../../../../requests/presentation/controller/requests_controller.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/track_requests_controller.dart';
import '../../widgets/common/track_requests/track_request_search_filter.dart';
part '../../widgets/tablet/track_request/cards/vertical_track_request_card.dart';
part '../../widgets/tablet/track_request/cards/horizontal_track_request_card.dart';

class TabletTrackRequestsPage extends GetView<TrackRequestController> {
  const TabletTrackRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: GetBuilder<TrackRequestController>(
            id: TrackRequestIds.trackRequestsPage,
            builder: (controller) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      titles: [
                        Get.find<RequestsController>()
                                    .currentCategoryIndex
                                    .value ==
                                1
                            ? 'Track Consumable'.tr
                            : 'Track Asset'.tr
                      ],
                    ),
                    controller.loading
                        ? const Expanded(child: AppCircleProgress())
                        : controller.requests.isEmpty
                            ? const Expanded(child: NoDataGif())
                            : SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    verticalSpace(20),
                                    const TrackRequestSearchFilter(),
                                    verticalSpace(20),
                                    SizeAnimation(
                                      child: StaggeredGrid.count(
                                        crossAxisCount:
                                            Get.width > 1200 ? 3 : 2,
                                        mainAxisSpacing: 15.h,
                                        crossAxisSpacing:
                                            context.isLandscapee ? 20.w : 36.w,
                                        children: List.generate(
                                          controller.requests.length,
                                          (index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                  Routes.trackDetails,
                                                  arguments: {
                                                    'model': controller
                                                        .requests[index]
                                                  },
                                                );
                                              },
                                              child: OrientationHelper(
                                                landScape:
                                                    HorizontalTrackRequestCard(
                                                  model: controller
                                                      .requests[index],
                                                  isConsumable: controller
                                                          .requests[index]
                                                          .consumablesEntity !=
                                                      null,
                                                ),
                                                portrait:
                                                    VerticalTrackRequestCard(
                                                  model: controller
                                                      .requests[index],
                                                  isConsumable: controller
                                                          .requests[index]
                                                          .consumablesEntity !=
                                                      null,
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
