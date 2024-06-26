import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/Features/authentication/cubit/register_cubit/register_state.dart';
import '../../data/models/register_model.dart';
import '../../domain/usecases/user_registration.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.userRegistrationUseCase})
      : super(RegisterInitial());
  final UserRegistrationUseCase userRegistrationUseCase;

  static RegisterCubit get(context) => BlocProvider.of(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> registerKey = GlobalKey<FormState>();

  void userRegister() async {
    emit(RegisterLoadingState());
    RegisterBody body = RegisterBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text);
    final failureOrSuccess =
        await userRegistrationUseCase.call(registerBody: body);
    failureOrSuccess.fold(
        (failure) => emit(RegisterErrorState(msg: failure.getMessage())),
        (success) => emit(
            const RegisterSuccessState(successMsg: 'successfully registered')));
  }
}
