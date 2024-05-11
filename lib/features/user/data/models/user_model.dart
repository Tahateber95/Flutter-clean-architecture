import 'package:flutter_clean_arch/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final int id;
  final String username;
  UserModel(
      {required this.id,
      required this.username,
      required super.name,
      required super.phone,
      required super.email,
      required super.address});
}
