import 'package:flutter/material.dart';
import 'package:inventory_management/core/theme/app_colors.dart';

// Date: 7/11/2024
// by: Youssef Ashraf
// This class is used to create the default circular progress indicator
class AppCircleProgress extends StatelessWidget {
  const AppCircleProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          AppColors.primary,
        ),
        backgroundColor: Colors.white60,
        strokeWidth: 2.0,
      ),
    );
  }
}
