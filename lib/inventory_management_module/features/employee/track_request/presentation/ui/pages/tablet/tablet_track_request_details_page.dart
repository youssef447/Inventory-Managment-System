import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/approve_cycle.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../home/domain/user_entity.dart';
import '../../../../../requests/entities/request_entity.dart';
import '../../../controller/track_requests_controller.dart';
import '../../widgets/common/track_request_details/cancel_request_button.dart';
import '../../widgets/common/inquiry_chat/cards/inquiry_chat_card.dart';
part '../../widgets/tablet/track_details/cards/tablet_track_details_card.dart';
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
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          controller: controller.scrollController,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                titles: model.assetsEntity != null
                    ? [
                        'Track Asset'.tr,
                        'Asset Details'.tr,
                      ]
                    : [
                        'Track Consumable'.tr,
                        'Consumable Details'.tr,
                      ],
                titleNavigations: [
                  () => Navigator.of(context).pop(),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(20),
                  TabletTrackDeatailsCard(
                    model: model,
                    isConsumable: model.consumablesEntity != null,
                  ),
                  verticalSpace(
                    context.isLandscapee ? 26 : 38,
                  ),
                  Text(
                    'Inquiries And Comments'.tr,
                    style: AppTextStyles.font22BlackBoldCairo,
                  ),
                  verticalSpace(13),
                  InquiryChatCard(
                    model: model,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
