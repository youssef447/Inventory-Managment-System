part of '../../pages/tablet/tablet_dashboard_page.dart';

class TabletCircularChart extends GetView<DashboardController> {
  const TabletCircularChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: DashboardCircularChart(
          circleTitle: 'Categories',
          data: controller.categoryChartData,
          title: 'Categories',
          totalCount: controller.totalCategories,
          circleImage: AppAssets.subcategory,
          height: 211.h,
        )),
        horizontalSpace(11),
        Expanded(
            child: DashboardCircularChart(
          circleTitle: 'Subcategories',
          data: controller.subcategoryChartData,
          title: 'Subcategories',
          totalCount: controller.totalSubcategories,
          circleImage: AppAssets.subcategory,
          height: 211.h,
        )),
      ],
    );
  }
}
