class UserEntity {
  String id;
  String firstName;
  String lastName;
  String jobTitle;
  String profileImage;
  String position;
  bool isSelected;
  UserEntity({
    required this.firstName,
    required this.id,
    required this.lastName,
    this.isSelected =false,
    this.jobTitle = 'Designer',
    this.position = 'Employee',
    this.profileImage =
        'https://t3.ftcdn.net/jpg/08/86/78/68/360_F_886786813_XhL8zD8rhZCW7F5HvJdOPvquFh3n23vd.jpg',
  });
}
