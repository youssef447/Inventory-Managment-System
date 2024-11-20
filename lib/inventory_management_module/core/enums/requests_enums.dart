//Youssef Ashraf
//Enums of Requests

import '../constants/app_assets.dart';
//------------------------Request Status------------------------

enum RequestStatus {
  approved,
  cancelled,
  pending,
  rejected,
}

extension GetName on RequestStatus {
  String get getName {
    switch (this) {
      case RequestStatus.pending:
        return 'Pending';
      case RequestStatus.approved:
        return 'Approved';
      case RequestStatus.cancelled:
        return 'Canceled';
      case RequestStatus.rejected:
        return 'Rejected';
    }
  }
}

extension GetAsset on RequestStatus {
  String get getAsset {
    switch (this) {
      case RequestStatus.pending:
        return AppAssets.pending;
      case RequestStatus.approved:
        return AppAssets.approved;
      case RequestStatus.cancelled:
        return AppAssets.canceled;
      case RequestStatus.rejected:
        return AppAssets.rejected;
    }
  }
}
//------------------------Request Actions------------------------

enum RequestActions {
  requestAsset,
  returnAsset,
  repairAsset,
  routineMaintenance,
  expiredConsumables,
  returnConsumables,
  requestConsumables
}

extension GetReqActionName on RequestActions {
  String get getName {
    switch (this) {
      case RequestActions.requestAsset:
        return 'Request Asset';
      case RequestActions.returnAsset:
        return 'Return Asset';
      case RequestActions.routineMaintenance:
        return 'Routine Maintenance';
      case RequestActions.repairAsset:
        return 'Repair Asset';
      case RequestActions.requestConsumables:
        return 'Request Consumables';
      case RequestActions.returnConsumables:
        return 'Return Consumables';
      case RequestActions.expiredConsumables:
        return 'Expiry Consumables';
    }
  }
}
//------------------------Request Priority Types ------------------------

enum RequestPriorityTypes {
  urgent,
  high,
  medium,
  low,
}

extension GetriorityType on RequestPriorityTypes {
  String get getName {
    switch (this) {
      case RequestPriorityTypes.high:
        return 'High';
      case RequestPriorityTypes.urgent:
        return 'Urgent';
      case RequestPriorityTypes.low:
        return 'Low';
      case RequestPriorityTypes.medium:
        return 'Medium';
    }
  }
}

//------------------------Issue Types------------------------
enum IssueTypes { mechanical, electrical, software, performance, safety }

extension GetIssuName on IssueTypes {
  String get getName {
    switch (this) {
      case IssueTypes.mechanical:
        return 'Mechanical';
      case IssueTypes.electrical:
        return 'Electrical';
      case IssueTypes.software:
        return 'Software';
      case IssueTypes.performance:
        return 'Performance';
      case IssueTypes.safety:
        return 'Safety';
    }
  }
}
