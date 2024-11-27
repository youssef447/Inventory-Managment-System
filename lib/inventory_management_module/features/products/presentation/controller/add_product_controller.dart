
// Date: 25/11/2024
// By:Mohamed Ashraf


import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/features/employee/home/domain/user_entity.dart';
import 'package:inventory_management/inventory_management_module/features/products/presentation/controller/products_controller.dart';
import '../../../../core/constants/approve_cycle.dart';
import '../../../../core/enums/requests_enums.dart';
import '../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../../employee/requests/entities/attachment_entity.dart';
import '../../constants/ids.dart';
import '../../domain/product_entity.dart';
import '../../domain/subEntities/contractDetailsEntity.dart';
import '../../domain/subEntities/storage_location_entity.dart';
import '../../domain/subEntities/supplier_entity.dart';
import '../../enums/product_enums.dart';
import '../constant/add_Product_ids_constant.dart';



class AddProductController extends GetxController {




  ///-------------- drop down--------------------------------------------------------------------
  // -------------- product type  -----------
  List<ProductTypes> productType = [
    ProductTypes.asset,
    ProductTypes.consumables,
  ];
  Rxn<ProductTypes> productTypeValue = Rxn<ProductTypes>(ProductTypes.asset);
  updateProductTypeValue(ProductTypes value) {
    productTypeValue.value = value;
  }


  // -------------- supplierName   -----------
  List<String> category = [
    'Electronic',
    'Event Planning',
    'Eduction',
  ];
  Rxn<String> categoryValue = Rxn<String>();
  updateCategoryValue(String value) {
    categoryValue.value = value;
  }

  // -------------- product type  -----------
  List<Currency> currency = [
    Currency.egy,
    Currency.esd,
    Currency.eur,

  ];
  Rxn<Currency> currencyValue = Rxn<Currency>();
  updateCurrencyValue(Currency value) {
    currencyValue.value = value;
  }

  // -------------- supplierName   -----------
  List<String> supplierName = [
    'mohamed',
    'ahmed',
    'ali',
  ];
  Rxn<String> supplierNameValue = Rxn<String>();
  updateSupplierNameValue(String value) {
    supplierNameValue.value = value;
  }

  // -------------- storageRequirement   -----------
  List<String> storageRequirement = [
    'yes',
    'no',
  ];
  Rxn<String> storageRequirementValue = Rxn<String>();
  updateStorageRequirementValue(String value) {
    storageRequirementValue.value = value;
  }

  // -------------- unitOfMeasurement   -----------
  List<UnitOfMeasurement> unitOfMeasurement = [
    UnitOfMeasurement.milligram,
    UnitOfMeasurement.gram,
    UnitOfMeasurement.kilogram,
  ];
  Rxn<UnitOfMeasurement>  unitOfMeasurementValue = Rxn<UnitOfMeasurement>();
  updateUnitOfMeasurementValue(UnitOfMeasurement value) {
     unitOfMeasurementValue.value = value;
  }

  // -------------- storageLocation  -----------
  List<StorageLocation> storageLocation = [
    StorageLocation.room1,
    StorageLocation.room2,
  ];
  Rxn<StorageLocation>  storageLocationValue = Rxn<StorageLocation>();
  updateStorageLocationValue(StorageLocation value) {
    storageLocationValue.value = value;
  }

  // -------------- switch approval  -----------

  var isApproval = true;
  void toggleApproval() {
    isApproval = !isApproval;
    update();
  }







  ///-------------------- TextEditingController --------------
TextEditingController orderIdController = TextEditingController();
TextEditingController productIdController = TextEditingController();
TextEditingController categoryController = TextEditingController();
TextEditingController subCategoryController = TextEditingController();
TextEditingController brandController = TextEditingController();
TextEditingController modelController = TextEditingController();
TextEditingController expirationDateController = TextEditingController();
TextEditingController quantityController = TextEditingController();
TextEditingController unitCostController = TextEditingController();
TextEditingController currencyController = TextEditingController();
TextEditingController supplierNameController = TextEditingController();
TextEditingController storageRequirementController = TextEditingController();
TextEditingController storageLocationController = TextEditingController();
TextEditingController unitOfMeasurementController = TextEditingController();
TextEditingController expectedLifetimeController = TextEditingController();
TextEditingController stockOnHandController = TextEditingController();
TextEditingController additionalNoteController = TextEditingController();
TextEditingController reorderLevelController = TextEditingController();
TextEditingController reorderQuantityController = TextEditingController();


  List<Map<String, String>> inventoryList = [];



