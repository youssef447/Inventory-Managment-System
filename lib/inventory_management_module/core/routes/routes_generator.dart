import 'package:flutter/material.dart';

import '../../features/admin/approval/presentation/ui/page/mobile/mobile_admin_home_approval_page.dart';
import '../../features/admin/approval/presentation/ui/page/tablet/tablet_admin_home_approval_page.dart';
import '../../features/admin/assets/presentation/ui/pages/mobile/mobile_admin_asset_details.dart';
import '../../features/admin/assets/presentation/ui/pages/mobile/mobile_admin_assigned_details.dart';
import '../../features/admin/assets/presentation/ui/pages/mobile/mobile_service_history_page.dart';
import '../../features/admin/assets/presentation/ui/pages/tablet/tablet_admin_asset_details_page.dart';
import '../../features/admin/assets/presentation/ui/pages/tablet/tablet_admin_assigned_details.dart';
import '../../features/admin/assets/presentation/ui/pages/tablet/tablet_service_history_page.dart';
import '../../features/admin/consumable/presentation/ui/pages/mobile/mobile_admin_assigned_consumable_details.dart';
import '../../features/admin/consumable/presentation/ui/pages/mobile/mobile_admin_consumable_details.dart';
import '../../features/admin/consumable/presentation/ui/pages/tablet/tablet_admin_assigned_consumable_details.dart';
import '../../features/admin/consumable/presentation/ui/pages/tablet/tablet_admin_consumable_details_page.dart';
import '../../features/admin/dashboard/presentaton/ui/pages/mobile/mobile_dashboard_page.dart';
import '../../features/admin/dashboard/presentaton/ui/pages/tablet/tablet_dashboard_page.dart';
import '../../features/admin/employees/presentation/ui/pages/mobile/mobile_admin_employee_details_page.dart';
import '../../features/admin/employees/presentation/ui/pages/mobile/mobile_admin_employees_page.dart';
import '../../features/admin/employees/presentation/ui/pages/mobile/mobile_track_requests_details_page.dart';
import '../../features/admin/employees/presentation/ui/pages/tablet/tablet_admin_employee_details_page.dart';
import '../../features/admin/employees/presentation/ui/pages/tablet/tablet_admin_employees_page.dart';
import '../../features/admin/employees/presentation/ui/pages/tablet/tablet_track_requests_details_page.dart';
import '../../features/admin/home/presentation/ui/page/mobile/mobile_admin_home_page.dart';
import '../../features/admin/home/presentation/ui/page/tablet/tablet_admin_home_page.dart';
import '../../features/admin/invoice/presentation/ui/pages/mobile/mobile_invoice_details_page.dart';
import '../../features/admin/invoice/presentation/ui/pages/tablet/tablet_invoice_details_page.dart';
import '../../features/admin/invoice/presentation/ui/pages/mobile/mobile_invoice_page.dart';
import '../../features/admin/invoice/presentation/ui/pages/tablet/tablet_invoice_page.dart';
import '../../features/admin/orders/presentation/ui/pages/mobile/mobile_new_order_form_page.dart';
import '../../features/admin/orders/presentation/ui/pages/mobile/mobile_new_order_page.dart';
import '../../features/admin/orders/presentation/ui/pages/tablet/tablet_new_order_page.dart';
import '../../features/admin/orders/presentation/ui/pages/tablet/tablet_new_order_form_page.dart';
import '../../features/admin/storage/presentation/ui/pages/mobile/mobile_storage_form_page.dart';
import '../../features/admin/storage/presentation/ui/pages/tablet/tablet_storage_form_page.dart';
import '../../features/admin/suppliers/presentation/ui/pages/mobile/mobile_supplier_form_page.dart';
import '../../features/admin/suppliers/presentation/ui/pages/tablet/tablet_supplier_form_page.dart';
import '../../features/employee/Assets/presentation/ui/pages/mobile/mobile_assets_details.dart';
import '../../features/employee/consumables/presentation/ui/pages/mobile/mobile_consumables_details_page.dart';
import '../../features/employee/home/presentation/ui/page/mobile/mobile_home_page.dart';
import '../../features/employee/home/presentation/ui/page/tablet/tablet_home_page.dart';
import '../../features/employee/request_new_asset/presentation/ui/pages/mobile/mobile_new_request_page.dart';
import '../../features/employee/request_new_asset/presentation/ui/pages/mobile/mobile_request_form_page.dart';
import '../../features/employee/request_new_asset/presentation/ui/pages/tablet/tablet_new_request_page.dart';
import '../../features/employee/request_new_asset/presentation/ui/pages/tablet/tablet_request_form_page.dart';
import '../../features/employee/request_new_consumable/presentation/ui/pages/mobile/mobile_new_request_page.dart';
import '../../features/employee/request_new_consumable/presentation/ui/pages/mobile/mobile_request_form_page.dart';
import '../../features/employee/request_new_consumable/presentation/ui/pages/tablet/tablet_new_request_page.dart';
import '../../features/employee/request_new_consumable/presentation/ui/pages/tablet/tablet_request_form_page.dart';
import '../../features/employee/track_request/presentation/ui/pages/mobile/mobile_track_requests_details_page.dart';
import '../../features/employee/track_request/presentation/ui/pages/mobile/mobile_track_requests_page.dart';
import '../../features/employee/track_request/presentation/ui/pages/tablet/tablet_track_request_details_page.dart';
import '../../features/employee/track_request/presentation/ui/pages/tablet/tablet_track_requests_page.dart';
import '../../features/products/presentation/ui/pages/mobile/mobile_product_details_page.dart';
import '../../features/products/presentation/ui/pages/tablet/tablet_product_details_page.dart';
import 'app_routes.dart';
import '../../features/approval/presentation/ui/pages/mobile/mobile_approval_page.dart';
import '../../features/approval/presentation/ui/pages/tablet/tablet_approval_page.dart';
import '../helpers/responsive_helper.dart';
import 'route_arguments.dart';

