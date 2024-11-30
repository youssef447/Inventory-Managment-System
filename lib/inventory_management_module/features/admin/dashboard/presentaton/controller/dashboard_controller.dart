import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/enums/inventory_categories.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../core/enums/category_subactegory.dart';
import '../../../../../core/enums/departments.dart';
import '../../../../../core/enums/requests_enums.dart';
import '../../../../../core/enums/sort_options.dart';
import '../../../../../core/enums/time_filter.dart';
import '../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../products/enums/product_enums.dart';
import '../../constants/dashboard_ids.dart';
import '../../domain/chart_data_entity.dart';
import '../ui/widgets/common/dialogs/custom_data_selector_dialog.dart';

class DashboardController extends GetxController {
  Departments? selectedDepartment;
  TimeFilter? selectedTimeFilter;
  bool applyEnabled = false;
  MinimumMaximumSortOptions? selectedSortOption;
  ProductType? selectedProductType;

  updateDepartmentFilter(Departments dep) {
    selectedDepartment = dep;

    update([DashboardIds.dashboardHeaderFilter]);
  }

  updateProductType(ProductType productType) {
    selectedProductType = productType;

    update([DashboardIds.dashboardHeaderFilter]);
  }

  updateTimeFilter(TimeFilter time) {
    if (time == TimeFilter.custom) {
      GetDialogHelper.generalDialog(
        child: const CustomDataSelectorDialog(),
        context: Get.context!,
      );
    }
    selectedTimeFilter = time;

    update([DashboardIds.dashboardHeaderFilter]);
  }

  toggleApplyTimeFilter() {
    applyEnabled = true;
    update([DashboardIds.dashboardHeaderFilter]);
  }

  //when time filter is custom
  DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  int totalProducts = 10;
  int totalCategories = 420;
  int totalSubcategories = 420;
  int totalOrders = 10;
  int totalWarehouses = 10;
  int totalSuppliers = 10;
  int totalLowstocks = 10;

  List<ChartDataEntity> categoryChartData = [
    ChartDataEntity(
      xAxisLabel: Category.officeSupplies.getName,
      xAxisLabelArabic: Category.officeSupplies.getArabicName,
      yAxisLabel: 50,
      chartItemColor: AppColors.primary,
    ),
    ChartDataEntity(
      xAxisLabel: Category.equipment.getName,
      xAxisLabelArabic: Category.equipment.getArabicName,
      yAxisLabel: 30,
      chartItemColor: AppColors.secondaryPrimary,
    ),
    ChartDataEntity(
      xAxisLabel: Category.intangible.getName,
      xAxisLabelArabic: Category.intangible.getArabicName,
      yAxisLabel: 80,
      chartItemColor: AppColors.black,
    ),
  ];
  List<ChartDataEntity> subcategoryChartData = [
    ChartDataEntity(
      xAxisLabel: SubCategory.laptop.getName,
      xAxisLabelArabic: SubCategory.laptop.getArabicName,
      yAxisLabel: 50,
      chartItemColor: AppColors.primary,
    ),
    ChartDataEntity(
      xAxisLabel: SubCategory.paperProduct.getName,
      xAxisLabelArabic: SubCategory.paperProduct.getArabicName,
      yAxisLabel: 30,
      chartItemColor: AppColors.secondaryPrimary,
    ),
    ChartDataEntity(
      xAxisLabel: SubCategory.bathroomSupplies.getName,
      xAxisLabelArabic: SubCategory.bathroomSupplies.getArabicName,
      yAxisLabel: 30,
      chartItemColor: AppColors.secondaryPrimary,
    ),
  ];

