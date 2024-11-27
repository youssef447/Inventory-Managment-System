// by : mohamed ashraf
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';

import '../../../../../../core/constants/app_assets.dart';
import '../../../../../../core/helpers/spacing_helper.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_styles.dart';
import '../../../../../../core/widgets/fields/app_form_field.dart';
import '../../../controller/add_approval_cycle_controller.dart';

class AddApprovalsSearch extends GetView<AddApprovalCycleController> {
  const AddApprovalsSearch({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          backGroundColor: AppColors.field,
          maxLines: 1,
          hintText: 'Search Here...'.tr,
          collapsed: true,
          hintStyle: AppTextStyles.font16SecondaryBlackCairoMedium,
          onChanged: (query) {
            controller.searchUser(query);
          },
          contentPadding: context.isTablett
              ? EdgeInsets.symmetric(
            vertical: 2.h,
          )
              : null,
          prefixIcon: SvgPicture.asset(
            AppAssets.search,
            width: 24.w,
            height: 24.h,
          ),
        ),
        verticalSpace(8),
        Obx(() {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: controller.filteredUsers.length,
            itemBuilder: (context, index) {
              final user = controller.filteredUsers[index];
              return Row(
                children: [
                  Checkbox(
                    value: user.isSelected,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    side: BorderSide(color: AppColors.lightGrey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    checkColor: Colors.white,
                    onChanged: (v) {
                      controller.toggleSelection(index);
                    },
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.profileImage),
                    radius: 12,
                  ),
                  horizontalSpace(8),
                  Text(user.firstName),
                ],
              );
            },
          );
        }),
      ],
    );
  }
}
