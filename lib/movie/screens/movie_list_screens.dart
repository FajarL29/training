import 'package:flutter/material.dart';
import 'package:flutter_latihan/movie/models/movie_models.dart';
import 'package:flutter_latihan/movie/repository/movie_repository.dart';
// import 'package:flutter_latihan/movie/model/movie_model.dart';
// import 'package:flutter_latihan/movie/screens/movie_detail_screen.dart';
import 'package:flutter_latihan/movie/screens/movie_detail_screens.dart';

class MovieListScreen extends StatelessWidget {
  final MovieRepository movieRepository = MovieRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Movies'),
      ),
      body: FutureBuilder<List<MovieModel>>(
        future: movieRepository.fetchMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            List<MovieModel> movies = snapshot.data!;

            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                MovieModel movie = movies[index];
                return ListTile(
                  title: Text(movie.title),
                  subtitle: Text(movie.overview),
                  leading: movie.posterPath.isEmpty
                      ? null
                      : Image.network('https://image.tmdb.org/t/p/w500${movie.posterPath}'),
                  onTap: () {
                    // Navigasi ke halaman detail film
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailScreen(movie: movie),
                      ),
                    );
                  },
                );
              },
            );
          }

          return Center(child: Text('No movies available'));
        },
      ),
    );
  }
}
