import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../core/constants/app_assets.dart';
import '../../../../../core/widgets/dialog/default_dialog.dart';

import '../../../../../core/enums/requests_enums.dart';
import '../../../../../core/helpers/get_dialog_helper.dart';
import '../../../../employee/requests/entities/attachment_entity.dart';
import '../../../../products/domain/subEntities/contract_details_entity.dart';
import '../../../storage/domain/storage_location_entity.dart';
import '../../../suppliers/domain/supplier_entity.dart';
import '../../constants/order_ids.dart';
import 'new_order_contrller.dart';

class NewOrderFormController extends GetxController {
  late List<SupplierEntity?> selectedSupplier;
  late List<Currency?> selectedCurrency;
  late List<bool> hideForm;
  late List<bool> createAutomaticIDs;
  late List<int> storageLocationCount;
  late final List<TextEditingController> orderIDController;
  late final List<TextEditingController> quantityController;
  late final List<TextEditingController> unitCostController;
  late final List<TextEditingController> currencyController;
  late final List<TextEditingController> orderValueController;
  late final List<TextEditingController> supplierController;
  late final List<TextEditingController> additonalNotesController;
  late final List<TextEditingController> expectedDeliveryController;
  late final List<TextEditingController> storageLocationControllers;

  List<List<StorageLocationAndQuantityEntity?>> selectedStorageLocations = [];

  @override
  void onInit() {
    super.onInit();

    final numOfProducts =
        Get.find<NewOrderController>().getSelectedProducts().length;

    hideForm = List.generate(
      numOfProducts,
      (index) => false,
    );
    createAutomaticIDs = List.generate(
      numOfProducts,
      (index) => false,
    );
    selectedSupplier = List.generate(
      numOfProducts,
      (index) => null,
    );
    selectedCurrency = List.generate(
      numOfProducts,
      (index) => null,
    );
    orderIDController = List.generate(
      numOfProducts,
      (index) => TextEditingController(text: Random().nextInt(1000).toString()),
    );
    unitCostController = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    currencyController = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    orderValueController = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    supplierController = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    additonalNotesController = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    expectedDeliveryController = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    quantityController = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    storageLocationControllers = List.generate(
      numOfProducts,
      (index) => TextEditingController(),
    );
    selectedStorageLocations = List.generate(
      numOfProducts,
      (index) => [null],
    );
    storageLocationCount = List.generate(
      numOfProducts,
      (index) => 1,
    );
  }

  toggleAutomaticIds(bool value, int index) {
    createAutomaticIDs[index] = value;
    update([OrderIds.newOrderForm]);
  }

  //Dummy
  List<StorageLocationAndQuantityEntity> storageLoctaions = [
    StorageLocationAndQuantityEntity(
      locationName: 'Room A1',
      quantity: 2,
    ),
    StorageLocationAndQuantityEntity(
      locationName: 'Room A2',
      quantity: 2,
    )
  ];
  //dummy
  List<SupplierEntity> suppliers = List.generate(
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
            attachmentEntity: AttachmentEntity(file: File('path'))),
        firstName: 'Ahmed',
        lastName: 'Mohammed',
        phoneNumber: '1212112',
        email: 's@gmail.com'),
  );

  hideProductDetailsCard(int index) {
    hideForm[index] = !hideForm[index];
    update([OrderIds.newOrderForm]);
  }

  selectCurrency(Currency value, int index) {
    selectedCurrency[index] = value;
    update([OrderIds.newOrderForm]);
  }

  selectSupplier(SupplierEntity value, int index) {
    selectedSupplier[index] = value;
    update([OrderIds.newOrderForm]);
  }

  void updateStorageLocationValue(
      int index1, int index2, StorageLocationAndQuantityEntity value) {
    selectedStorageLocations[index1][index2] = value;
    update([OrderIds.newOrderForm]);
  }

  //--------------- add More storage location

  void addMoreStorage(int index) {
    // Add a new controller for each new entry
    storageLocationControllers.add(TextEditingController());
    selectedStorageLocations[index].add(null);
    storageLocationCount[index]++;
    update([OrderIds.newOrderForm]);
  }

  submitOrder(BuildContext context) {
    Navigator.of(context).pop();
    GetDialogHelper.generalDialog(
      child: DefaultDialog(
        showButtons: false,
        title: 'Success'.tr,
        subTitle: 'Order Has Been Submited Successfully'.tr,
        lottieAsset: AppAssets.success,
      ),
      context: context,
    );
  }
}
