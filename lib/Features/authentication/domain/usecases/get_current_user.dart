import 'package:dartz/dartz.dart';
import '../../../../../core/errors/failures.dart';
import '../../data/models/current_user_model.dart';
import '../repositories/features_repository.dart';

class GetCurrentUser {
  final AuthRepository authRepository;

  GetCurrentUser({required this.authRepository});

  Future<Either<Failure, CurrentUser>> call({required String uid}) async {
    return await authRepository.getCurrentUser(uid: uid);
  }
}
