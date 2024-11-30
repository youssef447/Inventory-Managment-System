import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../../products/domain/assigned_user_products_entity.dart';

class ConsumableAssignedUserCard extends StatelessWidget {
  final AssignedUserProductsEntity assignedUser;
  const ConsumableAssignedUserCard({super.key, required this.assignedUser});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        context.navigateTo(
            Routes.adminConsumablesAssignedDetails,
            arguments: {
              RouteArguments.adminConsumablesAssignedDetails: assignedUser,
            }
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 10.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(
                    assignedUser.userEntity.profileImage,
                  ),
                ),
                horizontalSpace(4),
                Expanded(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${assignedUser.userEntity.firstName} ${assignedUser.userEntity.lastName}',
                                style: context.isTablett ? AppTextStyles.font16BlackCairoRegular : AppTextStyles.font12BlackCairoRegular ,
                              ),
                              Text(
                                assignedUser.userEntity.jobTitle,
                                style: context.isTablett ? AppTextStyles.font16BlackCairoRegular : AppTextStyles.font12BlackCairoRegular ,
                              ),
                            ],
                          ),
                        ),
                        horizontalSpace(2),
                        DefaultRichText(
                            label: 'Status'.tr,
                            labelStyle: context.isTablett ?   AppTextStyles.font14SecondaryBlackCairoMedium : AppTextStyles.font12SecondaryBlackCairoMedium,
                            style: AppTextStyles.font14SecondaryBlackCairoMedium
                                .copyWith(
                              fontSize:    context.isTablett ?  14.sp :12.sp,
                              color: assignedUser.productentity.status.getColor,
                            ),
                            value: assignedUser.productentity.status),
                      ]),
                ),
              ],
            ),
            verticalSpace(5),
            context.isLandscape ?Row(
              children: [
                Expanded(
                  child: DefaultRichText(
                    label: 'Assigned Date'.tr,
                    value: DateTimeHelper.formatDate(
                      assignedUser.assigneDate,
                    ),
                  ),
                ),
                horizontalSpace(12),
                Expanded(
                  child: DefaultRichText(
                    label: 'Return Date'.tr,
                    value: DateTimeHelper.formatDate(
                      assignedUser.returnDate,
                    ),
                  ),
                ),
              ],
            ) : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultRichText(
                  label: 'Assigned Date'.tr,
                  value: DateTimeHelper.formatDate(
                    assignedUser.assigneDate,
                  ),
                ),
                DefaultRichText(
                  label: 'Return Date'.tr,
                  value: DateTimeHelper.formatDate(
                    assignedUser.returnDate,
                  ),
                ),
              ],
            ),
            verticalSpace(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '${'Last Update'.tr}:',
                  style: AppTextStyles.font10BlackCairoRegular
                      .copyWith(color: AppColors.inverseBase),
                ),
                Text(
                  DateTimeHelper.formatDate(
                    assignedUser.lastUpdate,
                  ),
                  style: AppTextStyles.font10BlackCairoRegular,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
