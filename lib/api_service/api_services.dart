
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quiz_app/model/quiz_model.dart';
var url="https://opentdb.com/api.php?amount=20";


getQuiz()async{
  var response= await http.get(Uri.parse(url));

  if(response.statusCode==200){
    var data=jsonDecode(response.body.toString());
    print("Quiz data loaded");
    return data;
  }else{
    throw Exception('Failed to load data');
  }
}



class ApiServices{

  static ApiServices instance =ApiServices();


  Future<List<QuizModel>> getQuizData()async{

    var response=await http.get(Uri.parse(url));

    if(response.statusCode==200){
      final Map<String,dynamic> data=json.decode(response.body);

      return List<QuizModel>.from(data['results'].map((element)=>QuizModel.fromJson(element)));
    }else{
      throw Exception('Failed to load questions');
    }


  }

}