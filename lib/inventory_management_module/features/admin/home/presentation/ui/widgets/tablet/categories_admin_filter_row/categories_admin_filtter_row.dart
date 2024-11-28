import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../../../core/extensions/extensions.dart';
import '../../../../../../../../core/animations/horizontal_animation.dart';
import '../../../../../../../../core/enums/admin_categories.dart';

import '../../../../../../../employee/home/presentation/ui/widgets/tablet/cards/category_filter_card.dart';
import '../../../../controller/admin_controller.dart';

///Represents the categories Filter Row in home page
class TabletCategoriesAdminFilterRow extends GetView<AdminController> {
  const TabletCategoriesAdminFilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SlideAnimation(
      leftToRight: context.isArabic ? false : true,
      child: Padding(
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(AdminCategories.values.length,
                            (index) {
                          final last =
                              index == AdminCategories.values.length - 1;
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              controller.updateCategoryIndex(index);
                            },
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  end: last ? 0 : 37.w),
                              child: TabletCategoryFilterCard(
                                count: 10,
                                name: AdminCategories.values[index].getName,
                                selected:
                                    controller.currentCategoryIndex.value ==
                                        index,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
