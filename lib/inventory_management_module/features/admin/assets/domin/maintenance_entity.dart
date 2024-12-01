import '../../../../features/employee/Assets/domain/entity/assets_entity.dart';

import '../../../employee/home/domain/user_entity.dart';
import '../../../products/domain/product_entity.dart';

class MaintenanceEntity {
  DateTime maintenanceStartDate;
  DateTime maintenanceEndDate;
  DateTime nextScheduledMaintenance;
  DateTime requestedMaintenance;
  DateTime maintenanceSchedule;
  MaintenanceEntity(
      {required this.maintenanceStartDate,
      required this.maintenanceEndDate,
      required this.nextScheduledMaintenance,
      required this.requestedMaintenance,
      required this.maintenanceSchedule});
}
