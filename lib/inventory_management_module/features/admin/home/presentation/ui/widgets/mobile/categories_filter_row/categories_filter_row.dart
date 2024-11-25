part of '../../../page/mobile/mobile_admin_home_page.dart';

//Youssef Ashraf
// Date: 7/11/2024
///Represents the categories Filter Row in home page
class MobileCategoriesFilterRow extends GetView<AdminController> {
  const MobileCategoriesFilterRow({
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
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(AdminCategories.values.length, (index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.only(
                      end:
                          index == AdminCategories.values.length - 1 ? 0 : 37.w,
                    ),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        controller.updateCategoryIndex(index);
                      },
                      child: MobileCategoryFilterCard(
                        count: 0,
                        name: AdminCategories.values[index].getName,
                        selected:
                            controller.currentCategoryIndex.value == index,
                      ),
                    ),
                  );
                }),
              ),
            );
          },
        ),
      ),
    );
  }
}
