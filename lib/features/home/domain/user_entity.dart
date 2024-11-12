// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserEntity {
  String firstName;
  String lastName;
  String position;
  String profileImage;
  UserEntity({
    required this.firstName,
    required this.lastName,
    this.position = 'Designer',
    this.profileImage =
        'https://t3.ftcdn.net/jpg/08/86/78/68/360_F_886786813_XhL8zD8rhZCW7F5HvJdOPvquFh3n23vd.jpg',
  });
}
