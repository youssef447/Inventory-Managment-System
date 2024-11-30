import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/business_type.dart';
import '../../../../../core/helpers/date_time_helper.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../constants/suppliers_ids.dart';
import '../../domain/supplier_entity.dart';
//Youssef Ashraf
///Represents The Suppliers Form Controller for Supplier Form Page

class SupplierFormController extends GetxController {
  bool automaticIds = false;
  bool isEditable = true;
  toggleAutomaticIds(bool val) {
    automaticIds = val;
    update([SuppliersIds.supplierForm]);
  }

  toggleEdit() {
    isEditable = !isEditable;
    update([SuppliersIds.supplierForm]);
  }

  List<AttachmentEntity> additionalDoc = [];
  AttachmentEntity? complianceDoc;
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

  BusinessType? selectedBusinessType;
  updateBusinessType(BusinessType businessType) {
    selectedBusinessType = businessType;
    update([SuppliersIds.supplierForm]);
  }

  setSupplierData(SupplierEntity supplier) {
    supplierIDController = TextEditingController(text: supplier.supplierId);
    supplierNameController = TextEditingController(text: supplier.supplierName);
    taxNumController = TextEditingController(text: supplier.taxNumber);
    stateOrProvinceController =
        TextEditingController(text: supplier.stateOrProvince);
    catalogOfProductsController =
        TextEditingController(text: supplier.catalogOfProduct);
    postalCodeController = TextEditingController(text: supplier.postalCode);
    countryController = TextEditingController(text: supplier.country);
    cityController = TextEditingController(text: supplier.city);
    firstNameController = TextEditingController(text: supplier.firstName);
    middleNameController = TextEditingController(text: supplier.middleName);
    lastNameController = TextEditingController(text: supplier.lastName);
    titleNameController = TextEditingController(text: supplier.title);
    phoneNumberController = TextEditingController(text: supplier.phoneNumber);
    emailController = TextEditingController(text: supplier.email);
    additionalNotesController =
        TextEditingController(text: supplier.additionalNotes);
    startDateController = TextEditingController(
        text: DateTimeHelper.formatDate(supplier.contractDetails.startDate));
    endDateController = TextEditingController(
        text: DateTimeHelper.formatDate(supplier.contractDetails.endDate));
    selectedBusinessType = supplier.businessType;
    additionalDoc = supplier.contractDetails.additionalDocs;
    contractDetails = supplier.contractDetails.attachmentEntity;
    complianceDoc = supplier.contractDetails.complianceDoc;
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
      update([SuppliersIds.supplierForm]);
    }
  }

  removeContract() {
    contractDetails = null;
    update([SuppliersIds.supplierForm]);
  }

  uploadAdditionalDocs() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );
    if (result != null) {
      for (var file in result.files) {
        String fileName = File(file.path!).path.split('/').last;
        String extension = fileName.split('.').last;
        double totalSize = File(file.path!).lengthSync() / (1024 * 1024);
        additionalDoc.add(
          AttachmentEntity(
            file: File(file.path!),
            fileName: fileName,
            extension: extension,
            totalSize: totalSize,
          ),
        );
      }

      update([SuppliersIds.supplierForm]);
    }
  }

  removeAdditionalDoc(int index) {
    additionalDoc.removeAt(index);
    update([SuppliersIds.supplierForm]);
  }

  uploadCompliance() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: false,
    );
    if (result != null) {
      final file = result.files.first;
      String fileName = File(file.path!).path.split('/').last;
      String extension = fileName.split('.').last;
      double totalSize = File(file.path!).lengthSync() / (1024 * 1024);

      complianceDoc = AttachmentEntity(
        file: File(file.path!),
        fileName: fileName,
        extension: extension,
        totalSize: totalSize,
      );
      ;
      update([SuppliersIds.supplierForm]);
    }
  }

  removeCompliance() {
    complianceDoc = null;
    update([SuppliersIds.supplierForm]);
  }
}
