// Date: 25/11/2024
// By:Mohamed Ashraf

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/helpers/date_time_helper.dart';
import '../../../../features/products/presentation/controller/products_controller.dart';
import '../../../../core/enums/requests_enums.dart';
import '../../../employee/Assets/domain/entity/assets_entity.dart';
import '../../../employee/consumables/domain/entity/consumables_entity.dart';
import '../../../employee/requests/entities/attachment_entity.dart';
import '../../constants/ids.dart';
import '../../domain/product_entity.dart';
import '../../domain/subEntities/contract_details_entity.dart';
import '../../../admin/storage/domain/storage_location_entity.dart';
import '../../../admin/suppliers/domain/supplier_entity.dart';
import '../../enums/product_enums.dart';
import '../constant/add_Product_ids_constant.dart';

class AddProductController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Initialize the first set of controllers
    storageLocationControllers.add(TextEditingController());
    stockOnHandController.add(TextEditingController());
    selectedStorageLocations.add(Rxn<StorageLocation>());
  }

  bool autoId = true;
  toggleAutomaticIdSwitch(bool v) {
    autoId = v;
    update();
  }

  void loadAssetData(ProductEntity model) {
    orderIdController.text = model.id;
    productIdController.text = model.assetEntity?.assetId ?? '';
    categoryController.text = model.assetEntity?.category ?? '';
    subCategoryController.text = model.assetEntity?.subcategory ?? '';
    brandController.text = model.assetEntity?.brand ?? '';
    modelController.text = model.assetEntity?.model ?? '';
    totalQuantityController.text = model.totalQuantity.toString();
    unitCostController.text = model.unitCost.toString();
    currencyController.text = model.currency;
    supplierNameController.text = model.supplier.firstName;
    additionalNoteController.text = model.additionalNotes ?? '';
    categoryValue = model.assetEntity!.category;
    supplierNameValue = model.assetEntity!.supplierName;
    storageRequirementValue = model.assetEntity!.storageRequirement;
    currencyValue = model.assetEntity!.currency;
    expectedLifetimeController.text = DateTimeHelper.formatDate(model.expectedLifeTime);



  }

  void loadConsumableData(ProductEntity model) {
    orderIdController.text = model.id;
    productIdController.text = model.consumablesEntity?.consumableId ?? '';
    categoryController.text = model.consumablesEntity?.category ?? '';
    subCategoryController.text = model.consumablesEntity?.subcategory ?? '';
    brandController.text = model.consumablesEntity?.brand ?? '';
    modelController.text = model.consumablesEntity?.model ?? '';
    totalQuantityController.text = model.totalQuantity.toString();
    unitCostController.text = model.unitCost.toString();
    currencyController.text = model.currency;
    supplierNameController.text = model.supplier.firstName;
    additionalNoteController.text = model.additionalNotes ?? '';
    categoryValue = model.consumablesEntity!.category;
    supplierNameValue = model.consumablesEntity!.supplierName;
    unitOfMeasurementValue = model.consumablesEntity!.unitOfMeasurement;
    reorderLevelController.text = model.consumablesEntity!.reorderLevel.toString();
    reorderQuantityController.text = model.consumablesEntity!.reorderQuantity.toString();
    expectedLifetimeController.text = DateTimeHelper.formatDate(model.expectedLifeTime);
    expirationDateController.text = DateTimeHelper.formatDate(model.consumablesEntity!.expirationDate!);

  }


  ///-------------- drop down-----------------------
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
  String? categoryValue;
  updateCategoryValue(String value) {
    categoryValue = value;
    update();
  }

  // -------------- product type  -----------
  List<Currency> currency = [
    Currency.egy,
    Currency.esd,
    Currency.eur,
  ];
  Currency? currencyValue;
  updateCurrencyValue(Currency value) {
    currencyValue = value;
    update();
  }

  // -------------- supplierName   -----------
  List<String> supplierName = [
    'mohamed',
    'ahmed',
    'ali',
  ];
  String? supplierNameValue;
  updateSupplierNameValue(String value) {
    supplierNameValue = value;
    update();
  }

  // -------------- storageRequirement   -----------
  List<String> storageRequirement = [
    'Electronic',
    'Another',
  ];
