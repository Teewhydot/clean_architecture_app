import 'dart:convert';

import 'package:clean_architecture_app/advice_app/data/custom_exceptions/custom_exceptions.dart';
import 'package:clean_architecture_app/advice_app/data/model/advice_model.dart';
import 'package:http/http.dart' as http;

abstract class AdviceDataSource {
  Future<AdviceModel> getRandomAdvice();
}

class AdviceDataSourceImplementation implements AdviceDataSource {
  @override
  Future<AdviceModel> getRandomAdvice() async {
    final client = http.Client();
    final url = Uri.parse('https://api.adviceslip.com/advice');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      final decodedResult = jsonDecode(response.body);
      return AdviceModel.fromJson(decodedResult);
    } else {
      throw ServerException();
    }
  }
}
