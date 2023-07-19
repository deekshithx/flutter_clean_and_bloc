import '../../domain/entities/user_details.dart';

class UserModel extends UserDetailsEntity {
  const UserModel({
    required int id,
    required String email,
    required String firstName,
    required String lastName,
    required String avatar,
  }) : super(
          id: id,
          email: email,
          firstName: firstName,
          lastName: lastName,
          avatar: avatar,
        );

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? "",
      email: map['email'] ?? "",
      firstName: map['first_name'] ?? "",
      lastName: map['last_name'] ?? "",
      avatar: map['avatar'] ?? "",
    );
  }

  factory UserModel.fromEntity(UserDetailsEntity entity) {
    return UserModel(
      id: entity.id,
      email: entity.email,
      firstName: entity.firstName,
      lastName: entity.lastName,
      avatar: entity.avatar,
    );
  }
}