  List<ChartDataEntity> expensesHistoryBarChartData = [
    ChartDataEntity(
      xAxisLabel: 'Jan',
      xAxisLabelArabic: 'يناير',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Feb',
      xAxisLabelArabic: 'فبراير',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Mar',
      xAxisLabelArabic: 'مارس',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Apr',
      xAxisLabelArabic: 'أبريل',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'May',
      xAxisLabelArabic: 'مايو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Jun',
      xAxisLabelArabic: 'يونيو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Jul',
      xAxisLabelArabic: 'يوليو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Aug',
      xAxisLabelArabic: 'اغسطس',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Sep',
      xAxisLabelArabic: 'سبتمبر',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Oct',
      xAxisLabelArabic: 'اكتوبر',
      yAxisLabel: 10,
    ),
    ChartDataEntity(
      xAxisLabel: 'Nov',
      xAxisLabelArabic: 'نوفمبر',
      yAxisLabel: 10,
    ),
    ChartDataEntity(
      xAxisLabel: 'Dec',
      xAxisLabelArabic: 'ديسمبر',
      yAxisLabel: 10,
    ),
  ];
  List<ChartDataEntity> lowStockBarChartData = [
    ChartDataEntity(
      xAxisLabel: 'Generator',
      xAxisLabelArabic: 'Generator',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Printer',
      xAxisLabelArabic: 'Printer',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Router',
      xAxisLabelArabic: 'Router',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Computer',
      xAxisLabelArabic: 'Computer',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Projector',
      xAxisLabelArabic: 'Projector',
      yAxisLabel: 20,
    ),
  ];
  List<ChartDataEntity> suppliersBarChartData = [
    ChartDataEntity(
      xAxisLabel: 'Office Essentials Ltd.',
      xAxisLabelArabic: 'Office Essentials Ltd.',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Global Electronics Co',
      xAxisLabelArabic: 'Global Electronics Co',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'PrintPlus Suppliers',
      xAxisLabelArabic: 'PrintPlus Suppliers',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'DriveSource Distribution',
      xAxisLabelArabic: 'DriveSource Distribution',
      yAxisLabel: 20,
    ),
  ];
  List<ChartDataEntity> depsBarChartData = [
    ChartDataEntity(
      xAxisLabel: Departments.marketing.getName,
      xAxisLabelArabic: Departments.marketing.getName,
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: Departments.software.getName,
      xAxisLabelArabic: Departments.software.getName,
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: Departments.finance.getName,
      xAxisLabelArabic: Departments.finance.getName,
      yAxisLabel: 20,
    ),
  ];
  List<ChartDataEntity> requestsHistoryBarChartData = [
    ChartDataEntity(
      xAxisLabel: 'Jan',
      xAxisLabelArabic: 'يناير',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Feb',
      xAxisLabelArabic: 'فبراير',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Mar',
      xAxisLabelArabic: 'مارس',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Apr',
      xAxisLabelArabic: 'أبريل',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'May',
      xAxisLabelArabic: 'مايو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Jun',
      xAxisLabelArabic: 'يونيو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Jul',
      xAxisLabelArabic: 'يوليو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Aug',
      xAxisLabelArabic: 'اغسطس',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Sep',
      xAxisLabelArabic: 'سبتمبر',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Oct',
      xAxisLabelArabic: 'اكتوبر',
      yAxisLabel: 10,
    ),
    ChartDataEntity(
      xAxisLabel: 'Nov',
      xAxisLabelArabic: 'نوفمبر',
      yAxisLabel: 10,
    ),
    ChartDataEntity(
      xAxisLabel: 'Dec',
      xAxisLabelArabic: 'ديسمبر',
      yAxisLabel: 10,
    ),
  ];
  List<ChartDataEntity> maintenanceHistoryBarChartData = [
    ChartDataEntity(
      xAxisLabel: 'Jan',
      xAxisLabelArabic: 'يناير',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Feb',
      xAxisLabelArabic: 'فبراير',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Mar',
      xAxisLabelArabic: 'مارس',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Apr',
      xAxisLabelArabic: 'أبريل',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'May',
      xAxisLabelArabic: 'مايو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Jun',
      xAxisLabelArabic: 'يونيو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Jul',
      xAxisLabelArabic: 'يوليو',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Aug',
      xAxisLabelArabic: 'اغسطس',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Sep',
      xAxisLabelArabic: 'سبتمبر',
      yAxisLabel: 20,
    ),
    ChartDataEntity(
      xAxisLabel: 'Oct',
      xAxisLabelArabic: 'اكتوبر',
      yAxisLabel: 10,
    ),
    ChartDataEntity(
      xAxisLabel: 'Nov',
      xAxisLabelArabic: 'نوفمبر',
      yAxisLabel: 10,
    ),
    ChartDataEntity(
      xAxisLabel: 'Dec',
      xAxisLabelArabic: 'ديسمبر',
      yAxisLabel: 10,
    ),
  ];
  Category? selectedMaintenanceCategory;
  InventoryCategories? selectedExpensesInventoryType;
  InventoryCategories? selectedReqeustInventoryType;
  InventoryCategories? selectedDepInventoryType;
  InventoryCategories? selectedStockInventoryType;
  RequestStatus? selectedRequestStatus;
  updateRequestStatus(RequestStatus? status) {
    selectedRequestStatus = status;

    update([DashboardIds.barchartFilters]);
  }

  updateExpensesInventoryType(InventoryCategories? type) {
    selectedExpensesInventoryType = type;

    update([DashboardIds.barchartFilters]);
  }

  updateReqeustInventoryType(InventoryCategories? type) {
    selectedReqeustInventoryType = type;

    update([DashboardIds.barchartFilters]);
  }

  updateDepInventoryType(InventoryCategories? type) {
    selectedDepInventoryType = type;

    update([DashboardIds.barchartFilters]);
  }

  updateStockInventoryType(InventoryCategories? type) {
    selectedStockInventoryType = type;

    update([DashboardIds.barchartFilters]);
  }

  updateMaintenanceCategory(Category? category) {
    selectedMaintenanceCategory = category;

    update([DashboardIds.barchartFilters]);
  }

  SubCategory? selectedMaintenanceSubcategory;

  updateMaintenanceSubcategory(SubCategory? subcategory) {
    selectedMaintenanceSubcategory = subcategory;

    update([DashboardIds.barchartFilters]);
  }

  Category? selectedStockCategory;

  updateStockCategory(Category? category) {
    selectedStockCategory = category;

    update([DashboardIds.barchartFilters]);
  }

  SubCategory? selectedStockSubcategory;

  updateStockSubcategory(SubCategory? subcategory) {
    selectedStockSubcategory = subcategory;

    update([DashboardIds.barchartFilters]);
  }
}
