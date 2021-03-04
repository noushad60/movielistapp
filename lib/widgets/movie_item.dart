

import 'package:flutter/material.dart';
import 'package:movielistapp/models/movie_model.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(movie.name),
      subtitle: Text(movie.category),
      trailing: Text('${movie.rating}'),
      leading: CircleAvatar(
        radius: 50,
        backgroundImage: AssetImage('images/${movie.image}'),
      ),

    );
  }
}
