import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movielistapp/models/movie_model.dart';
import 'package:movielistapp/pages/movie_details.dart';
import 'package:movielistapp/providers/movie_provider.dart';
import 'package:movielistapp/styles/txt_style.dart';
import 'package:provider/provider.dart';

class MovieItem2 extends StatefulWidget {
  final Movie movie2;

  MovieItem2(this.movie2);

  @override
  _MovieItem2State createState() => _MovieItem2State();
}

class _MovieItem2State extends State<MovieItem2> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieDetails(widget.movie2)));
      },
      onDoubleTap: (){
        Provider.of<MovieProvider>(context, listen: false).toggleFavorite(widget.movie2.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7),
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
            color: Colors.orange.shade800,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.yellow,
                spreadRadius: 1,
                blurRadius: 10,
              )
            ]),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(200)),
                    child: Hero(
                        tag: widget.movie2.id,
                        child: Image.asset(
                          'images/${widget.movie2.image}',
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ))),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                      // width: 250,
                      // height: 40,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.7),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.orange.shade800,
                                Colors.orange.shade200
                              ])),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                            '${widget.movie2.name}',
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),


                          ),
                      ),
                      )),

                Positioned(
                  right: 30,
                  child: IconButton(
                      icon: Icon(
                        // Icons.favorite_border_outlined,
                        widget.movie2.isFavorite
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Provider.of<MovieProvider>(context, listen: false)
                            .toggleFavorite(widget.movie2.id);
                      }),
                ),
                Positioned(
                  right: 0,
                  top: 30,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Provider.of<MovieProvider>(context, listen: false)
                          .deleteMovie(widget.movie2.id);
                    },
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(widget.movie2.category, style: movieRowItem),
                  Text('${widget.movie2.releaseYear}', style: movieRowItem),
                  Text('${widget.movie2.rating}', style: movieRowItem),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
