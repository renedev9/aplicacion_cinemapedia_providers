import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class CardSwiper extends StatelessWidget {
  final List<Movie> ondisplay;
  const CardSwiper({
    super.key,
    required this.ondisplay,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //color: Colors.red,
      height: 300,
      width: double.infinity,
      child: Swiper(
        itemCount: 10,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.6,
        layout: SwiperLayout.STACK,
        itemBuilder: (BuildContext context, int index) {
          final movie = ondisplay[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'details');
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:
                    AssetImage('assets/icono-plano-de-la-cámara-108208723.jpg'),
                image: NetworkImage(movie.fullImg),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
