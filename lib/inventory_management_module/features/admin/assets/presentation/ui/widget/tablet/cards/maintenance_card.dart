
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../../../core/constants/app_assets.dart';
import '../../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../products/domain/assigned_user_products_entity.dart';

class MaintenanceCard extends StatelessWidget {
  const MaintenanceCard({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
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
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  AppAssets.maintenance,
                  width: 70.w,
                  height: 70.h,
                  fit: BoxFit.cover,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultRichText(
                              label: 'Maintenance Schedule',
                              value: DateTimeHelper.formatDate(
                                DateTime.now(),
                              ),
                            ),
                            DefaultRichText(
                              label: 'Requested Maintenance',
                              value: DateTimeHelper.formatDate(
                                DateTime.now(),
                              ),
                            ),
                          ],
                        ),
                      ),
                      horizontalSpace(2),
                      context.isTablett ? DefaultRichText(
                          label: 'Status',
                          labelStyle:
                          AppTextStyles.font14SecondaryBlackCairoMedium,
                          style: AppTextStyles.font14SecondaryBlackCairoMedium
                              .copyWith(
                            color: AppColors.green
                          ),
                          value: 'InUse'
                      ) : SizedBox(),
                    ]),
              ),
            ],
          ),
          verticalSpace(5),
          Column(
            children: [
              DefaultRichText(
                label: 'Maintenance Start Date',
                value: DateTimeHelper.formatDate(
                  DateTime.now(),
                ),),
              DefaultRichText(
                label: 'Maintenance End Date',
                value: DateTimeHelper.formatDate(
                  DateTime.now(),
                ),),

            ],
          ),
           context.isTablett ? SizedBox() :  Align(
             alignment: AlignmentDirectional.bottomEnd,
             child: DefaultRichText(
                 label: 'Status',
                 labelStyle:
                 AppTextStyles.font14SecondaryBlackCairoMedium,
                 style: AppTextStyles.font14SecondaryBlackCairoMedium
                     .copyWith(
                     color: AppColors.green
                 ),
                 value: 'InUse'
             ),
           )
        ],
      ),
    );
  }
}