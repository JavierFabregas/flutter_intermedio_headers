import 'package:flutter/material.dart';
import 'package:headers/src/widgets/SlideShow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Slide()),
          Expanded(child: Slide()),
        ],
      ),
    );
  }
}

class Slide extends StatelessWidget {
  const Slide({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideShow(
      // puntosArriba: true,
      colorPrimario: Colors.green[800],
      colorSecundario: Colors.green[400],
      bulletPrimario: 15.0,
      bulletSecundario: 12.0,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
        SvgPicture.asset('assets/svgs/slide-6.svg'),
      ],
    );
  }
}