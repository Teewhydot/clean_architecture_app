import 'package:clean_architecture_app/advice_app/domain/entities/advice_entity.dart';
import 'package:clean_architecture_app/advice_app/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

class AdviceUsecase {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 2), () {});
    // return right(AdviceEntity(advice: "Get rich or die trying"));
    return left(ServerFailure());
  }
}
