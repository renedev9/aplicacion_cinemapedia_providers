import 'package:flutter/material.dart';
import 'package:flutter_app_peliculas/providers/movie_providers.dart';

import 'package:flutter_app_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MovieProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Peliculas en cines')),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 40,
          ),
          CardSwiper(ondisplay: movieProvider.onDisplayMovies,),
          SizedBox(
            height: 20,
          ),
          MovieSlider(moviePopular: movieProvider.onDisplayPopular),
        ]),
      ),
    );
  }
}
