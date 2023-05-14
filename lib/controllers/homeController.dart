import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/moviemodel.dart';

class HomeController extends GetxController {
  final String apiUrl =
      'https://api.themoviedb.org/3/trending/all/day?api_key=39cf98d7db1ad3069227393fa6315d10';

  RxList<Movie> movies = <Movie>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMovies();
  }

  void fetchMovies() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];
      print(results);

      final List<Movie> fetchedMovies =
          List<Movie>.from(results.map((movieData) {
        return Movie(
          title: movieData['title'] ?? 'N/A',
          overview: movieData['overview'] ?? 'N/A',
          posterPath: movieData['poster_path'] ?? '',
          popularity: movieData['popularity'] != null
              ? movieData['popularity'].toDouble()
              : 0.0,
          voteCount: movieData['vote_count'] ?? 0,
          releaseDate: movieData['release_date'] ?? 'N/A',
           backdropPath: movieData['backdrop_path'] ?? '',
        );
      }));

      movies.value = fetchedMovies;
    } else {
      // Handle error
    }
  }
}
