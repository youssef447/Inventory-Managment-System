import '../../employee/Assets/domain/entity/assets_entity.dart';
import '../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../employee/requests/entities/attachment_entity.dart';
import '../enums/product_enums.dart';
import 'subEntities/storage_location_entity.dart';
import 'subEntities/supplier_entity.dart';

//Youssef Ashraf
///Represents a product entity which can be asset or consumable
class ProductEntity {
  String id;
  ProductType productType;
  bool? requiresApproval;
  AssetsEntity? assetEntity;
  ConsumablesEntity? consumablesEntity;
  List<StorageLocationAndQuantityEntity> storage;
  SupplierEntity supplier;
  int totalQuantity;
  String currency;
  double unitCost;
  DateTime expectedLifeTime;
  List<AttachmentEntity> productSpecifications;
  List<AttachmentEntity> productWaranties;
  String? additionalNotes;
  ProductEntity({
    required this.id,
    required this.productType,
    this.requiresApproval,
    this.assetEntity,
    this.consumablesEntity,
    required this.storage,
    required this.supplier,
    required this.totalQuantity,
    required this.currency,
    required this.unitCost,
    required this.expectedLifeTime,
    required this.productSpecifications,
    required this.productWaranties,
    this.additionalNotes,
  });
}
