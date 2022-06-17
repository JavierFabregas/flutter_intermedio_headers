import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SlideShow extends StatelessWidget {
  const SlideShow({Key key,
    @required this.slides,
    this.puntosArriba = false,
    this.colorPrimario = Colors.blueAccent,
    this.colorSecundario = Colors.grey,
    this.bulletPrimario = 12,
    this.bulletSecundario = 12
  }) : super(key: key);
  final List<Widget> slides;
  final bool puntosArriba;
  final Color colorPrimario;
  final Color colorSecundario;
  final double bulletPrimario;
  final double bulletSecundario;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _SlideshowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context){
              Provider.of<_SlideshowModel>(context).colorPrimario = this.colorPrimario;
              Provider.of<_SlideshowModel>(context).colorSecundario = this.colorSecundario;
              Provider.of<_SlideshowModel>(context).bulletPrimario = this.bulletPrimario;
              Provider.of<_SlideshowModel>(context).bulletSecundario = this.bulletSecundario;
              return _SlideShowContent(puntosArriba: puntosArriba, slides: slides);
            },
          ) 
        ),
      ),
    );
  }
}

class _SlideShowContent extends StatelessWidget {
  const _SlideShowContent({
    Key key,
    @required this.puntosArriba,
    @required this.slides,
  }) : super(key: key);

  final bool puntosArriba;
  final List<Widget> slides;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (puntosArriba) _Dots(number: slides.length),
        Expanded(
          child: _Slides(slides: slides,)
          ),
        if (!puntosArriba) _Dots(number: slides.length),
      ],
    );
  }
}

class _Dots extends StatelessWidget {
  final int number;

  const _Dots({Key key,@required this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(number, (i) => _Dot(index: i,)),
      ),

    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    @required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideshowModel>(context);
    // final pageViewIndex = Provider.of<_SlideshowModel>(context).currentPage;
    // final colorPrimario = Provider.of<_SlideshowModel>(context)
    // final colorSecundario = Provider.of<_SlideshowModel>(context)
    double size;
    Color color;
    if(slideShowModel.currentPage >= (index-0.5) && slideShowModel.currentPage < (index + 0.5)){
        size = slideShowModel.bulletPrimario;
        color = slideShowModel.colorPrimario;
    }else{
        size = slideShowModel.bulletSecundario;
        color = slideShowModel.colorSecundario;
    }
    return AnimatedContainer(
      width: size,
      height: size,
      margin: EdgeInsets.symmetric(horizontal:7),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle
      ),
      duration: Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  
  final List<Widget> slides;

  const _Slides({Key key,@required this.slides}) : super(key: key);
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  String image;
  PageController controller = new PageController();

  @override
  void initState() { 
    super.initState();
    controller.addListener((){
      Provider.of<_SlideshowModel>(context, listen: false).currentPage = controller.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: controller,
        children: widget.slides.map((slide) => _Slide(slide: slide) ).toList()
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    controller.dispose();
  }

}

class _Slide extends StatelessWidget {
  const _Slide({
    Key key,
    @required this.slide,
  }) : super(key: key);

  final Widget slide;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30.0),
      child: slide
      // child: SvgPicture.asset(image),
    );
  }
}

class _SlideshowModel with ChangeNotifier{
  double _currentPage = 0;
  Color _colorPrimario = Colors.blue;
  Color _colorSecundario = Colors.grey;
  double _bulletPrimario = 12;
  double _bulletSecundario = 12;

  double get currentPage => this._currentPage;

  set currentPage (double currentPage) {
    this._currentPage = currentPage;
    notifyListeners();
  }

  Color get colorPrimario => this._colorPrimario;

  set colorPrimario (Color colorPrimario) {
    this._colorPrimario = colorPrimario;
  }

  Color get colorSecundario => this._colorSecundario;

  set colorSecundario (Color colorSecundario) {
    this._colorSecundario = colorSecundario;
  }

  double get bulletPrimario => this._bulletPrimario;

  set bulletPrimario (double bulletPrimario) {
    this._bulletPrimario = bulletPrimario;
  }

  double get bulletSecundario => this._bulletSecundario;

  set bulletSecundario (double bulletSecundario) {
    this._bulletSecundario = bulletSecundario;
  }
}