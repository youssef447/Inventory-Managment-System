//Youssef Ashraf
//Enums of Requests

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
}

enum RequestPriorityTypes {
  urgent,
  high,
  medium,
  low,
}

enum IssueTypes { mechanical, electrical, software, performance, safety }
