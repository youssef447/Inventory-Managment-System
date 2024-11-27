import '../../../admin/employees/enums/departments.dart';

class UserEntity {
  String id;
  String firstName;
  String lastName;
  String jobTitle;
  String profileImage;
  String position;
  bool isSelected;
  Departments department;
  String phoneNumber;
  String email;
  UserEntity({
    required this.firstName,
    required this.id,
    required this.lastName,
    this.isSelected = false,
    this.jobTitle = 'Designer',
    this.position = 'Employee',
    this.department = Departments.marketing,
    this.email = 'ahmed@gmail.com',
    this.phoneNumber = '01010101010',
    this.profileImage =
        'https://t3.ftcdn.net/jpg/08/86/78/68/360_F_886786813_XhL8zD8rhZCW7F5HvJdOPvquFh3n23vd.jpg',
  });
}
