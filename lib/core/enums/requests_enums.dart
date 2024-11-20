//Youssef Ashraf
//Enums of Requests

import 'package:flutter/material.dart';

enum RequestStatus {
  approved,
  cancelled,
  pending,
  rejected,
}

enum RequestActions {
  requestAsset,
  returnAsset,
  repairAsset,
  routineMaintenance,
  expiredConsumables,
  returnConsumables,
  requestConsumables
}

enum RequestPriorityTypes {
  urgent,
  high,
  medium,
  low,
}

enum IssueTypes { mechanical, electrical, software, performance, safety }



