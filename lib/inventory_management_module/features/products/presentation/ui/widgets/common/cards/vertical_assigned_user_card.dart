import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../../core/helpers/date_time_helper.dart';
import '../../../../../domain/assigned_user_products_entity.dart';

class VerticalAssignedUserCard extends StatelessWidget {
  final AssignedUserProductsEntity assignedUser;

  const VerticalAssignedUserCard({super.key, required this.assignedUser});

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                                style: AppTextStyles.font16BlackCairoRegular,
                              ),
                              Text(
                                assignedUser.userEntity.jobTitle,
                                style: AppTextStyles.font12BlackCairoRegular,
                              ),
                            ]),
                      ),
                      horizontalSpace(2),
                      DefaultRichText(
                        label: 'Last Update',
                        labelStyle:
                            AppTextStyles.font10SecondaryBlackCairoMedium,
                        style: AppTextStyles.font10BlackCairoMedium,
                        value: DateTimeHelper.formatDate(
                          assignedUser.lastUpdate,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
          verticalSpace(5),
          DefaultRichText(
            label: 'Assigned Date',
            value: DateTimeHelper.formatDate(
              assignedUser.assigneDate,
            ),
          ),
          DefaultRichText(
            label: 'Return Date',
            value: DateTimeHelper.formatDate(
              assignedUser.returnDate,
            ),
          ),
          DefaultRichText(
            label: 'Quantity Assigned',
            value: DateTimeHelper.formatInt(
              assignedUser.quantityAssigned,
            ),
          ),
        ],
      ),
    );
  }
}
