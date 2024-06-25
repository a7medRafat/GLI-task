import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/errors/failures.dart';
import '../repositories/features_repository.dart';

class UserLoginUseCase {
  final AuthRepository authRepository;

  UserLoginUseCase({required this.authRepository});

  Future<Either<Failure, UserCredential>> call(email, password) async {
    return await authRepository.userLogin(email: email, password: password);
  }

}