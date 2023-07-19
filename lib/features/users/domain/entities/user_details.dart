import 'package:equatable/equatable.dart';

class UserDetailsEntity extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  const UserDetailsEntity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  @override
  List<Object?> get props {
    return [
      id,
      email,
      firstName,
      lastName,
      avatar,
    ];
  }
}
