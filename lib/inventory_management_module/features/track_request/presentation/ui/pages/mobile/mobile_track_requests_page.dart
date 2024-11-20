import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/routes/route_arguments.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../requests/entities/request_entity.dart';
import '../../../../../requests/presentation/controller/requests_controller.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/track_requests_controller.dart';
import '../../widgets/common/track_requests/track_request_search_filter.dart';
part '../../widgets/mobile/track_requests/cards/track_request_card.dart';

//Youssef Ashraf
///Represents Mobile Track Requests Page in Wich list of pending requests are displayed
class MobileTrackRequestsPage extends GetView<TrackRequestController> {
  const MobileTrackRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
          child: GetBuilder<TrackRequestController>(
              id: TrackRequestIds.trackRequestsPage,
              builder: (controller) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MobileCustomAppbar(
                        title: Get.find<RequestsController>()
                                    .currentCategoryIndex
                                    .value ==
                                1
                            ? 'Track Consumable'.tr
                            : 'Track Asset'.tr,
                      ),
                      controller.loading
                          ? const Expanded(
                              child: AppCircleProgress(),
                            )
                          : controller.requests.isEmpty
                              ? const NoDataGif()
                              : Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      verticalSpace(24),
                                      Text(
                                        'Asset Information'.tr,
                                        style: AppTextStyles
                                            .font18BlackCairoMedium,
                                      ),
                                      verticalSpace(8),
                                      const TrackRequestSearchFilter(),
                                      verticalSpace(8),
                                      Expanded(
                                        child: ListView.separated(
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.toNamed(
                                                  Routes.trackDetails,
                                                  arguments: {
                                                    RouteArguments.requestModel:
                                                        controller
                                                            .requests[index],
                                                  },
                                                );
                                              },
                                              child: MobileTrackRequestCard(
                                                model:
                                                    controller.requests[index],
                                                isConsumable: controller
                                                        .requests[index]
                                                        .consumablesEntity !=
                                                    null,
                                              ),
                                            );
                                          },
                                          separatorBuilder: (_, __) => SizedBox(
                                            height: 16.h,
                                          ),
                                          itemCount: controller.requests.length,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                    ]);
              }),
        ),
      ),
    );
  }
}
