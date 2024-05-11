import 'package:dartz/dartz.dart';
import 'package:flutter_clean_arch/core/params/params.dart';

import '../../../../core/errors/failure.dart';
import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository _repository;

  GetUser(this._repository);

  Future<Either<Failure, UserEntity>> call({required UserParams params}) async {
    return await _repository.getUser(params: params);
  }
}
