import 'package:flutter/material.dart';
//import 'package:flutter_latihan_tugas/movie/model/movie_model.dart';
import 'package:flutter_latihan/movie/models/movie_models.dart';

class MovieDetailScreen extends StatelessWidget {
  final MovieModel movie;

  // Konstruktor untuk menerima objek movie
  MovieDetailScreen({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar poster film
            movie.posterPath.isEmpty
                ? Container()
                : Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    height: 300,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Judul film
                  Text(
                    movie.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  // Deskripsi singkat (overview)
                  Text(
                    movie.overview,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
