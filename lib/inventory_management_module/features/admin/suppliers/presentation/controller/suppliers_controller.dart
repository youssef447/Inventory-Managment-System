import 'dart:io';

import 'package:get/get.dart';

import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../suppliers/domain/supplier_entity.dart';

import '../../constants/suppliers_ids.dart';

//Youssef Ashraf
///Represents The Suppliers Controller for Supplier Tab
class SuppliersController extends GetxController {
  final List<String> orderHeaders = [
    'Supplier ID',
    'Supplier Name',
    'Country',
    'State Or Province',
    'City',
    'Postal Code',
    'Business Type',
    'Catalog Of Product',
    'Point Contact Name',
    'Title',
    'Phone Number',
    'Email',
    'Contract Start Date',
    'Contract End Date',
    'Proposed Contact',
    'Compliance Contact',
  ];
  late List<SupplierEntity> suppliers;
  bool loading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadSuppliers();
  }

  void loadSuppliers() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        suppliers = List.generate(
          3,
          (index) => SupplierEntity(
            supplierName: ' E-Tech Distributors${index + 1}',
            supplierId: '11$index',
            country: 'EG',
            stateOrProvince: 'eg',
            city: 'EG',
            postalCode: 'EG',
            contractDetails: ContractdetailsEntity(
                endDate: DateTime(2025),
                startDate: DateTime(2025),
                attachmentEntity: AttachmentEntity(
                    file: File('path'),
                    fileName: 'File',
                    extension: 'pdf',
                    totalSize: 10)),
            firstName: 'Ahmed',
            lastName: 'Mohammed',
            phoneNumber: '1212112',
            email: 's@gmail.com',
          ),
        );

        loading = false;
        update([SuppliersIds.suppliersPage]);
      },
    );
  }
}
