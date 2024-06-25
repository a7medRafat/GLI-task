import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../authentication/cubit/login_cubit/login_cubit.dart';
import '../authentication/cubit/register_cubit/register_cubit.dart';
import '../authentication/data/datasources/auth_remote_data_source.dart';
import '../authentication/data/repositories/auth_repository_impl.dart';
import '../authentication/domain/repositories/features_repository.dart';
import '../authentication/domain/usecases/facebook_sign_in.dart';
import '../authentication/domain/usecases/google_sign_in.dart';
import '../authentication/domain/usecases/user_login.dart';
import '../authentication/domain/usecases/user_registration.dart';
import '../core/firebase/firebase_auth/auth.dart';
import '../core/firebase/firebase_store/firebase_firestore.dart';
import '../core/local_storage/local_storage.dart';
import '../core/local_storage/user_storage.dart';
import '../core/network/network_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(userRegistrationUseCase: sl()));
  sl.registerLazySingleton<UserRegistrationUseCase>(
      () => UserRegistrationUseCase(authRepository: sl()));

  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<AuthRemoteDataSource>(() =>
      AuthRemoteDataSourceImpl(authByFirebase: sl(), storageByFirebase: sl()));

  sl.registerLazySingleton<StorageByFirebase>(() => StorageByFirebaseImpl());
  sl.registerLazySingleton<AuthByFirebase>(() => AuthByFirebaseImpl());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<LocalStorage>(() => UserStorage());
  sl.registerLazySingleton<UserStorage>(() => UserStorage());

  ////// login //////

  sl.registerLazySingleton<LoginCubit>(() => LoginCubit(
      userLoginUseCase: sl(),
      googleSignInUseCase: sl(),
      facebookSignInUseCase: sl()));
  sl.registerLazySingleton<UserLoginUseCase>(
      () => UserLoginUseCase(authRepository: sl()));
  sl.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(authRepository: sl()));
  sl.registerLazySingleton<FacebookSignInUseCase>(
      () => FacebookSignInUseCase(authRepository: sl()));
}
