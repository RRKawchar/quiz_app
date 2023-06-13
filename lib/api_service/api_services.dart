import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/model/quiz_model.dart';

class ApiServices {
  static ApiServices instance = ApiServices();

  var baseUrl = "https://opentdb.com/api.php?amount=20";

  Future<QuizModel> getQuizQuestions() async {
    final url = Uri.parse('https://opentdb.com/api.php?amount=20');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final quizModel = QuizModel.fromJson(jsonBody);
      return quizModel;
    } else {
      throw Exception('Failed to fetch quiz questions');
    }
  }
}
