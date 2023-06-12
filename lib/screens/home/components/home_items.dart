import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/constants/images.dart';
import 'package:quiz_app/constants/text_style.dart';
import 'package:quiz_app/constants/utils.dart';
import 'package:quiz_app/screens/quiz_screen/quiz_screen.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/custom_icon_button.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomIconButton(
          icon: CupertinoIcons.xmark,
          onPressed: () {},
        ),
        Image.asset(
          balloon2,
          width: 250,
          height: 250,
        ),
        const SizedBox(
          height: 20,
        ),
        normalText(text: "Welcome to our", fontSize: 18, color: lightgrey),
        headingText(text: 'Quiz App', fontSize: 32, color: Colors.white),
        const SizedBox(
          height: 20,
        ),
        normalText(
            text:
                "Do you feel confident? Here you'll face to most difficult questions!",
            fontSize: 16,
            color: lightgrey),
        const Spacer(),
        CustomButton(onTap: () {
          push(context: context, screen: const QuizScreen());
        })
      ],
    );
  }
}
