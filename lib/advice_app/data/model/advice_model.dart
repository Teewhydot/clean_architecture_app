import 'package:clean_architecture_app/advice_app/domain/entities/advice_entity.dart';
import 'package:equatable/equatable.dart';

class AdviceModel extends AdviceEntity with EquatableMixin {
  AdviceModel({required String advice}) : super(advice: advice);

  factory AdviceModel.fromJson(Map<String, dynamic> json) {
    return AdviceModel(advice: json['slip']['advice']);
  }

  @override
  List<Object?> get props => [];
}
