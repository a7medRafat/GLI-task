import 'package:get_it/get_it.dart';
import 'package:gli/Features/createtask/cubit/task_cubit.dart';
import 'package:gli/Features/createtask/data/repositories/create_task_repository_impl.dart';
import 'package:gli/Features/createtask/domain/usecases/Create_task_usecase.dart';
import 'package:gli/Features/home/cubit/home/home_cubit.dart';
import 'package:gli/Features/home/cubit/update/update_cubit.dart';
import 'package:gli/Features/home/data/datasources/home_remote_data_source.dart';
import 'package:gli/Features/home/data/repositories/home_repository_impl.dart';
import 'package:gli/Features/home/domain/usecases/updateTaskUsecase.dart';
import 'package:gli/core/app_functions/app_functions.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../Features/authentication/cubit/login_cubit/login_cubit.dart';
import '../Features/authentication/cubit/register_cubit/register_cubit.dart';
import '../Features/authentication/data/datasources/auth_remote_data_source.dart';
import '../Features/authentication/data/repositories/auth_repository_impl.dart';
import '../Features/authentication/domain/repositories/features_repository.dart';
import '../Features/authentication/domain/usecases/user_login.dart';
import '../Features/authentication/domain/usecases/user_registration.dart';
import '../Features/createtask/data/datasources/create_task_remote_data_source.dart';
import '../Features/createtask/domain/repositories/create_task_repository.dart';
import '../Features/home/domain/repositories/home_repository.dart';
import '../Features/home/domain/usecases/delete_task_usecase.dart';
import '../Features/home/domain/usecases/get_tasks_usecase.dart';
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

  sl.registerLazySingleton<FirebaseStore>(() => FirebaseStoreImpl());
  sl.registerLazySingleton<AuthByFirebase>(() => AuthByFirebaseImpl());

  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectionChecker: sl()));
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<LocalStorage>(() => UserData());
  sl.registerLazySingleton<UserData>(() => UserData());

  ///// login /////

  sl.registerLazySingleton<LoginCubit>(
      () => LoginCubit(userLoginUseCase: sl()));
  sl.registerLazySingleton<UserLoginUseCase>(
      () => UserLoginUseCase(authRepository: sl()));

  //// create task  /////

  sl.registerLazySingleton<TaskCubit>(() => TaskCubit(createTaskUseCase: sl()));
  sl.registerLazySingleton<CreateTaskUseCase>(
      () => CreateTaskUseCase(createTaskRepository: sl()));

  sl.registerLazySingleton<CreateTaskRepository>(() =>
      CreateTaskRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<CreateTaskRemoteDataSource>(
      () => CreateTaskRemoteDataSourceImpl(firebaseStore: sl()));

  //// Home  /////
  sl.registerLazySingleton<HomeCubit>(
      () => HomeCubit(getTasksUseCase: sl(), deleteTasksUseCase: sl()));
  sl.registerLazySingleton<GetTasksUseCase>(
      () => GetTasksUseCase(homeRepository: sl()));

  sl.registerLazySingleton<DeleteTasksUseCase>(
      () => DeleteTasksUseCase(homeRepository: sl()));

  sl.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(firebaseStore: sl()));

  ////  /////

  sl.registerLazySingleton<UpdateCubit>(
      () => UpdateCubit(updateTaskUseCase: sl()));

  sl.registerLazySingleton<UpdateTaskUseCase>(
      () => UpdateTaskUseCase(homeRepository: sl()));

  sl.registerLazySingleton<AppFunctions>(() => AppFunctionsImpl());
}
