// Date: 6/8/2024
// By: Mohamed Ashraf, Youssef Ashraf, Nada Mohammed
// Last update: 5/9/2024
// Objectives: This file is responsible for providing the routes of the app.

abstract class Routes {
  // Home

  static const home = '/home';

  // Attendance
  static const attendanceTabletPage = '/attendanceTabletPage';
  static const attendanceMobilePage = '/attendanceTabletPage';

  //Send Request
  static const sendRequest = '/home/sendRequest';

  //Request Details
  static const requestDetails = '/home/requestDetails';

  //Location Details
  static const locationDetails = '/home/locationDetails';

  static const addLocation = '/home/addLocation';
  static const editLocation = '/home/editLocation';

  // Request types
  static const requestType = '/home/requestType';
  static const requestTypeDetails = '/home/requestTypeDetails';

  // Map Screen
  static const mapScreen = '/mapScreen';
  static const mapEditScreen = '/mapEditScreen';

}
