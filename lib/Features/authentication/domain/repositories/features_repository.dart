import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/errors/failures.dart';
import '../../data/models/current_user_model.dart';
import '../../data/models/register_model.dart';

abstract class AuthRepository {

  Future<Either<Failure, UserCredential>> userRegistration({required RegisterBody registerBody});

  Future<Either<Failure, UserCredential>> userLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserCredential>> googleSignIn();

  Future<Either<Failure, UserCredential>> facebookSignIn();

  Future<Either<Failure, CurrentUser>> getCurrentUser({required String uid});

  Future<Either<Failure, void>> addUserToFireStore({required CurrentUser currentUser});
}
