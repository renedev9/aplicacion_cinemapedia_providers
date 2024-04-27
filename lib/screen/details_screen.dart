import 'package:flutter/material.dart';
import 'package:flutter_app_peliculas/widgets/casting.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ??
            'no hay argumentos en la ruta';
    return Scaffold(
      /* appBar: AppBar(
          //title: Text('Details Screen'),
          ), */
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(),
          SliverList(
              delegate: SliverChildListDelegate(
                  [_PosterAndTitle(), _OverView(), _OverView(), Casting()])),
        ],
      ),
    );
  }
}

class _OverView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Text(
        'Ut irure sit dolor pariatur eiusmod. Est laboris ad commodo dolor cillum ex enim non. Non minim minim irure consequat deserunt cillum proident laborum. Esse Lorem cupidatat adipisicing quis.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.all(0),
        centerTitle: true,
        title: Container(
            color: Colors.black12,
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: Text('movie.title', style: TextStyle(fontSize: 16))),
        background: FadeInImage(
          placeholder: AssetImage('assets/No_Image.jpg'),
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //textTheme: configurar un mismo tema para los textos
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: 200,
      width: double.infinity,
      //color: Colors.red,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                height: 150,
                placeholder: AssetImage('assets/No_Image.jpg'),
                image: NetworkImage('https://via.placeholder.com/300x400')),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.originalTitle',
                style: textTheme.subtitle1,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
