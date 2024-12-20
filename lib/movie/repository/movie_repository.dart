import 'package:dio/dio.dart';
//import 'package:flutter_latihan/movie/model/movie_model.dart';
import 'package:flutter_latihan/movie/models/movie_models.dart';

class MovieRepository {
  final String baseUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=08ad6e796753b42f90104bfa2ed4dd20";
  final Dio dio = Dio();

  // Fungsi untuk mengambil data film populer dari API
  Future<List<MovieModel>> fetchMovies() async {
    try {
      final response = await dio.get(baseUrl);

      if (response.statusCode == 200) {
        List<dynamic> data = response.data['results'];
        return data.map((json) => MovieModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      throw Exception('Failed to fetch movies: $e');
    }
  }
}
