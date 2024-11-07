import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/helpers/orientation_helper.dart';
import '../../../controller/requests_controller.dart';
import '../../widgets/common/horizontal/requests_summary_row.dart';
import '../../widgets/common/vertical/requests_summary_row.dart';

class TabletRequestsPage extends GetView<RequestsController> {
  const TabletRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const OrientationHelper(
      landScape: HorizontalRequstsSummary(),
      portrait: VerticalRequstsSummary(),
    );
  }
}
