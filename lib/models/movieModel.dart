class Movie {
  final String title;
  final String overview;
  final String posterPath;
  final double popularity;
  final int voteCount;
  final String releaseDate;
  final String backdropPath;

  Movie(
      {required this.title,
      required this.overview,
      required this.posterPath,
      required this.popularity,
      required this.voteCount,
      required this.releaseDate,
      required this.backdropPath
      });
}
