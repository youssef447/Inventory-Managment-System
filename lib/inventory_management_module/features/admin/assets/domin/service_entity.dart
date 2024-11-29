
import 'package:inventory_management/inventory_management_module/features/employee/Assets/domain/entity/assets_entity.dart';

import '../../../employee/home/domain/user_entity.dart';
import '../../../products/domain/product_entity.dart';

class ServiceEntity {
  UserEntity userEntity = UserEntity(
    firstName: 'Ahmed',
    lastName: 'Mohammed',
    id: '',
  );
  AssetsEntity assetsEntity;
  String issueType;
  DateTime assignedDate;
  DateTime returnDate;
  DateTime lastUpdate;

  ServiceEntity({
    required this.assignedDate,
    required this.returnDate,
    required this.lastUpdate,
    required this.assetsEntity,
    required this.issueType,
  });
}
