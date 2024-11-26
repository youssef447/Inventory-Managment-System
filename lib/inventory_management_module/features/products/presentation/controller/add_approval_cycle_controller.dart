// by: mohamed ashraf

import 'package:get/get.dart';

import '../../../employee/home/domain/user_entity.dart';

class AddApprovalCycleController extends GetxController {


  // Observable list of approval cycles
  RxList<UserEntity> approvalCycles = <UserEntity>[
    UserEntity(
      firstName: 'Ahmed',
      lastName: 'Ali',
      id: '1',
      isSelected: true,
      position: 'Manager',
    ),
    UserEntity(
      firstName: 'Ahmed',
      lastName: 'Mohammed',
      id: '2',
      isSelected: true,
      position: 'Engineer',
    ),
    UserEntity(
      firstName: 'Ali',
      lastName: 'Mohammed',
      id: '3',
      isSelected: false,
      position: 'Designer',
    ),
    UserEntity(
      firstName: 'Mohamed',
      lastName: 'Mohammed',
      id: '4',
      isSelected: false,
      position: 'Analyst',
    ),
  ].obs;

  // Observable filtered list that will update UI reactively
  RxList<UserEntity> filteredUsers = <UserEntity>[].obs;

  // Initialize selectedApprovalCycle in onInit
  RxList<UserEntity> selectedApprovalCycle = <UserEntity>[].obs;


  @override
  void onInit() {
    super.onInit();
    filteredUsers.assignAll(approvalCycles);
    updateSelectedApprovalCycle();
  }

  // Search function to filter users based on the query
  void searchUser(String query) {
    if (query.isEmpty) {
      filteredUsers.assignAll(approvalCycles);
    } else {
      filteredUsers.assignAll(
        approvalCycles.where(
              (user) => user.firstName.toLowerCase().contains(query.toLowerCase()) ||
              user.lastName.toLowerCase().contains(query.toLowerCase()),
        ),
      );
    }
  }

  // Function to update selectedApprovalCycle
  void updateSelectedApprovalCycle() {
    selectedApprovalCycle.assignAll(
      approvalCycles.where((approval) => approval.isSelected).toList(),
    );
  }

  // Toggle user selection and update filteredUsers
  void toggleSelection(int index) {
    filteredUsers[index].isSelected = !filteredUsers[index].isSelected;
    filteredUsers.refresh();
    updateSelectedApprovalCycle();
  }



}