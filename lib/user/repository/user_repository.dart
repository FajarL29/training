import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_latihan/user/model/user_model.dart';

class UserRepository {
  final String baseUrl="https://api.themoviedb.org/3/movie/550?api_key=08ad6e796753b42f90104bfa2ed4dd20";

  final dio = Dio();
  Future<List<UserModel>> fecthUsers()async {
    final response= await dio.get('$baseUrl/posts');

    if (response.statusCode ==200) {
      List<dynamic> data = response.data;
      return data.map((json)=> UserModel.fromJson(json)).toList();
    }else{
      throw Exception('Failed to load posts');
    }
    }
  }
