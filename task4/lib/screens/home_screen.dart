import 'package:flutter/material.dart';
import 'package:flutter_movies_app_ex/data/models/movie_model.dart';
import 'package:flutter_movies_app_ex/data/models/movies_model.dart';
// import 'package:flutter_movies_app_ex/data/repository/movie_helper.dart';
import 'package:flutter_movies_app_ex/screens/edit_movie_screen.dart';
import 'package:flutter_movies_app_ex/screens/movie_details_screen.dart';
import 'package:flutter_movies_app_ex/widgets/main_list_item.dart';
import 'package:provider/provider.dart';

import 'add_new_movie_scren.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List<Movie> movieList = [];

void getRecentlyAdded(context) {
  List<Movie> mList = [];
  mList = Provider.of<MoviesModel>(context, listen: false).movieList
      .where((element) => element.category == "RecentlyAdded")
      .toList();
  movieList = mList;
}

void getMyFavorites(context) {
  List<Movie> mList = [];
  mList =
      Provider.of<MoviesModel>(context, listen: false).movieList.where((element) => element.category == "MyFavorites").toList();
  movieList = mList;
}

void reset(context) {
  movieList = Provider.of<MoviesModel>(context, listen: false).movieList;
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      movieList = Provider.of<MoviesModel>(context, listen: false).movieList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    getRecentlyAdded(context);
                  });
                },
                child: Text('Recently Added'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  setState(() {
                    getMyFavorites(context);
                  });
                },
                child: Text('My Favorites'),
              ),
              Divider(),
              TextButton(
                onPressed: () {
                  setState(() {
                    reset(context);
                  });
                },
                child: Text('Reset'),
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var movie = movieList[index];
          return Dismissible(
            background: Container(
              alignment: Alignment.centerRight,
              color: Colors.red,
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(
                context,
                MovieDetailsScreen.routeName,
                arguments: movie,
              ),
              onLongPress: () {
                Navigator.pushNamed(
                  context,
                  EditMovieScreen.routeName,
                  arguments: {"movie": movie, "index": index},
                );
              },
              child: MainListItem(
                imageUrl: movie.imageUrl,
                title: movie.name,
                releaseDate: movie.releaseDate.toString(),
                rating: movie.rating.toString(),
              ),
            ),
            key: UniqueKey(),
            direction: DismissDirection.endToStart,
            confirmDismiss: (direction) => showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text("Are you sure?"),
                content: Text("Do you really want to delete this movie?"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("NO"),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          Provider.of<MoviesModel>(context, listen: false).removeMovie(movie.id);
                          Navigator.pop(context);
                        });
                      },
                      child: Text("YES"))
                ],
              ),
            ),
          );
        },
        itemCount: movieList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, AddNewMovieScreen.routeName),

        child: Icon(Icons.add),
      ),
    );
  }
}
