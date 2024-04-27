import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../models/models.dart';

class MovieProvider extends ChangeNotifier {
  final String _apikey = '3a555d1bb18ce2d7a2477d95efc41735';
  final String _language = 'es-ES';
  final String _baseUrl = 'api.themoviedb.org';
  List<Movie> onDisplayMovies = [];
  List<Movie> onDisplayPopular = [];

  MovieProvider() {
    print('Provider Inicializado');
    getonDisplayMovies();
    getonDisplayPopular();
  }

  getonDisplayMovies() async {
    print('Lanzando MovieProvider');

    var url = Uri.https(_baseUrl, '3/movie/now_playing', {
      'api_key': _apikey,
      'language': _language,
      'page': '1',
    });
    var response = await http.get(url);

    final responseBody = NowPlaying.fromJson(response.body);
    onDisplayMovies = responseBody.results;
    print('Este es el titulo de una pelicula ' + responseBody.results[0].title);
    notifyListeners();
  }

  getonDisplayPopular() async {
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apikey,
      'language': _language,
      'page': '1',
    });
    var response = await http.get(url);

    final responsePopular = PopularResponse.fromJson(response.body);
    onDisplayPopular = [...onDisplayPopular, ...responsePopular.results];

    notifyListeners();
  }
}
