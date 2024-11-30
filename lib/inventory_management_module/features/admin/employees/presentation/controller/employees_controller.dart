import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../employee/home/domain/user_entity.dart';
import '../../constants/ids.dart';
import '../../../../../core/enums/departments.dart';
import '../../../../../core/enums/sort_options.dart';

class EmployeesController extends GetxController {
  List<UserEntity> employees = [];
  List<UserEntity> employeesFilters = [];
  bool loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadProducts();
  }

  loadProducts() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    employees = [
      UserEntity(
          firstName: 'Ahmed',
          lastName: 'Ali',
          id: '1',
          department: Departments.software),
      UserEntity(
          firstName: 'Ziad',
          lastName: 'Ali',
          id: '1',
          department: Departments.marketing),
      UserEntity(
        firstName: 'Hossam',
        lastName: 'Mohammed',
        jobTitle: 'Programmer',
        id: '2',
      ),
      UserEntity(
        firstName: 'Ahmed',
        lastName: 'Ali',
        id: '3',
      ),
      UserEntity(
        firstName: 'Ahmed',
        lastName: 'Ali',
        id: '4',
      ),
      UserEntity(
        firstName: 'Ahmed',
        lastName: 'Ali',
        id: '5',
      ),
    ];
    employeesFilters = employees;
    loading = false;
    update([AdminEmployeesIds.employeesPage]);
  }

  //------------------------ Filter ------------------------
  final searchController = TextEditingController();
  Departments? selectedDepartment;
  SortOptions? selectedSortOption;
  bool applyEnabled = false;
  updateDepartmentFilter(Departments dep, [bool? apply]) {
    selectedDepartment = dep;

    applyEnabled = true;
    update([AdminEmployeesIds.employeeFilter]);

    if (apply == null) return;

    switch (dep) {
      case Departments.all:
        employeesFilters = employees;
        break;
      case Departments.marketing:
        employeesFilters = employees
            .where((element) => element.department == Departments.marketing)
            .toList();
        break;
      case Departments.software:
        employeesFilters = employees
            .where((element) => element.department == Departments.software)
            .toList();
        break;
      case Departments.finance:
        employeesFilters = employees
            .where((element) => element.department == Departments.finance)
            .toList();
        break;
    }
    update([AdminEmployeesIds.employeesPage]);
  }

  applySort(SortOptions option, [bool? apply]) {
    //to update mobile dialog

    selectedSortOption = option;

    applyEnabled = true;

    update([AdminEmployeesIds.employeeFilter]);
    if (apply == null) return;

    employeesFilters = employees
        .map(
          (e) => e,
        )
        .toList();
    switch (option) {
      case SortOptions.title:
        employeesFilters.sort(
          (a, b) => a.jobTitle.compareTo(b.jobTitle),
        );
        break;
      case SortOptions.name:
        employeesFilters.sort(
          (a, b) => a.firstName.compareTo(b.firstName),
        );
    }
    update([AdminEmployeesIds.employeesPage]);
  }

  //called only in mobile dialog
  applyFilter() {
    if (selectedDepartment != null) {
      updateDepartmentFilter(selectedDepartment!, true);
    }
    if (selectedSortOption != null) {
      applySort(selectedSortOption!, true);
    }
  }

  resetFilter() {
    selectedDepartment = null;
    selectedSortOption = null;
    applyEnabled = false;
    employeesFilters = employees;
    update([AdminEmployeesIds.employeesPage, AdminEmployeesIds.employeeFilter]);
  }

  resetResources() {
    selectedDepartment = null;
    selectedSortOption = null;
    applyEnabled = false;
  }
}
