import 'package:dartz/dartz.dart';
import 'package:gli/Features/home/domain/repositories/home_repository.dart';
import '../../../../core/errors/failures.dart';

class UpdateTaskUseCase {
  final HomeRepository homeRepository;

  UpdateTaskUseCase({required this.homeRepository});

  Future<Either<Failure, void>> call({required String id,required Map<String, dynamic> map}) async {
    return await homeRepository.updateTask(id: id,map: map);
  }
}
