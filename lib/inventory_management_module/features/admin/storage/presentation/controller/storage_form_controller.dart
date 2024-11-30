import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/features/employee/home/domain/user_entity.dart';

import '../../../../products/enums/product_enums.dart';
import '../../constants/storage_ids.dart';
import '../../domain/storage_location_entity.dart';

class StorageFormController extends GetxController {
  late List<bool> assignedUsers;
  @override
  void onInit() {
    super.onInit();
    assignedUsers = List.generate(
      dummyUsers.length,
      (index) => false,
    );
  }

  bool automaticIds = false;
  bool isEditable = true;
  toggleAutomaticIds(bool val) {
    automaticIds = val;
    update([StorageIds.storageForm]);
  }

  toggleEdit() {
    isEditable = !isEditable;
    update([StorageIds.storageForm]);
  }

  late final TextEditingController locationIDController;
  late final TextEditingController locationNameController;
  late final TextEditingController equipmentAvailable;
  late final TextEditingController stateOrProvinceController;
  late final TextEditingController postalCodeController;
  late final TextEditingController countryController;
  late final TextEditingController cityController;
  late final TextEditingController storageCapacityController;
  late final TextEditingController storageCategoryController;
  late final TextEditingController conditionOfStorageController;

  late final TextEditingController additionalNotesController;
  final TextEditingController searchController = TextEditingController();

  List<String> dummyAcessLevels = ['Access Level 1', 'Access Level 2'];
  List<String> dummyProducts = ['Product 1', 'Product 2'];
  List<String> dummyLocationTypes = ['Location Type 1', 'Location Type 2'];
  List<String> dummyEnvControlTypes = ['Env Control 1', 'Env Control 2'];
  List<UserEntity> dummyUsers = [
    UserEntity(
      firstName: 'Ahmed',
      id: '024',
      lastName: 'Mohammed',
    ),
    UserEntity(
      firstName: 'Khaled',
      id: '024',
      lastName: 'Ahmed',
    ),
    UserEntity(
      firstName: 'Youssef',
      id: '024',
      lastName: 'Mohammed',
    ),
  ];
  selectUser(int index) {
    assignedUsers[index] = true;
    update([StorageIds.storageForm]);
  }

  unassignUser(int index) {
    assignedUsers[index] = false;
    update([StorageIds.storageForm]);
  }

  String? selectedAcessLevel;
  String? selectedProduct;
  String? selectedLocationType;
  String? selectedEnvControlType;
  updateLocationType(String locationType) {
    selectedLocationType = locationType;
    update([StorageIds.storageForm]);
  }

  updateProduct(String product) {
    selectedProduct = product;
    update([StorageIds.storageForm]);
  }

  updateEnvControlType(String envControlType) {
    selectedEnvControlType = envControlType;
    update([StorageIds.storageForm]);
  }

  updateAccessLevel(String accessLevel) {
    selectedAcessLevel = accessLevel;
    update([StorageIds.storageForm]);
  }

  setStorageData([StorageLocationAndQuantityEntity? storage]) {
    locationIDController = TextEditingController(text: storage?.locationID);
    locationNameController = TextEditingController(text: storage?.locationName);
    equipmentAvailable =
        TextEditingController(text: storage?.equipmentAvailable);
    stateOrProvinceController =
        TextEditingController(text: storage?.stateOrProvince);

    postalCodeController = TextEditingController(text: storage?.postalCode);
    countryController = TextEditingController(text: storage?.country);
    cityController = TextEditingController(text: storage?.city);
    storageCapacityController =
        TextEditingController(text: storage?.storageCapacity.toString());
    storageCategoryController = TextEditingController(text: storage?.category);
    additionalNotesController =
        TextEditingController(text: storage?.additionalNotes);
    conditionOfStorageController =
        TextEditingController(text: storage?.conditionOfStorage);

    selectedAcessLevel = storage?.accessLevel;
    selectedLocationType = storage?.locationType;
    selectedEnvControlType = storage?.envControlType;
    selectedProduct = storage?.products.first.productType == ProductType.asset
        ? storage?.products.first.assetEntity?.assetName
        : storage?.products.first.consumablesEntity?.name;
  }

  resetResources() {
    locationIDController.clear();
    locationNameController.clear();

    equipmentAvailable.clear();
    stateOrProvinceController.clear();

    postalCodeController.clear();
    countryController.clear();
    cityController.clear();
    storageCapacityController.clear();
    storageCategoryController.clear();
    conditionOfStorageController.clear();
    additionalNotesController.clear();

    selectedAcessLevel = null;
    selectedEnvControlType = null;
    selectedProduct = null;
    selectedLocationType = null;
  }
}
