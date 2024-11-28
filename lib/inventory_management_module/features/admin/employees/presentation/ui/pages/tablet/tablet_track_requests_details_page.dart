import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../features/products/enums/product_enums.dart';

import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../core/helpers/orientation_helper.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/approve_cycle.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';

import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../employee/track_request/presentation/ui/widgets/common/inquiry_chat/cards/inquiry_chat_card.dart';
import '../../../controller/employee_details_controller.dart';
import '../../widgets/common/buttons/requested_approval_buttons.dart';
part '../../widgets/tablet/track_details/approval_cycle.dart';
part '../../widgets/tablet/track_details/horzontal/horizontal_track_details_card_header.dart';
part '../../widgets/tablet/track_details/vertical/vertical_track_details_card_header.dart';
part '../../widgets/tablet/track_details/cards/tablet_track_details_card.dart';

class TabletAdminTrackRequestDetailsPage
    extends GetView<EmployeeDetailsController> {
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
          controller: controller.scrollController,
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
