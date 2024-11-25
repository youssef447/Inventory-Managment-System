
// Date: 25/11/2024
// By:Mohamed Ashraf

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/enums/requests_enums.dart';
import '../../../employee/requests/entities/attachment_entity.dart';
import '../constant/add_Product_ids_constant.dart';
class AddProductController extends GetxController {


  ///-------------- drop down
  // -------------- product type  -----------
  List<ProductTypes> productType = [
    ProductTypes.asset,
    ProductTypes.consumables,
  ];
  Rxn<ProductTypes> productTypeValue = Rxn<ProductTypes>(ProductTypes.asset);
  updateProductTypeValue(ProductTypes value) {
    productTypeValue.value = value;
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

}
