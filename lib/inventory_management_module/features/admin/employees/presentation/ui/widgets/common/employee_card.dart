import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_management/inventory_management_module/core/theme/app_text_styles.dart';
import '../../../../../../../core/animations/scale_animation.dart';
import '../../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../../features/admin/employees/enums/departments.dart';

import '../../../../../../../core/theme/app_colors.dart';
import '../../../../../../../core/widgets/default_rich_text.dart';
import '../../../../../../employee/home/domain/user_entity.dart';

class EmployeeCard extends StatelessWidget {
  final UserEntity employee;
  const EmployeeCard({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(4.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 32.5.r,
              backgroundImage: NetworkImage(employee.profileImage),
            ),
            horizontalSpace(4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${employee.firstName} ${employee.lastName}',
                    style: AppTextStyles.font16BlackCairoMedium,
                  ),
                  DefaultRichText(
                    label: 'Job Title',
                    value: employee.jobTitle,
                  ),
                  DefaultRichText(
                    label: 'Department',
                    value: employee.department.getName,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
