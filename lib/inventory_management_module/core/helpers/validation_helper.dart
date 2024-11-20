// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing the validation helper that is used in the app in places like the login and register features.

import 'package:get/get.dart';
import 'package:intl/intl.dart';

abstract class ValidationHelper {
  // static bool isEmailValid(String email) {
  //   return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
  //       .hasMatch(email);
  // }

  static dynamic isEnglish(String? value) {
    final RegExp english = RegExp(r'^[a-zA-Z]+');
    if (value != null && !english.hasMatch(value)) {
      return 'Please Enter The Text In English Language'.tr;
    } else {
      return null;
    }
  }

  static dynamic isArabic(String? value) {
    final RegExp arabic = RegExp(r'^[\u0621-\u064A]+');
    if (value != null && !arabic.hasMatch(value)) {
      return 'Please Enter The Text In Arabic Language'.tr;
    } else {
      return null;
    }
  }

  static dynamic isEmpty(String? value, String label) {
    if (value == null || value.isEmpty) {
      return "$label ${'required'.tr}";
    } else {
      return null;
    }
  }

  static bool isPasswordValid(String password) {
    return RegExp(
            r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$")
        .hasMatch(password);
  }

  static bool isPhoneNumberValid(String phoneNumber) {
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(phoneNumber);
  }

  static bool isAgeAboveSixteen(String dobString) {
    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateTime dob = dateFormat.parse(dobString);

    final DateTime now = DateTime.now();
    int age = now.year - dob.year;

    // check if the birthday has passed this year
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) {
      age--;
    }
    return age >= 16;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
