//Youssef Ashraf
//Enums of Requests

import '../constants/app_assets.dart';
//------------------------Request Status------------------------

enum EmployeeRequestStatus {
  inUse,
  returned,
  retrieved,
  maintenance,
  requested,
}

extension GetEmployeeRequestName on EmployeeRequestStatus {
  String get getName {
    switch (this) {
      case EmployeeRequestStatus.returned:
        return 'Returned';
      case EmployeeRequestStatus.maintenance:
        return 'maintenance';
      case EmployeeRequestStatus.requested:
        return 'Requested';
      case EmployeeRequestStatus.retrieved:
        return 'Retrieved';
      case EmployeeRequestStatus.inUse:
        return 'InUse';
    }
  }
}

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

//------------------------ Product Type ------------------------

enum ProductTypes { asset, consumables }

extension GetProductTypes on ProductTypes {
  String get getName {
    switch (this) {
      case ProductTypes.asset:
        return 'Asset';
      case ProductTypes.consumables:
        return 'Consumables';
    }
  }
}

//------------------------ Product Type ------------------------

enum Currency {
  eur,
  esd,
  egy,
}

extension GetCurrencys on Currency {
  String get getName {
    switch (this) {
      case Currency.eur:
        return 'EUR';
      case Currency.esd:
        return 'ESD';
      case Currency.egy:
        return 'EGY';
    }
  }
}

//------------------------ UnitOfMeasurement ------------------------

enum UnitOfMeasurement {
  milligram,
  gram,
  kilogram,
}

extension GetUnitOfMeasurement on UnitOfMeasurement {
  String get getName {
    switch (this) {
      case UnitOfMeasurement.milligram:
        return 'Milligram';
      case UnitOfMeasurement.gram:
        return 'Gram';
      case UnitOfMeasurement.kilogram:
        return 'Kilogram';
    }
  }
}

//------------------------ UnitOfMeasurement ------------------------

enum StorageLocation { room1, room2 }

extension GetStorageLocation on StorageLocation {
  String get getName {
    switch (this) {
      case StorageLocation.room1:
        return 'Room1';
      case StorageLocation.room2:
        return 'Room2';
    }
  }
}
