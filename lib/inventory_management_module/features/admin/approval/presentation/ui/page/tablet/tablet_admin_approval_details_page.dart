import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../..//core/extensions/extensions.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../employee/track_request/presentation/ui/pages/tablet/tablet_track_request_details_page.dart';
import '../../../../../../employee/track_request/presentation/ui/widgets/common/inquiry_chat/cards/inquiry_chat_card.dart';
import '../../../controller/admin_approval_controller.dart';

class TabletAdminTrackRequestDetailsPage
    extends GetView<AdminApprovalController> {
  final RequestEntity model;

  const TabletAdminTrackRequestDetailsPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                titles: const ['Employees', 'Request Details'],
                titleNavigations: [
                  () => Navigator.of(context).pop(),
                ],
              ),
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
                adminEmpDetailsPage: true,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
