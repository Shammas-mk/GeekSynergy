import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
  var movies;
  http.Response? response;
  var movieParams = {
    "category": 'movies',
    "language": 'kannada',
    "genre": 'all',
    'sort': 'voting'
  };

  getMovieDetails() async {
    response = await http.post(
      Uri.parse('https://hoblist.com/api/movieList'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'category': 'movies',
        'language': 'kannada',
        'genre': 'all',
        'sort': 'voting'
      }),
    );

    var jsonData = jsonDecode(response!.body);
    movies = jsonData['result'];
    // log('this is the movies $movies');
    log('this is the movies $movies');
    update();
    return movies;
  }

  @override
  void onInit() {
    getMovieDetails();
    super.onInit();
  }

  getCompanyInfo() {
    Get.defaultDialog(
      title: 'Company Details',
      content: Column(),
    );
  }
}
