import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import 'package:inventory_management/inventory_management_module/features/admin/assets/domin/service_entity.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/routes/app_routes.dart';
import '../../../../../../../../core/routes/route_arguments.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../employee/requests/entities/request_entity.dart';
import '../../../../../../../products/domain/assigned_user_products_entity.dart';

class ServiceHistory extends StatelessWidget {
  final ServiceEntity serviceEntity;
  const ServiceHistory({super.key, required this.serviceEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        // Get.toNamed(
        //     Routes.adminAssetAssignedDetails,
        //     arguments: {
        //       RouteArguments.adminAssetAssignedDetails: serviceEntity,
        //     }
        // );

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
                    serviceEntity.userEntity.profileImage,
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
                                '${serviceEntity.userEntity.firstName} ${serviceEntity.userEntity.lastName}',
                                style: AppTextStyles.font16BlackCairoRegular,
                              ),
                              Text(
                                serviceEntity.userEntity.jobTitle,
                                style: AppTextStyles.font16BlackCairoRegular,
                              ),
                            ],
                          ),
                        ),
                        horizontalSpace(2),
                        DefaultRichText(
                            label: 'Status',
                            labelStyle:
                            AppTextStyles.font14SecondaryBlackCairoMedium,
                            style: AppTextStyles.font14SecondaryBlackCairoMedium
                                .copyWith(
                              color: serviceEntity.assetsEntity.status.getColor,
                            ),
                            value: serviceEntity.assetsEntity.status),
                      ]),
                ),
              ],
            ),
            verticalSpace(5), Column(
              children: [
                DefaultRichText(
                  label: 'Return Date',
                  value: DateTimeHelper.formatDate(
                    serviceEntity.returnDate,
                  ),
                ),
                DefaultRichText(
                  label: 'Return Date',
                  value: DateTimeHelper.formatDate(
                    serviceEntity.returnDate,
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
                    serviceEntity.lastUpdate,
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
