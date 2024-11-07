import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
// Date: 7/11/2024
// By: Youssef Ashraf
/// Objectives: This file is responsible for handling home page logic.

class HomeController extends GetxController {
  //------------Category Filter Row------------

  RxInt currentCategoryIndex = 0.obs;

  ///updates category filter row index to filter table
  updateCategoryIndex(int index) {
    currentCategoryIndex.value = index;
  }

  //------------Search Filter Row------------
  TextEditingController searchController = TextEditingController();
}
