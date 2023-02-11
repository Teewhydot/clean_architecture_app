class AdviceEntity {
  final String advice;
  AdviceEntity({required this.advice});
  factory AdviceEntity.fromJson(Map<String, dynamic> json) {
    return AdviceEntity(advice: json['advice']);
  }
}
