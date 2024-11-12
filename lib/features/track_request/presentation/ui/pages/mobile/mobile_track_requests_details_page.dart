import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/constants/approve_cycle.dart';
import '../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/appbar/default_rich_text.dart';
import '../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../requests/entities/request_entity.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/track_requests_controller.dart';
part '../../widgets/mobile/track_details/cards/mobile_track_details_card.dart';
part '../../widgets/mobile/track_details/mobile_approval_cycle.dart';

class MobileTrackRequestDetailsPage extends GetView<TrackRequestController> {
  final RequestEntity model;

  const MobileTrackRequestDetailsPage({
    super.key,
    required this.model,
  });

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
                        title: 'Track Request Details'.tr,
                      ),
                      controller.loading
                          ? const Expanded(
                              child: AppCircleProgress(),
                            )
                          : controller.requests.isEmpty
                              ? const NoDataGif()
                              : Expanded(
                                  child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        verticalSpace(52),
                                        MobileTrackDetailsCard(model: model)
                                      ]),
                                ))
                    ]);
              }),
        ),
      ),
    );
  }
}
