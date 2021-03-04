import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movielistapp/models/movie_model.dart';
import 'package:movielistapp/movie_utils/constants.dart';
import 'package:movielistapp/providers/movie_provider.dart';
import 'package:movielistapp/widgets/movie_item.dart';
import 'package:movielistapp/widgets/movie_item_2.dart';
import 'package:provider/provider.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<MovieProvider>(context, listen: false).getMovies();
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie List'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, movieProvider, child)=>ListView.builder(
          padding: EdgeInsets.all(5),
          itemBuilder: (_, index)=> MovieItem2(movieProvider.movieList[index]),
          itemCount: movieProvider.movieList.length,
        ),

      ),

    );
  }



  ListView myMovieList1() {
    return ListView(

      children: movies.map((Movie) => ListTile(
        title: Text(Movie.name),
        subtitle: Text(Movie.category),
        trailing: Text('${Movie.rating}'),
        leading: CircleAvatar(),

      )).toList(),
    );
  }
}
