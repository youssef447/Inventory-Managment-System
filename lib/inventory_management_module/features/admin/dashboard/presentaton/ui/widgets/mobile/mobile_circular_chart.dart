part of '../../pages/mobile/mobile_dashboard_page.dart';

class MobileCircularChart extends GetView<DashboardController> {
  const MobileCircularChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashboardCircularChart(
          circleTitle: 'Categories',
          data: controller.categoryChartData,
          title: 'Categories',
          totalCount: controller.totalCategories,
          circleImage: AppAssets.subcategory,
          height: 211.h,
        ),
        verticalSpace(20),
        DashboardCircularChart(
          circleTitle: 'Subcategories',
          data: controller.subcategoryChartData,
          title: 'Subcategories',
          totalCount: controller.totalSubcategories,
          circleImage: AppAssets.subcategory,
          height: 211.h,
        ),
      ],
    );
  }
}
