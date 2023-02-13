import 'package:clean_architecture_app/advice_app/data/repository/advice_repo_implementation.dart';
import 'package:clean_architecture_app/advice_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/advice_app/domain/failures/failures.dart';
import 'package:clean_architecture_app/advice_app/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  final AdviceRepo adviceRepo = AdviceRepoImplementation();
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    return adviceRepo.getAdviceFromDataSource();
  }
}
