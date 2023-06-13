import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:http/http.dart' as http;
import 'package:quiz_app/screens/home/score_screen/score_screen.dart';
class QuizController extends GetxController {
  final _second = 60.obs;
  final _currentQuestionIndex = 0.obs;
  final _isLoading = false.obs;
  final _optionList = <dynamic>[].obs;
  final _optionColor = List<Rx<Color>>.generate(5, (_) => Colors.white.obs);
  final _points = 0.obs;
  late Future<List<dynamic>> quiz;

  int get second => _second.value;
  int get currentQuestionIndex => _currentQuestionIndex.value;
  bool get isLoading => _isLoading.value;
  List<dynamic> get optionList => _optionList.value;
  List<Rx<Color>> get optionColor => _optionColor;
  int get points => _points.value;

  @override
  void onInit() {
    super.onInit();
    quiz = getQuiz();
  }

  Future<List<dynamic>> getQuiz() async {
    final response = await http.get(Uri.parse('https://opentdb.com/api.php?amount=20'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load quiz');
    }
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second > 0) {
        _second.value--;
      } else {
        timer.cancel();
      }
    });
  }

  void resetColor() {
    for (var color in _optionColor) {
      color.value = Colors.white;
    }
  }

  void gotoNextQuestion() {
    if (currentQuestionIndex < optionList.length - 1) {
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading.value = false;
        _currentQuestionIndex.value++;
        resetColor();
        _second.value = 60;
        startTimer();
      });
    } else {
      _isLoading.value = false;
      resetColor();
      Get.to(() => const ScoreScreen());
    }
  }
}
