import 'package:get/get.dart';

//Youssef Ashraf
///Localization Helper Text To determine which word to use
abstract class LocalizedTextHelper {
  static String formatString({
    required String? secondaryLanguageText,
    required String primaryLanguageText,
  }) {
    bool isSecondaryLanguage =
        Get.locale.toString().toLowerCase().contains('ar');

    String selectedText = isSecondaryLanguage && secondaryLanguageText != null
        ? secondaryLanguageText
        : primaryLanguageText;

    // Capitalize each word
    return selectedText.split(' ').map((word) {
      return word.isNotEmpty
          ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
          : '';
    }).join(' ');
  }
}
