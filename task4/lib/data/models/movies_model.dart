
import 'package:flutter/material.dart';

import 'movie_model.dart';

class MoviesModel extends ChangeNotifier{
  List<Movie> movieList = [];
  addMovie(Movie movie){
    movieList.add(movie);
    notifyListeners();
  }

  removeMovie(int id){
    movieList.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  editMovie(Movie movie, int index){
    movieList.replaceRange(index, index + 1, [movie]);
    notifyListeners();
  }
}