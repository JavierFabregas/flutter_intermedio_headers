import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers/src/models/SliderModel.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  const SlideShowPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SliderModel(),
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides()
                ),
              _Dots()
            ],
          ) 
          ),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  Color color = Colors.pinkAccent;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Dot(index: 0, color: color),
          _Dot(index: 1, color: color),
          _Dot(index: 2, color: color),
        ],
      ),

    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key key,
    @required this.color,
    @required this.index
  }) : super(key: key);

  final Color color;
  final double index;

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;
    return AnimatedContainer(
      width: 15,
      height: 15,
      margin: EdgeInsets.symmetric(horizontal:7),
      decoration: BoxDecoration(
        color: (pageViewIndex >= (index-0.5) && pageViewIndex < (index + 0.5)) // (pageViewIndex.round() == index)
          ? color 
          : Colors.grey,
        shape: BoxShape.circle
      ),
      duration: Duration(milliseconds: 200),
    );
  }
}

class _Slides extends StatefulWidget {
  
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
      Provider.of<SliderModel>(context, listen: false).currentPage = controller.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: controller,
        children: [
          _Slide(image: 'assets/svgs/slide-1.svg'),
          _Slide(image: 'assets/svgs/slide-4.svg'),
          _Slide(image: 'assets/svgs/slide-3.svg'),
        ],
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
    @required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(30.0),
      child: SvgPicture.asset(image),
    );
  }
}