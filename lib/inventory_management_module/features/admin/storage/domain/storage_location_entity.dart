// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../products/domain/product_entity.dart';

class StorageLocationAndQuantityEntity {
  String locationName;
  String locationID;
  int storageCapacity;
  String locationType;
  String city;
  String country;
  String postalCode;
  String stateOrProvince;
  String conditionOfStorage;
  String accessLevel;
  String equipmentAvailable;
  String envControlType;
  List<ProductEntity> products;
  int quantity;
  StorageLocationAndQuantityEntity({
    this.locationName = 'Room A13',
    this.locationID = '0022',
    this.storageCapacity = 1000,
    this.locationType = 'Room',
    this.city = 'Cairo',
    this.country = 'Egy',
    this.postalCode = '213121',
    this.stateOrProvince = 'Not Applicable',
    this.conditionOfStorage = 'Storage Condition',
    this.accessLevel = 'High',
    this.equipmentAvailable = 'Equipment Available',
    this.envControlType = 'Env Type',
    this.quantity = 0,
    this.products = const [],
  });
}
