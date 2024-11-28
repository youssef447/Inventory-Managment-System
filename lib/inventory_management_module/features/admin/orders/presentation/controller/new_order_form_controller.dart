import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/features/employee/requests/entities/attachment_entity.dart';

import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../../products/domain/subEntities/supplier_entity.dart';

class NewOrderFormController extends GetxController {
  //dummy
  List<SupplierEntity> suppliers = [
    SupplierEntity(
        supplierName: ' E-Tech Distributors',
        supplierId: '11',
        country: 'EG',
        stateOrProvince: 'eg',
        city: 'EG',
        postalCode: 'EG',
        contractDetails: ContractdetailsEntity(
            endDate: DateTime(2025),
            startDate: DateTime(2025),
            attachmentEntity: AttachmentEntity(file: File('path'))),
        firstName: 'Ahmed',
        lastName: 'Mohammed',
        phoneNumber: '1212112',
        email: 's@gmail.com')
  ];
  final TextEditingController orderIDController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController unitCostController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController orderValueController = TextEditingController();
  final TextEditingController supplierController = TextEditingController();
}
