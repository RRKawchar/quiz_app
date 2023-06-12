import 'package:flutter/material.dart';
import 'package:quiz_app/constants/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.onTap,
  });
 final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          alignment: Alignment.center,
          width: size.width-100,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          child: headingText(text: 'Continue'),
        ),
      ),
    );
  }
}