import 'package:clean_architecture_app/advice_app/data/custom_exceptions/custom_exceptions.dart';
import 'package:clean_architecture_app/advice_app/data/data_source/advice_data_source.dart';
import 'package:clean_architecture_app/advice_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/advice_app/domain/failures/failures.dart';
import 'package:clean_architecture_app/advice_app/domain/repositories/advice_repo.dart';
import 'package:dartz/dartz.dart';

class AdviceRepoImplementation implements AdviceRepo {
  final AdviceDataSource adviceDataSource = AdviceDataSourceImplementation();
  @override
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource() async {
    try {
      final result = await adviceDataSource.getRandomAdvice();
      return right(result);
    } on ServerException catch (_) {
      return left(ServerFailure());
    } catch (_) {
      return left(GeneralFailure());
    }
  }
}
