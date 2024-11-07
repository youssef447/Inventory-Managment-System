part of '../../../page/mobile/mobile_home_page.dart';

//Youssef Ashraf
// Date: 7/11/2024
///Represents the categories Filter Row in home page
class MobileCategoriesFilterRow extends GetView<HomeController> {
  const MobileCategoriesFilterRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsetsDirectional.only(
          start: context.isTablett ? 0 : 8.w,
          bottom: 8.h,
          top: 8.h,
        ),
        child: GetBuilder<HomeController>(
          id: HomeIds.categoriesRow,
          builder: (controller) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
                  List.generate(InventoryCategories.categories.length, (index) {
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    controller.updateCategoryIndex(index);
                  },
                  child: MobileCategoryFilterCard(
                    count: 0,
                    name: InventoryCategories.categories[index],
                    selected: controller.currentCategoryIndex == index,
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
