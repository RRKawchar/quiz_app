
import 'package:flutter/material.dart';

void push({required BuildContext context,required Widget screen}){
  Navigator.push(context, MaterialPageRoute(builder: (_)=>screen));
}

void pushRemoveUntil({required BuildContext context,required Widget screen}){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>screen,),(route) => false,);
}