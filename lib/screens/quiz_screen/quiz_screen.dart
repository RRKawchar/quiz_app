import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/text_style.dart';
import 'package:quiz_app/widgets/custom_icon_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int second = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [black, darkBlack])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(onPressed: () {}, icon: CupertinoIcons.back),
              normalText(text: '$second', fontSize: 22, color: Colors.white),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: lightgrey,width: 2)
                ),
                child: TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      CupertinoIcons.heart_fill,
                      color: Colors.white,
                    ),
                    label: normalText(
                        text: "Like", color: Colors.white,)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
