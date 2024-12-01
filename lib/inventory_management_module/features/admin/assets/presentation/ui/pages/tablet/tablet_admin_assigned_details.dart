import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/core/theme/app_colors.dart';
import '../../../../../../../core/animations/size_animation.dart';
import '../../../../../../../core/helpers/orientation_helper.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/appbar/custom_app_bar.dart';
import '../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../employee/track_request/presentation/ui/widgets/common/inquiry_chat/cards/inquiry_chat_card.dart';
import '../../../../../../products/domain/assigned_user_products_entity.dart';
import '../../../../../employees/presentation/ui/pages/tablet/tablet_admin_employee_details_page.dart';
import '../../../controller/admin_assets_controller.dart';
import '../../widget/tablet/assigned/horizontal_assigned_details_card.dart';
import '../../widget/tablet/assigned/vertical_assigned_details_card.dart';
import '../../widget/tablet/cards/maintenance_card.dart';

// by : Mohamed Ashraf
class TabletAdminAssignedDetails extends StatelessWidget {
  const TabletAdminAssignedDetails({super.key, required this.assignedUser,});
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
                    titles:   ['Asset Details'.tr,'Assigned'.tr],
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
                        landScape: HorizontalAssignedDetailsCard(assets: assignedUser.productentity.assetEntity!,
                        ),
                        portrait: VerticalAssignedDetailsCard(assets: assignedUser.productentity.assetEntity!,)
                    ),
                  ),
                  verticalSpace(12),
                  GetBuilder<AdminAssetsController>(
                    builder: (controller) {
                      return Row(
                        children: [
                          Text(
                            'Maintenance Details'.tr,
                            style: AppTextStyles.font22BlackBoldCairo,
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: (){
                              controller.toggleHideAndExpand();
                            },
                            child: Text(
                             controller.hideMaintenance? 'Hide'.tr :  'Expand'.tr,
                              style: AppTextStyles.font12BlueCairoRegular,
                            ),
                          ),

                        ],
                      );
                    }
                  ),
                  verticalSpace(13),
                  GetBuilder<AdminAssetsController>(
                    builder: (controller) {
                      return controller.hideMaintenance ?
                        StaggeredGrid.count(
                        crossAxisCount: Get.width > 1200 ? 3 : 2,
                        mainAxisSpacing: 15.h,
                        crossAxisSpacing:
                        context.isLandscapee ? 20.w : 16.w,
                        children: List.generate(4, (index) {
                         return const MaintenanceCard();
                          },
                        ),
                      ) : const SizedBox();
                    }
                  ),


                  verticalSpace(
                    context.isLandscapee ? 26 : 38,
                  ),
                  Text(
                    'Inquiries And Comments'.tr,
                    style: AppTextStyles.font22BlackBoldCairo,
                  ),
                  verticalSpace(13),
                  // InquiryChatCard(
                  //   model: request,
                  //   adminEmpDetailsPage: true,
                  // ),
                ],
              ),
            ),
          ))
    );
  }
}

