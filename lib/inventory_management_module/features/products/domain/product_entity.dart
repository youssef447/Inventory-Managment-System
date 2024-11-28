import '../../../core/enums/stock_enums.dart';
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

  StockStatus stockStatus;
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
  final DateTime lastUpdate = DateTime.now();
  String storageRequirement;
  String status;
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
    this.stockStatus = StockStatus.inStock,
    this.status = 'Maintenance',
    this.storageRequirement = 'Electronics',
    this.additionalNotes,
  });
}
