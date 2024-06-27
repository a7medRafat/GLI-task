import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Features/authentication/cubit/login_cubit/login_cubit.dart';
import '../Features/authentication/cubit/register_cubit/register_cubit.dart';
import '../Features/authentication/data/datasources/auth_remote_data_source.dart';
import '../Features/authentication/data/repositories/auth_repository_impl.dart';
import '../Features/authentication/domain/repositories/features_repository.dart';
import '../Features/authentication/domain/usecases/user_login.dart';
import '../Features/authentication/domain/usecases/user_registration.dart';
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

  ///// login /////

  sl.registerLazySingleton<LoginCubit>(
      () => LoginCubit(userLoginUseCase: sl()));
  sl.registerLazySingleton<UserLoginUseCase>(
      () => UserLoginUseCase(authRepository: sl()));
}
