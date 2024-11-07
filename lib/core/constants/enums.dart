// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum RequiredOptionalStatus {
  required,
  optional,
}

extension RequiredOptionalStatusExtension on RequiredOptionalStatus {
  String get getName {
    switch (this) {
      case RequiredOptionalStatus.required:
        return 'required';
      case RequiredOptionalStatus.optional:
        return 'optional';
    }
  }
}

List<RequiredOptionalStatus> requiredOptionalStatusList = [
  RequiredOptionalStatus.required,
  RequiredOptionalStatus.optional,
];

enum TimeFilter {
  day,
  week,
  month,
  year,
  custom,
}

extension GetName on TimeFilter {
  String get getName {
    switch (this) {
      case TimeFilter.day:
        return 'Day';
      case TimeFilter.week:
        return 'Week';
      case TimeFilter.month:
        return 'Month';
      case TimeFilter.year:
        return 'Year';
      case TimeFilter.custom:
        return 'Custom';
    }
  }
}

enum DepartmentFilter {
  employee,
  manager,
  hr,
}

extension DepartmentFilterExtension on DepartmentFilter {
  String get getName {
    switch (this) {
      case DepartmentFilter.employee:
        return 'Software';
      case DepartmentFilter.manager:
        return 'Marketing';
      case DepartmentFilter.hr:
        return 'HR';
    }
  }
}

// enum LocationFilter {
//   all,
//   branch1,
//   branch2,
//   mainOffice,
// }

// extension LocationFilterExtension on LocationFilter {
//   String get getName {
//     switch (this) {
//       case LocationFilter.all:
//         return 'All';
//       case LocationFilter.branch1:
//         return 'Branch 1';
//       case LocationFilter.branch2:
//         return 'Branch 2';
//       case LocationFilter.mainOffice:
//         return 'Main Office';
//     }
//   }
// }

// // list for all the location filters enums
// List<LocationFilter> locationFilterList = [
//   LocationFilter.all,
//   LocationFilter.branch1,
//   LocationFilter.branch2,
//   LocationFilter.mainOffice,
// ];

enum SortFilter {
  totalTime,
  date,
}

extension SortFilterExtension on SortFilter {
  String get getName {
    switch (this) {
      case SortFilter.totalTime:
        return 'Total Time';
      case SortFilter.date:
        return 'Date';
    }
  }
}

// list for all the sort filters names
List<String> sortFilterListStrings = [
  SortFilter.totalTime.getName,
  SortFilter.date.getName,
];


///////////////////

enum Status {
  maintenance,
  returned,
  inUse,
  expired,
}

extension GetColor on Status {
  Color get getColor {
    switch (this) {
      case Status.maintenance:
        return AppColors.secondaryPrimary;
      case Status.returned:
        return AppColors.primary;
      case Status.inUse:
        return AppColors.green;
      case Status.expired:
        return AppColors.red;
    }
  }
}

extension GetStatusName on Status {
  String get getName {
    switch (this) {
      case Status.maintenance:
        return 'Approved';
      case Status.returned:
        return 'Pending';
      case Status.inUse:
        return 'InUse';
      case Status.expired:
        return 'Expired';
    }
  }
}