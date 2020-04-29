import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkingHelper {
  final String url;
  NetworkingHelper({this.url});

  Future getData() async {
    http.Response response = await http.get(this.url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data; 
      
    }else {
      print(response.statusCode);
    }
  }
}