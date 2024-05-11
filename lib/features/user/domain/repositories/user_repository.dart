import 'package:flutter_clean_arch/core/errors/failure.dart';
import 'package:flutter_clean_arch/core/params/params.dart';
import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getUser({required UserParams params});
}
