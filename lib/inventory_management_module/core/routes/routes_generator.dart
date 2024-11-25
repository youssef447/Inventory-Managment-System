import 'package:flutter/material.dart';


import '../../features/admin/home/presentation/ui/page/tablet/tablet_admin_home.dart';
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
            mobileWidget: SizedBox(),
            tabletWidget: TabletAdminHome(),
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
