import 'package:flutter/material.dart';
import 'package:flutter_app_peliculas/providers/movie_providers.dart';
import 'package:provider/provider.dart';
import 'screen/screens.dart';

void main() {
  runApp(RunProvider());
}

class RunProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MovieProvider(),
        )
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light()
          .copyWith(appBarTheme: AppBarTheme(color: Colors.indigo)),
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomeScreen(),
        'details': (BuildContext context) => DetailsScreen(),
      },
    );
  }
}
