class UserEntity {
  String id;
  String firstName;
  String lastName;
  String jobTitle;
  String profileImage;
  String position;
  UserEntity({
    required this.firstName,
    required this.id,
    required this.lastName,
    this.jobTitle = 'Designer',
    this.position = 'employee',
    this.profileImage =
        'https://t3.ftcdn.net/jpg/08/86/78/68/360_F_886786813_XhL8zD8rhZCW7F5HvJdOPvquFh3n23vd.jpg',
  });
}
