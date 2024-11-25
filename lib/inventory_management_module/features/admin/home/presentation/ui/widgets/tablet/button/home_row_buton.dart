// by : Mohamed Ashraf
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventory_management/inventory_management_module/core/helpers/spacing_helper.dart';
import 'package:inventory_management/inventory_management_module/core/theme/app_colors.dart';
import 'package:inventory_management/inventory_management_module/core/widgets/buttons/app_default_button.dart';

class HomeAdminRowButton extends StatelessWidget {
  const HomeAdminRowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        AppDefaultButton(text: 'MyRequest'.tr,onPressed: (){},),
        const Spacer(),
        AppDefaultButton(text: 'Employee'.tr,onPressed: (){},),
        horizontalSpace(10),
        AppDefaultButton(text: 'Approval'.tr,onPressed: (){},),
        horizontalSpace(10),
        AppDefaultButton(text: 'DashBord'.tr,onPressed: (){},),
      ],
    );
  }
}



