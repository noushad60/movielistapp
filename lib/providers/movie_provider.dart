
import 'package:flutter/material.dart';
import 'package:movielistapp/models/movie_model.dart';
import 'package:movielistapp/movie_utils/constants.dart';

class MovieProvider extends ChangeNotifier{
  List<Movie> _movieList = [];

  List<Movie> get movieList => _movieList;

  void getMovies() => _movieList = movies;

  void deleteMovie(int id){
    _movieList.removeWhere((element) => id==element.id);
    notifyListeners();
  }

  void toggleFavorite(int id){
    var film = _movieList.firstWhere((element) => id==element.id);
    film.isFavorite = ! film.isFavorite;
    notifyListeners();
  }

}