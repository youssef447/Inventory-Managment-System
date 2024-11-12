// by : Mohamed Ashraf
//date : 11/11/2024
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inventory_management/core/extensions/extensions.dart';

import '../../../../../home/presentation/page/tablet/tablet_home_page.dart';
import '../../../controller/approval_controller.dart';
import '../../constants/approval_categories.dart';


class ApprovalCategoriesFilter extends GetView<ApprovalController> {
  const ApprovalCategoriesFilter({
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
          return Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ...List.generate(ApprovalCategories.categories.length,
                            (index) {
                          final last =
                              index == ApprovalCategories.categories.length - 1;
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              controller.updateCategoryIndex(index);
                            },
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.only(end: last ? 0 : 37.w),
                              child: TabletCategoryFilterCard(
                                count: 10,
                                name: ApprovalCategories.categories[index],
                                selected:
                                controller.currentCategoryIndex.value == index,
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              ),
              //if current tab is requests
              // Row(
              //   children: [
              //     if (controller.currentCategoryIndex.value == 2)
              //       AppDefaultButton(
              //         text: 'Track Request'.tr,
              //         style: context.isPhone
              //             ? AppTextStyles.font16BlackMediumCairo
              //             : AppTextStyles.font18BlackMediumCairo,
              //       ),
              //     horizontalSpace(8),
              //     AppDefaultButton(
              //       text: 'Approval'.tr,
              //       onPressed: (){
              //         Get.toNamed(Routes.approval);
              //       },
              //       style: context.isPhone
              //           ? AppTextStyles.font16BlackMediumCairo
              //           : AppTextStyles.font18BlackMediumCairo,
              //     ),
              //   ],
              // ),
            ],
          );
        },
      ),
    );
  }
}
