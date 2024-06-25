import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gli/authentication/cubit/register_cubit/register_state.dart';

import '../../data/models/register_model.dart';
import '../../domain/usecases/user_registration.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.userRegistrationUseCase}) : super(RegisterInitial());
  final UserRegistrationUseCase userRegistrationUseCase;

  static RegisterCubit get(context) => BlocProvider.of(context);


  void usrRegister({required RegisterBody registerBody}) async {
    emit(RegisterLoadingState());
    final failureOrSuccess = await userRegistrationUseCase.call(registerBody: registerBody);
    failureOrSuccess.fold(
        (failure) => emit(RegisterErrorState(msg: failure.getMessage())),
        (success) => emit(const RegisterSuccessState(successMsg: 'successfully registered')));
  }


}
