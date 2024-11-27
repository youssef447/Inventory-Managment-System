import '../../employee/home/domain/user_entity.dart';
import 'product_entity.dart';

class AssignedUserProductsEntity {
  UserEntity userEntity;
  ProductEntity productentity;
  DateTime assigneDate;
  DateTime returnDate;
  DateTime lastUpdate;

  int quantityAssigned;
  AssignedUserProductsEntity({
    required this.assigneDate,
    required this.returnDate,
    required this.lastUpdate,
    required this.userEntity,
    required this.quantityAssigned,
    required this.productentity,
  });
}
