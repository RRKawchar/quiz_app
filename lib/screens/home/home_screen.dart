import 'package:flutter/material.dart';
import 'package:quiz_app/constants/colors.dart';
import 'package:quiz_app/screens/home/components/home_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [black, darkBlack])),
            child: const HomeItems()),
      ),
    );
  }
}


