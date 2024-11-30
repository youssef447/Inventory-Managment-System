// by : Mohamed Ashraf
//date : 30/11/2024
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/extensions/extensions.dart';
import '../../../../../../approval/presentation/ui/constants/approval_categories.dart';
import '../../../../../../employee/home/presentation/ui/widgets/tablet/cards/category_filter_card.dart';
import '../../../controller/admin_approval_controller.dart';
import '../../constants/approval_categories.dart';

class ApprovalAdminCategoriesFilter extends GetView<AdminApprovalController> {
  const ApprovalAdminCategoriesFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: context.isTablett ? 0 : 8.w,
        bottom: 8.h,
        top: 8.h,
      ),
      child: Obx(
        () {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(AdminApprovalCategories.categories.length, (index) {
                  final last =
                      index == AdminApprovalCategories.categories.length - 1;
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      controller.updateCategoryIndex(index);
                    },
                    child: Padding(
                      padding: EdgeInsetsDirectional.only(end: last ? 0 : 37.w),
                      child: TabletCategoryFilterCard(
                        count: 10,
                        name: AdminApprovalCategories.categories[index],
                        selected:
                            controller.currentCategoryIndex.value == index,
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
