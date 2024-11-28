import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../../../../core/enums/requests_enums.dart';
import '../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../features/products/enums/product_enums.dart';

import '../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../core/constants/approve_cycle.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/mobile_custom_appbar.dart';

import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../employee/track_request/presentation/ui/widgets/common/inquiry_chat/cards/inquiry_chat_card.dart';
import '../../../controller/employee_details_controller.dart';
import '../../widgets/common/buttons/requested_approval_buttons.dart';
import 'mobile_admin_employee_details_page.dart';
part '../../widgets/mobile/track_request_details/cards/mobile_track_details_card.dart';
part '../../widgets/mobile/track_request_details/mobile_approval_cycle.dart';

class MobileAdminTrackRequestDetailsPage
    extends GetView<EmployeeDetailsController> {
  final RequestEntity model;

  const MobileAdminTrackRequestDetailsPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              MobileCustomAppbar(
                title: 'Request Details'.tr,
              ),
              verticalSpace(30),
              Expanded(
                  child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MobileAdminEmployeeDetailsCard(
                      userEntity: model.userEntity,
                    ),
                    verticalSpace(
                      30,
                    ),
                    MobileTrackDetailsCard(
                      model: model,
                      isConsumable: model.requestType == ProductType.consumable,
                    ),
                    verticalSpace(
                      30,
                    ),
                    Text(
                      'Inquiries And Comments'.tr,
                      style: AppTextStyles.font16BlackSemiBoldCairo,
                    ),
                    verticalSpace(13),
                    InquiryChatCard(
                      model: model,
                      adminEmpDetailsPage: true,
                    ),
                  ],
                ),
              ))
            ])),
      ),
    );
  }
}
