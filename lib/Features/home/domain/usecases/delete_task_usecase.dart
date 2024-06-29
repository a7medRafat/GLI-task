import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../repositories/home_repository.dart';

class DeleteTasksUseCase {
  final HomeRepository homeRepository;

  DeleteTasksUseCase({required this.homeRepository});

  Future<Either<Failure, void>> call({required String id}) async {
    return await homeRepository.deleteTasks(id: id);
  }
}
