import 'package:flutter/material.dart';
import 'package:flutter_app_peliculas/models/movie.model.dart';

class MovieSlider extends StatelessWidget {
  final List<Movie> moviePopular;
  const MovieSlider({super.key, required this.moviePopular});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.40,
      width: double.infinity,
      //    color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text('Populares',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 5,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: moviePopular.length,
                itemBuilder: (BuildContext context, int index) {
                  final popular = moviePopular[index];
                  return _MoviePoster(
                    img: popular.fullImg,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final String img;
  const _MoviePoster({Key? key, required this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      //color: Colors.green,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details',
                  arguments: 'Argumentos de la ruta');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/No_Image.jpg'),
                image: NetworkImage(img),
                width: 130,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            'Stawars : el reronoadfafdfdgrtwgtr4gewrgwergwergwer',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
    ;
  }
}
