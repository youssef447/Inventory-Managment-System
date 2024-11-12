import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/constants/app_assets.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../../core/constants/approve_cycle.dart';
import '../../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../../core/helpers/haptic_feedback_helper.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../core/widgets/dialog/default_dialog.dart';
import '../../../../../../core/widgets/loading.dart';
import '../../../../../../core/widgets/no_data_gif.dart';
import '../../../../../../core/helpers/date_time_helper.dart';

import '../../../../../requests/entities/request_entity.dart';
import '../../../../constants/ids_constants.dart';
import '../../../controller/track_requests_controller.dart';
import '../../widgets/common/buttons/cancel_request_button.dart';
part '../../widgets/tablet/track_details/cards/track_details_card.dart';
part '../../widgets/tablet/track_details/track_details_card_header.dart';
part '../../widgets/tablet/track_details/approval_cycle.dart';

class TabletTrackRequestDetailsPage extends GetView<TrackRequestController> {
  final RequestEntity model;
  const TabletTrackRequestDetailsPage({
    super.key,
    required this.model,
  });

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
                        'Track Asset'.tr,
                        'Track Details'.tr,
                      ],
                      titleNavigations: [
                        () => Get.back(),
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
                                    TabletTrackDeatailsCard(
                                      model: model,
                                    ),
                                    verticalSpace(
                                      context.isLandscapee ? 26 : 38,
                                    ),
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
