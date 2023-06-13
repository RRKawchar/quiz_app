import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/text_style.dart';
import 'package:quiz_app/controllers/quiz_controller.dart';
import 'package:quiz_app/widgets/custom_icon_button.dart';

class QuizScreen extends StatefulWidget {
  QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final QuizController quizController = Get.put(QuizController());


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(child: Obx(() {



        if (quizController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }


        return Builder(
          builder: (BuildContext context){
            final currentQuestion = quizController.questions[quizController.currentQuestionIndex.value];
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
                        children: [
                          CustomIconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: CupertinoIcons.back,
                          ),
                          Obx(
                                () => Stack(
                              alignment: Alignment.center,
                              children: [
                                normalText(
                                  text: '${quizController.seconds}',
                                  color: lightgrey,
                                  fontSize: 22,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: CircularProgressIndicator(
                                    value: quizController.seconds.value / 60,
                                    valueColor:
                                    const AlwaysStoppedAnimation(Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: lightgrey, width: 2)),
                              child: TextButton.icon(
                                  onPressed: () {},
                                  icon: const Icon(
                                    CupertinoIcons.heart_fill,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  label: normalText(
                                      text: "Like", color: Colors.white)))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/ideas.png',
                        width: 200,
                        height: 200,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Obx(

                              () => normalText(
                            text: 'Question ${quizController.currentQuestionIndex + 1} of ${quizController.questions.length}',
                            color: lightgrey,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      normalText(
                        text: quizController.questions[0].question,
                        color: Colors.white,
                        fontSize: 20,
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      ListView.builder(
                          itemCount: quizController.optionList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final option = quizController.optionList[index];
                            return GestureDetector(
                              onTap: (){
                                quizController.selectOption(option);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(bottom: 20),
                                alignment: Alignment.center,
                                width: size.width - 100,
                                padding: const EdgeInsets.all(18),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: headingText(text: 'Continue'),
                              ),
                            );
                          })

                    ],
                  ),
                ));
          },

        );
      })),
    );
  }
}