String? storageRequirementValue;
  updateStorageRequirementValue(String value) {
    storageRequirementValue = value;
    update();
  }

  // -------------- unitOfMeasurement   -----------
  List<UnitOfMeasurement> unitOfMeasurement = [
    UnitOfMeasurement.milligram,
    UnitOfMeasurement.gram,
    UnitOfMeasurement.kilogram,
  ];
  UnitOfMeasurement? unitOfMeasurementValue;
  updateUnitOfMeasurementValue(UnitOfMeasurement value) {
    unitOfMeasurementValue = value;
    update();
  }

  // -------------- storageLocation  -----------
  List<StorageLocation> storageLocation = [
    StorageLocation.room1,
    StorageLocation.room2,
  ];
  List<Rxn<StorageLocation>> selectedStorageLocations = [];
  void updateStorageLocationValue(int index, StorageLocation value) {
    selectedStorageLocations[index].value = value;
    update(); // Notify the UI to update the dropdown
  }

  // -------------- switch approval  -----------

  var isApproval = true;
  void toggleApproval() {
    isApproval = !isApproval;
    update();
  }

  //--------------- add More storage location
  int storageLocationCount = 1;
  void addMoreStorage() {
    // Add a new controller for each new entry
    storageLocationControllers.add(TextEditingController());
    stockOnHandController.add(TextEditingController());
    selectedStorageLocations.add(Rxn<StorageLocation>());
    storageLocationCount += 1;
    update(); // Notify the UI to refresh
  }

  ///-------------------- TextEditingController --------------
  TextEditingController orderIdController = TextEditingController();
  TextEditingController orderValueController = TextEditingController();
  TextEditingController productIdController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController subCategoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController totalQuantityController = TextEditingController();
  TextEditingController unitCostController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController supplierNameController = TextEditingController();
  TextEditingController storageRequirementController = TextEditingController();
  List<TextEditingController> storageLocationControllers = [];
  List<TextEditingController> stockOnHandController = [];
  TextEditingController expectedLifetimeController = TextEditingController();
  TextEditingController additionalNoteController = TextEditingController();
  TextEditingController reorderLevelController = TextEditingController();
  TextEditingController reorderQuantityController = TextEditingController();
  TextEditingController unitOfMeasurementController = TextEditingController();

  List<Map<String, String>> inventoryList = [];

  void addAssetItem() {
    ProductEntity item = ProductEntity(
        id: productIdController.text,
        productType: ProductType.asset,
        additionalNotes: additionalNoteController.text,
        storageRequirement: storageRequirementController.text =
            storageRequirementValue.toString(),
        storage: List.generate(
          storageLocationControllers.length,
          (index) => StorageLocationAndQuantityEntity(
            locationName: storageLocationControllers[index]
                .text = selectedStorageLocations[
                    index]
                .value!
                .getName, // Get location name from the corresponding controller
            quantity: int.tryParse(stockOnHandController[index].text) ??
                0, // Parse quantity or default to 0
          ),
        ),
        assetEntity: AssetsEntity(
          assetName: brandController.text + modelController.text,
          category: categoryController.text = categoryValue.toString(),
          subcategory: subCategoryController.text,
          model: modelController.text,
          dateReceived: DateTime.now(),
          quantity: totalQuantityController.text,
          status: 'InUse',
          brand: brandController.text,
        ),
        supplier: SupplierEntity(
          supplierName: supplierNameController.text =
              supplierNameValue.toString(),
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
        currency: currencyController.text = currencyValue!.getName,
        unitCost: double.parse(unitCostController.text),
        expectedLifeTime: DateTime.now(),
        productSpecifications: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ],
        productWaranties: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ]);
    final controller = Get.find<ProductsController>();
    controller.products.add(item); // Add item to the list
    controller.update([ProductsIds.productsTab]);
  }

  void addConsumableItem() {
    ProductEntity item = ProductEntity(
        id: productIdController.text,
        productType: ProductType.consumable,
        additionalNotes: additionalNoteController.text,
        storage: List.generate(
          storageLocationControllers.length,
          (index) => StorageLocationAndQuantityEntity(
            locationName: storageLocationControllers[index]
                .text, // Get location name from the corresponding controller
            quantity: int.tryParse(stockOnHandController[index].text) ??
                0, // Parse quantity or default to 0
          ),
        ),
        storageRequirement: storageRequirementController.text =
            storageRequirementValue.toString(),
        consumablesEntity: ConsumablesEntity(
          consumableId: productIdController.text,
          category: categoryController.text = categoryValue.toString(),
          subcategory: subCategoryController.text,
          model: modelController.text,
          dateReceived: DateTime.now(),
          quantity: totalQuantityController.text,
          status: 'InUse',
          brand: brandController.text,
          name: brandController.text + modelController.text,
         reorderLevel: int.parse(reorderLevelController.text),
         reorderQuantity: int.parse(reorderQuantityController.text),
         unitOfMeasurement: UnitOfMeasurement.gram,
          usageFrequency: 'daily',
        ),
        supplier: SupplierEntity(
          supplierName: supplierNameController.text =
              supplierNameValue.toString(),
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
        currency: currencyController.text = currencyValue!.getName,
        unitCost: 2,
        expectedLifeTime: DateTime.now(),
        productSpecifications: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ],
        productWaranties: [
          AttachmentEntity(file: File('assets/dummyFile/example.pdf'))
        ]);
    final controller = Get.find<ProductsController>();
    controller.products.add(item); // Add item to the list
    controller.update([ProductsIds.productsTab]);
  }

  void clearControllers() {
    orderIdController.clear();
    productIdController.clear();
    categoryController.clear();
    subCategoryController.clear();
    brandController.clear();
    modelController.clear();
    expirationDateController.clear();
    totalQuantityController.clear();
    unitCostController.clear();
    currencyController.clear();
    supplierNameController.clear();
    storageRequirementController.clear();
    expectedLifetimeController.clear();
    totalQuantityController.clear();
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
    final index = warrantyAttachments
        .indexWhere((element) => element.fileName == model.fileName);

    warrantyAttachments.removeAt(index);
    update([AddProductIdsConstant.warrantyAttachments]);
  }

  void changeApprovalStatusById(approvalId, String s, BuildContext context) {}
}
