import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/current_user_model.dart';
import '../repositories/features_repository.dart';

class AddUserToFireStore {
  final AuthRepository authRepository;

  AddUserToFireStore({required this.authRepository});

  Future<Either<Failure, void>> call({required CurrentUser currentUser}) async {
    return await authRepository.addUserToFireStore(currentUser: currentUser);
  }
}
