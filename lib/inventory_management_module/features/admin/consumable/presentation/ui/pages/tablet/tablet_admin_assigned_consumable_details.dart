
// by : Mohamed Ashraf
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../employee/track_request/presentation/ui/widgets/common/inquiry_chat/cards/inquiry_chat_card.dart';
import '../../../../../../products/domain/assigned_user_products_entity.dart';
import '../../../../../employees/presentation/ui/pages/tablet/tablet_admin_employee_details_page.dart';
import '../../widget/tablet/assigned/horizontal_assigned_consumable_details_card.dart';
import '../../widget/tablet/assigned/vertical_assigned_consumable_details_card.dart';

class TabletAdminConsumableDetails extends StatelessWidget {
  const TabletAdminConsumableDetails({super.key, required this.assignedUser,});
  final AssignedUserProductsEntity assignedUser;




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.isLandscapee ? 34.w : 16.w,
              vertical: 16.h,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(16),
                  CustomAppBar(
                    titles:  const ['Consumable Details','Assigned'],
                    titleNavigations: [
                          () => Navigator.of(context).pop(),
                    ],
                  ),
                  verticalSpace(12),
                  TabletEmployeeDetailsCard(
                    userEntity: assignedUser.userEntity,
                  ),
                  verticalSpace(12),
                  SizeAnimation(
                    child: OrientationHelper(
                        landScape: HorizontalAssignedConsumableDetailsCard(consumable: assignedUser.productentity.consumablesEntity!,
                        ),
                        portrait: VerticalAssignedConsumableDetailsCard(consumable: assignedUser.productentity.consumablesEntity!,)
                    ),
                  ),
                  verticalSpace(12),
                  verticalSpace(
                    context.isLandscapee ? 26 : 38,
                  ),
                  Text(
                    'Inquiries And Comments'.tr,
                    style: AppTextStyles.font22BlackBoldCairo,
                  ),
                 verticalSpace(13),
                  // InquiryChatCard(
                  //   model: model,
                  //   adminEmpDetailsPage: true,
                  // ),
                ],
              ),
            ),
          ))
    );
  }
}

