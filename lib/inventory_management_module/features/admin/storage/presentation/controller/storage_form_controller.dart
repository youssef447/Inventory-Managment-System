import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../constants/storage_ids.dart';
import '../../domain/storage_location_entity.dart';

class StorageFormController extends GetxController {
  bool isEditable = true;
  AttachmentEntity? contractDetails;
  late final TextEditingController supplierIDController;
  late final TextEditingController supplierNameController;
  late final TextEditingController taxNumController;
  late final TextEditingController stateOrProvinceController;
  late final TextEditingController catalogOfProductsController;
  late final TextEditingController postalCodeController;
  late final TextEditingController countryController;
  late final TextEditingController cityController;
  late final TextEditingController firstNameController;
  late final TextEditingController middleNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController titleNameController;
  late final TextEditingController phoneNumberController;
  late final TextEditingController emailController;
  late final TextEditingController additionalNotesController;
  late final TextEditingController startDateController;
  late final TextEditingController endDateController;
  setSupplierData([StorageLocationAndQuantityEntity? storage]) {
    /* supplierIDController = TextEditingController(text: supplier?.supplierId);
    supplierNameController =
        TextEditingController(text: supplier?.supplierName);
    taxNumController = TextEditingController(text: supplier?.taxNumber);
    stateOrProvinceController =
        TextEditingController(text: supplier?.stateOrProvince);
    catalogOfProductsController =
        TextEditingController(text: supplier?.catalogOfProduct);
    postalCodeController = TextEditingController(text: supplier?.postalCode);
    countryController = TextEditingController(text: supplier?.country);
    cityController = TextEditingController(text: supplier?.city);
    firstNameController = TextEditingController(text: supplier?.firstName);
    middleNameController = TextEditingController(text: supplier?.middleName);
    lastNameController = TextEditingController(text: supplier?.lastName);
    titleNameController = TextEditingController(text: supplier?.title);
    phoneNumberController = TextEditingController(text: supplier?.phoneNumber);
    emailController = TextEditingController(text: supplier?.email);
    additionalNotesController =
        TextEditingController(text: supplier?.additionalNotes);
    startDateController = TextEditingController(
        text: DateTimeHelper.formatDate(
            supplier?.contractDetails.startDate ?? DateTime.now()));
    endDateController = TextEditingController(
        text: DateTimeHelper.formatDate(
            supplier?.contractDetails.endDate ?? DateTime.now()));
    selectedBusinessType = supplier?.businessType;
    additionalDoc = supplier?.contractDetails.additionalDocs ?? [];
    contractDetails = supplier?.contractDetails.attachmentEntity;
    complianceDoc = supplier?.contractDetails.complianceDoc;
  }

  resetResources() {
    supplierIDController.clear();
    supplierNameController.clear();

    taxNumController.clear();
    stateOrProvinceController.clear();

    catalogOfProductsController.clear();
    postalCodeController.clear();
    countryController.clear();
    cityController.clear();
    firstNameController.clear();
    middleNameController.clear();
    lastNameController.clear();
    titleNameController.clear();
    phoneNumberController.clear();
    emailController.clear();
    additionalNotesController.clear();

    startDateController.clear();
    endDateController.clear();
    selectedBusinessType = null;
    additionalDoc = [];
    contractDetails = null;
    complianceDoc = null;*/
  }

//----------------------------Upload Docs Logic--------------------------------------
  uploadContract() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      final file = result.files.first;
      String fileName = File(file.path!).path.split('/').last;
      String extension = fileName.split('.').last;
      double totalSize = File(file.path!).lengthSync() / (1024 * 1024);

      contractDetails = AttachmentEntity(
        file: File(file.path!),
        fileName: fileName,
        extension: extension,
        totalSize: totalSize,
      );
      ;
      update([StorageIds.storageForm]);
    }
  }

  removeContract() {
    contractDetails = null;
    update([StorageIds.storageForm]);
  }
}
