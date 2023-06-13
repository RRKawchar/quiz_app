import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/images.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';

class QuizScreen extends GetView<QuizController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<dynamic>>(
          future: controller.quiz,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              if (!controller.isLoading) {
                controller.optionList =
                data[controller.currentQuestionIndex]['incorrect_answers'];
                controller.optionList
                    .add(data[controller.currentQuestionIndex]['correct_answer']);
                controller.optionList.shuffle();
                controller.isLoading = true;
              }

              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [black, darkBlack])),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                          ),
                          Obx(
                                () => Stack(
                              alignment: Alignment.center,
                              children: [
                                Text(
                                  '${controller.second}',
                                  style: TextStyle(fontSize: 24, color: Colors.white),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: CircularProgressIndicator(
                                    value: controller.second / 60,
                                    valueColor: AlwaysStoppedAnimation(Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: lightgrey, width: 2),
                            ),
                            child: TextButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                              label: Text(
                                'Like',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Image.asset(
                        ideas,
                        width: 200,
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Question ${controller.currentQuestionIndex + 1} of ${data.length}',
                          style: TextStyle(
                            color: lightgrey,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        data[controller.currentQuestionIndex]['question'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.optionList.length,
                        itemBuilder: (context, index) {
                          final answer =
                          data[controller.currentQuestionIndex]['correct_answer'];

                          return GestureDetector(
                            onTap: () {
                              controller.resetColor();
                              if (answer.toString() ==
                                  controller.optionList[index].toString()) {
                                controller.optionColor[index].value = Colors.green;
                                controller.points += 10;
                              } else {
                                controller.optionColor[index].value = Colors.red;
                              }

                              controller.gotoNextQuestion();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(bottom: 20),
                              alignment: Alignment.center,
                              width: size.width - 100,
                              padding: const EdgeInsets.all(18),
                              decoration: BoxDecoration(
                                color: controller.optionColor[index].value,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                '${controller.optionList[index]}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}