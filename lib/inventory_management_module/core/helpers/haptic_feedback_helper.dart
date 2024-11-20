// Date: 29/9/2024
// By: Youssef Ashraf, Nada Mohammed, Mohammed Ashraf
// Last update: 29/9/2024
// Objectives: This file is responsible for providing the haptic feedback helper.

import 'dart:io';
import 'package:flutter/services.dart';
import 'package:vibration/vibration.dart';

enum VibrateType {
  lightImpact,
  mediumImpact,
  heavyImpact,
}

abstract class HapticFeedbackHelper {
  // function to trigger haptic feedback based on the vibrate type
  static Future<void> triggerHapticFeedback({
    VibrateType vibration = VibrateType.lightImpact,
    Function() hapticFeedback = HapticFeedback.mediumImpact,
  }) async {
    if (Platform.isAndroid) {
      Vibration.vibrate(
        duration: vibration == VibrateType.lightImpact
            ? 50
            : vibration == VibrateType.mediumImpact
                ? 70
                : 90,
      );
    } else {
      hapticFeedback();
    }
  }
}
