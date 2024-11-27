// Date: 6/8/2024
// By: Mohamed Ashraf, Youssef Ashraf
// Last update: 5/9/2024
// Objectives: This file is responsible for providing the routes of the app.

abstract class Routes {
  // Home

  static const home = '/';

  //Requests
  static const requestAsset = '/requestAsset';
  static const requestConsumable = '/requestConsumable';
  static const newRequestAsset = '$requestAsset/newRequestAsset';
  static const newRequestConsumable = '$requestConsumable/newRequestConsumable';
  static const trackRequest = '$requestAsset/trackRequest';
  static const trackDetails = '$trackRequest/trackDetails';

  // Assets
  static const assetsDetails = '/assetsDetails';

  // Consumables
  static const consumablesDetails = '/consumablesDetails';

  //approval
  static const approval = '/approval';
  static const approvalDetails = '/approvalDetails';

  //admin
  static const adminHome = 'adminHome';
  static const productDetails = '$adminHome/productDetails';
  static const employees = '$adminHome/employees';
  static const employeeDetails = '$employees/employeeDetails';
  static const employeeTrackRequestDetails =
      '$employeeDetails/trackRequestDetails';
}
