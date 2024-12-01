import '../../employee/home/domain/user_entity.dart';
import '../../employee/requests/entities/request_entity.dart';
import 'product_entity.dart';

class AssignedUserProductsEntity {
  UserEntity userEntity = UserEntity(
    firstName: 'Ahmed',
    lastName: 'Mohammed',
    id: '',
  );
  ProductEntity productentity;
  DateTime assigneDate;
  DateTime returnDate;
  DateTime lastUpdate;

  int quantityAssigned;
  AssignedUserProductsEntity({
    required this.assigneDate,
    required this.returnDate,
    required this.lastUpdate,
    required this.quantityAssigned,
    required this.productentity,
  });
}
