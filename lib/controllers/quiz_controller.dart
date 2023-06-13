import 'dart:async';
import 'package:get/get.dart';
import 'package:quiz_app/api_service/api_services.dart';
import 'package:quiz_app/model/quiz_model.dart';

class QuizController extends GetxController {
  var seconds = 60.obs;
  Timer? timer;
  var isLoading = true.obs;
  var questions = <Result>[].obs;
  var currentQuestionIndex=0.obs;
  var optionList=[].obs;
  var points = 0.obs;

  @override
  void onInit() {
    startTimer();
    fetchQuiz();
    super.onInit();
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      }
    });
  }

  Future<void> fetchQuiz() async {
    try {
      isLoading.value = true;
      final QuizModel quizModel = await ApiServices.instance.getQuizQuestions();
      questions.assignAll(quizModel.results);
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  void selectOption(String selectedAnswer) {
    final correctAnswer = questions[currentQuestionIndex.value].correctAnswer;

    if (selectedAnswer == correctAnswer) {
      points.value += 10;
    }

    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
      optionList.assignAll(questions[currentQuestionIndex.value].incorrectAnswers);
      optionList.add(questions[currentQuestionIndex.value].correctAnswer);
      optionList.shuffle();
    } else {
      timer?.cancel();
      // Handle end of quiz
    }
  }


}