  void addAssetItem() {
    ProductEntity item = ProductEntity(
        id: productIdController.text,
        productType: ProductType.asset,
        additionalNotes: additionalNoteController.text,
        storage: [
          StorageLocationAndQuantityEntity(
            locationName: storageLocationController.text,
            quantity: 10,
          ),
          StorageLocationAndQuantityEntity(
            locationName: 'Room A13',
            quantity: 10,
          ),
          StorageLocationAndQuantityEntity(
            locationName: 'Room A13',
            quantity: 10,
          ),
        ],
        assetEntity: AssetsEntity(
          assetName: brandController.text + modelController.text,
          category: categoryController.text,
          subcategory: subCategoryController.text,
          model: modelController.text,
          dateReceived: DateTime.now(),
          quantity: quantityController.text,
          status: 'InUse',
          brand: brandController.text,
        ),
        supplier: SupplierEntity(
          supplierName: supplierNameController.text,
          postalCode: '1313',
          city: 'Cairo',
          country: 'Egypt',
          email: 'jCgQ5@example.com',
          firstName: 'Youssef',
          lastName: 'Ashraf',
          phoneNumber: '010100101010',
          supplierId: '110',
          stateOrProvince: 'NA',
          contractDetails: ContractdetailsEntity(
            attachmentEntity:
            AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
            endDate: DateTime.now(),
            startDate: DateTime.now(),
          ),
        ),
        totalQuantity: 20,
        currency: currencyController.text,
        unitCost: 2,
        expectedLifeTime: DateTime.now(),
        productSpecifications: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ],
        productWaranties: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ]);
    Get.find<ProductsController>().products.add(item);
    clearControllers();
   update([ProductsIds.productsTab]);
  }


  void addConsumableItem() {
    ProductEntity item = ProductEntity(
        id: productIdController.text,
        productType: ProductType.consumable,
        additionalNotes: additionalNoteController.text,
        storage: [
          StorageLocationAndQuantityEntity(
            locationName: storageLocationController.text,
            quantity: 10,
          ),
          StorageLocationAndQuantityEntity(
            locationName: 'Room A13',
            quantity: 10,
          ),
          StorageLocationAndQuantityEntity(
            locationName: 'Room A13',
            quantity: 10,
          ),
        ],
        consumablesEntity: ConsumablesEntity(
          consumableId: productIdController.text,
          category: categoryController.text,
          subcategory: subCategoryController.text,
          model: modelController.text,
          dateReceived: DateTime.now(),
          quantity: quantityController.text,
          status: 'InUse',
          brand: brandController.text,
            name: brandController.text + modelController.text,
          unitOfMeasurement: unitOfMeasurementController.text,
          usageFrequency: 'daily',
        ),
        supplier: SupplierEntity(
          supplierName: supplierNameController.text,
          postalCode: '1313',
          city: 'Cairo',
          country: 'Egypt',
          email: 'jCgQ5@example.com',
          firstName: 'Youssef',
          lastName: 'Ashraf',
          phoneNumber: '010100101010',
          supplierId: '110',
          stateOrProvince: 'NA',
          contractDetails: ContractdetailsEntity(
            attachmentEntity:
            AttachmentEntity(file: File('assets/dummyFile/example.pdf')),
            endDate: DateTime.now(),
            startDate: DateTime.now(),
          ),
        ),
        totalQuantity: 20,
        currency: currencyController.text,
        unitCost: 2,
        expectedLifeTime: DateTime.now(),
        productSpecifications: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ],
        productWaranties: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ]);
    Get.find<ProductsController>().products.add(item);
    clearControllers();
    update([ProductsIds.productsTab]);
  }

  void clearControllers() {
    orderIdController.clear();
    productIdController.clear();
    categoryController.clear();
    subCategoryController.clear();
    brandController.clear();
    modelController.clear();
    expirationDateController.clear();
    quantityController.clear();
    unitCostController.clear();
    currencyController.clear();
    supplierNameController.clear();
    storageRequirementController.clear();
    storageLocationController.clear();
    unitOfMeasurementController.clear();
    expectedLifetimeController.clear();
    stockOnHandController.clear();
    additionalNoteController.clear();
  }



  //------------ Product Specification Uploaded Attachments ------------
  List<AttachmentEntity> attachments = [];
  uploadAttachments() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      attachments.addAll(result.files.map((e) {
        String fileName = File(e.path!).path.split('/').last;
        String extension = fileName.split('.').last;
        double totalSize = File(e.path!).lengthSync() / (1024 * 1024);

        return AttachmentEntity(
            file: File(e.path!),
            fileName: fileName,
            extension: extension,
            totalSize: totalSize);
      }).toList());
      update([AddProductIdsConstant.specificationAttachments]);
      update();
    }
  }

  removeAttachment(AttachmentEntity model) {
    final index =
    attachments.indexWhere((element) => element.fileName == model.fileName);

    attachments.removeAt(index);
    update([AddProductIdsConstant.specificationAttachments]);
  }


  //------------ Product Warranty Uploaded Attachments ------------
  List<AttachmentEntity> warrantyAttachments = [];
  uploadWarrantyAttachments() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      warrantyAttachments.addAll(result.files.map((e) {
        String fileName = File(e.path!).path.split('/').last;
        String extension = fileName.split('.').last;
        double totalSize = File(e.path!).lengthSync() / (1024 * 1024);

        return AttachmentEntity(
            file: File(e.path!),
            fileName: fileName,
            extension: extension,
            totalSize: totalSize);
      }).toList());
      update([AddProductIdsConstant.warrantyAttachments]);
      update();
    }
  }

  removeWarrantyAttachment(AttachmentEntity model) {
    final index =
    warrantyAttachments.indexWhere((element) => element.fileName == model.fileName);

    warrantyAttachments.removeAt(index);
    update([AddProductIdsConstant.warrantyAttachments]);
  }

  void changeApprovalStatusById(approvalId, String s, BuildContext context) {}

}


