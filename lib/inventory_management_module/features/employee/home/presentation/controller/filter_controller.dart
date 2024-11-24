// by : Mohamed Ashraf

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../core/enums/requests_enums.dart';


class FilterController extends GetxController{

  TextEditingController requestedDateController =
  TextEditingController();

//----------------------------- requestStatus ---------------
  List<RequestStatus> requestStatus = [
    RequestStatus.approved,
    RequestStatus.cancelled,
    RequestStatus.pending,
    RequestStatus.rejected,
  ];
  Rxn<RequestStatus> requestStatusValue = Rxn<RequestStatus>();
  updateStatus(RequestStatus value) {
    requestStatusValue.value = value;
  }


  //----------------------------- RequestActions ---------------
  List<RequestActions> requestActions = [
    RequestActions.expiredConsumables,
    RequestActions.repairAsset,
    RequestActions.requestAsset,
    RequestActions.returnAsset,
    RequestActions.returnConsumables,
    RequestActions.requestConsumables,
    RequestActions.routineMaintenance,
  ];


  Rxn<RequestActions> requestTypeValue = Rxn<RequestActions>();
  updateRequestStatues(RequestActions value) {
    requestTypeValue.value = value;
  }


}