import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../config/Strings/app_strings.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/shared_preferances/cache_helper.dart';
import '../../domain/repositories/features_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/current_user_model.dart';
import '../models/register_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(
      {required this.networkInfo, required this.remoteDataSource});

  @override
  Future<Either<Failure, UserCredential>> userRegistration(
      {required RegisterBody registerBody}) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await remoteDataSource.userRegistration(registerBody: registerBody);
        final user = CurrentUser(
            name: registerBody.name!,
            email: registerBody.email!,
            phone: registerBody.phone!,
            uid: response.user!.uid,
            image: AppStrings.newUser,
            bio: AppStrings.newBio);
        final addUser = await addUserToFireStore(currentUser: user);
        addUser.fold((failure) {
          return Left(failure);
        }, (success) async {
          CacheHelper.saveData(
              key: 'uid', value: response.user!.uid.toString());
        });
        return Right(response);
      } on FirebaseAuthException catch (error) {
        return Left(MyServerFailure(error: error));
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> userLogin(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteLogin =
            await remoteDataSource.userLogin(email: email, password: password);
        final user = await getCurrentUser(uid: remoteLogin.user!.uid);
        user.fold(
          (failure) {
            return Left(failure);
          },
          (currentUser) async {
            CacheHelper.saveData(key: 'uid', value: currentUser.uid);
          },
        );
        return right(remoteLogin);
      } on FirebaseAuthException catch (e) {
        return left(MyServerFailure(error: e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addUserToFireStore(
      {required CurrentUser currentUser}) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteUser =
            await remoteDataSource.addUserToFireStore(currentUser: currentUser);
        return right(remoteUser);
      } on FirebaseAuthException catch (e) {
        return left(MyServerFailure(error: e));
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CurrentUser>> getCurrentUser(
      {required String uid}) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await remoteDataSource.getCurrentUser(uid: uid);

        return Right(response);
      } on FirebaseAuthException catch (e) {
        return left(MyServerFailure(error: e));
      } catch (error) {
        return Left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
