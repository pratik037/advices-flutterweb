import 'package:advices/app/model/advice.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:flutter/material.dart';

class AdvicesBackend extends ChangeNotifier{

  List<Advice> advices = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;


  var url = 'https://api.adviceslip.com/advice/search/';
  
  Future handleSearchAdvice(String query) async{
    try{
      advices.clear();
      _isLoading = true;
      notifyListeners();

      http.Response response = await http.get(url+query);
      if(response.statusCode == 200 && response.body!= null){
        Map<String, dynamic> responseBody = json.decode(response.body);
        // print("Response body: " + responseBody.toString());
        try{
        List data = responseBody['slips'];
        // print(data);

        data.forEach((advicesMap) { 
          Advice advice = Advice.fromMap(advicesMap);
          advices.add(advice);
        });

        _isLoading = false;
        notifyListeners();

        advices.forEach((a) {
          print(a.toString());
          
         });
        }catch(err){
          Advice advice = Advice.hasError(responseBody['message']['text']);
          advices.add(advice);
          _isLoading = false;
          notifyListeners();
        }
      }
    }catch(e,stacktrace){
      print(e);
      print(stacktrace);
    }

  }

  List<Advice> get allAdvices => advices;

  int get length => advices.length;
}