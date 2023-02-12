import 'package:clean_architecture_app/advice_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/advice_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdviceRepo {
  Future<Either<Failure, AdviceEntity>> getAdviceFromDataSource();
}