//Youssef Ashraf
///Represents The Route Generator Configurations with custom page transitions
enum PageTransitionType {
  fade,
  slideFromRight,
  slideFromLeft,
  scale,
}

abstract class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    // Get arguments and route name
    final args = settings.arguments as Map<String, dynamic>? ?? {};
    final routeName = settings.name;

    // Define your routes with corresponding transitions
    switch (routeName) {
      case Routes.home:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileHomePage(),
            tabletWidget: TabletHomePage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.requestAsset:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileNewRequestPage(
              requestAction: args[RouteArguments.requestAction],
            ),
            tabletWidget: TabletNewRequestPage(
              requestAction: args[RouteArguments.requestAction],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.requestConsumable:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileNewConsumableRequestPage(
              requestAction: args[RouteArguments.requestAction],
            ),
            tabletWidget: TabletNewConsumableRequestPage(
              requestAction: args[RouteArguments.requestAction],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.newRequestAsset:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileRequestFormPage(
              model: args[RouteArguments.assetModel],
              requestAction: args[RouteArguments.requestAction],
            ),
            tabletWidget: TabletRequestFormPage(
              model: args[RouteArguments.assetModel],
              requestAction: args[RouteArguments.requestAction],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.newRequestConsumable:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileRequestConsumableFormPage(
              model: args[RouteArguments.consumableModel],
              requestAction: args[RouteArguments.requestAction],
            ),
            tabletWidget: TabletRequestConsumableFormPage(
              model: args[RouteArguments.consumableModel],
              requestAction: args[RouteArguments.requestAction],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.trackRequest:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileTrackRequestsPage(),
            tabletWidget: TabletTrackRequestsPage(),
          ),
          PageTransitionType.fade,
        );

      case Routes.trackDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileTrackRequestDetailsPage(
              model: args[RouteArguments.requestModel],
            ),
            tabletWidget: TabletTrackRequestDetailsPage(
              model: args[RouteArguments.requestModel],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.assetsDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAssetsDetails(
              index: args[RouteArguments.assetsModelIndex],
              // readOnly: args['readOnly'],
            ),
            tabletWidget: MobileAssetsDetails(
              index: args[RouteArguments.assetsModelIndex],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.consumablesDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileConsumablesDetailsPage(
              index: args[RouteArguments.consumablesModelIndex],
              // readOnly: args['readOnly'],
            ),
            tabletWidget: MobileConsumablesDetailsPage(
              index: args[RouteArguments.consumablesModelIndex],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.approval:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileApprovalPage(),
            tabletWidget: TabletApprovalPage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.adminHome:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileAdminHomePage(),
            tabletWidget: TabletAdminHomePage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.productDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileProductDetailsPage(
              product: args[RouteArguments.product],
            ),
            tabletWidget: TabletProductDetailsPage(
              product: args[RouteArguments.product],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.adminAssetDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAdminAssetDetails(
              assetsEntity: args[RouteArguments.asset],
            ),
            tabletWidget: TabletAdminAssetDetailsPage(
              assetsEntity: args[RouteArguments.asset],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.adminAssetAssignedDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAdminAssignedDetails(
              assignedUser: args[RouteArguments.adminAssetAssignedDetails],
            ),
            tabletWidget: TabletAdminAssignedDetails(
              assignedUser: args[RouteArguments.adminAssetAssignedDetails],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.employees:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileAdminEmployeesPage(),
            tabletWidget: TabletAdminEmployeesPage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.employeeDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAdminEmployeeDetailsPage(
              userEntity: args[RouteArguments.userEntity],
            ),
            tabletWidget: TabletAdminEmployeeDetailsPage(
              userEntity: args[RouteArguments.userEntity],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.employeeTrackRequestDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAdminTrackRequestDetailsPage(
              model: args[RouteArguments.requestModel],
            ),
            tabletWidget: TabletAdminTrackRequestDetailsPage(
              model: args[RouteArguments.requestModel],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.adminApprovalDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAdminTrackRequestDetailsPage(
              model: args[RouteArguments.adminApprovalDetailsArg],
            ),
            tabletWidget: TabletAdminTrackRequestDetailsPage(
              model: args[RouteArguments.adminApprovalDetailsArg],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.newOrder:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileNewOrderPage(),
            tabletWidget: TabletNewOrderPage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.newOrderForm:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileNewOrderFormPage(
              products: args[RouteArguments.product],
            ),
            tabletWidget: TabletNewOrderFormPage(
              products: args[RouteArguments.product],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.invoices:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileInvoicesPage(),
            tabletWidget: TabletInvoicesPage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.invoiceDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            tabletWidget: TabletInvoiceDetailsPage(
              invoice: args[RouteArguments.invoice],
            ),
            mobileWidget: MobileInvoiceDetailsPage(
              invoice: args[RouteArguments.invoice],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.dashboard:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileDashboardPage(),
            tabletWidget: TabletDashboardPage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.supplierForm:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileSupplierFormPage(
              supplier: args[RouteArguments.supplier],
            ),
            tabletWidget: TabletSupplierFormPage(
              supplier: args[RouteArguments.supplier],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.storageForm:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileStorageFormPage(
              storage: args[RouteArguments.storage],
            ),
            tabletWidget: TabletStorageFormPage(
              storage: args[RouteArguments.storage],
            ),
          ),
          PageTransitionType.fade,
        );

      case Routes.adminConsumablesDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAdminConsumableDetails(
              consumablesEntity: args[RouteArguments.consumables],
            ),
            tabletWidget: TabletAdminConsumableDetailsPage(
              consumablesEntity: args[RouteArguments.consumables],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.adminConsumablesAssignedDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileAdminAssignedConsumableDetails(
              assignedUser:
                  args[RouteArguments.adminConsumablesAssignedDetails],
            ),
            tabletWidget: TabletAdminConsumableDetails(
              assignedUser:
                  args[RouteArguments.adminConsumablesAssignedDetails],
            ),
          ),
          PageTransitionType.fade,
        );
      case Routes.adminHomeApproval:
        return _buildPageRoute(
          const ResponsiveHelper(
            mobileWidget: MobileAdminHomeApprovalPage(),
            tabletWidget: TabletAdminHomeApprovalPage(),
          ),
          PageTransitionType.fade,
        );
      case Routes.adminAssetServiceHistoryDetails:
        return _buildPageRoute(
          ResponsiveHelper(
            mobileWidget: MobileServiceHistoryPage(
                serviceEntity:
                    args[RouteArguments.adminAssetServiceHistoryDetails]),
            tabletWidget: TabletServiceHistoryPage(
                serviceEntity:
                    args[RouteArguments.adminAssetServiceHistoryDetails]),
          ),
          PageTransitionType.fade,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Unknown route: $routeName')),
          ),
        );
    }
  }

  // Custom method to build a route with a transition
  static PageRouteBuilder<dynamic> _buildPageRoute(
      Widget page, PageTransitionType transitionType) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        switch (transitionType) {
          case PageTransitionType.fade:
            return FadeTransition(opacity: animation, child: child);
          case PageTransitionType.slideFromRight:
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );
          case PageTransitionType.slideFromLeft:
            return SlideTransition(
              position: animation.drive(
                Tween(begin: const Offset(-1, 0), end: Offset.zero)
                    .chain(CurveTween(curve: Curves.easeInOut)),
              ),
              child: child,
            );
          case PageTransitionType.scale:
            return ScaleTransition(scale: animation, child: child);
          default:
            return child; // No animation
        }
      },
    );
  }
}
