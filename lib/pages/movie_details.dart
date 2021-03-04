import 'package:flutter/material.dart';
import 'package:movielistapp/models/movie_model.dart';
import 'package:movielistapp/movie_utils/constants.dart';
import 'package:movielistapp/providers/movie_provider.dart';
import 'package:movielistapp/styles/txt_style.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  MovieDetails(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('${movie.name} Details'),
      // ),
      body: CustomScrollView(
          slivers: [

            SliverAppBar(
                expandedHeight: 300,
                pinned: true,
                elevation: 20,
                floating: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(movie.name, style: movieRowItem,),
                  background: Hero(
                      tag: movie.id,
                      child: Image.asset('images/${movie.image}', width: double.infinity, height: 300, fit: BoxFit.cover,)),
                )
            ),
            SliverList(delegate: SliverChildListDelegate(
                [
                  Card(
                    elevation: 10,
                    child: ListTile(
                      title: Text(movie.name),
                      subtitle: Text(movie.category),
                      trailing: Text('${movie.rating}'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(description),
                  ),
                ]
            )
            ),
          ],
        ),

    );

  }

  ListView buildListView() {
    return ListView(
      children: [
        Hero(
            tag: movie.id,
            child: Image.asset('images/${movie.image}')),
        Card(
          elevation: 10,
          child: ListTile(
            title: Text(movie.name),
            subtitle: Text(movie.category),
            trailing: Text('${movie.rating}'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(description),
        ),
      ],
    );
  }
}
