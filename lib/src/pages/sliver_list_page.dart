import 'package:flutter/material.dart';

class SliverPage extends StatelessWidget {
  const SliverPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MainScroll(),
          Positioned(
            bottom: -10,
            right: 0,
            child: _BottomButton()
          )
        ],
      )
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
    return ButtonTheme(
      minWidth: size.width *0.9,
      height: 100,
      child: RaisedButton(
        onPressed: () {  },
        color: Color(0xffED6762),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))
        ),
        child: Text(
          'CREATE NEW LIST',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 3 
          )
        ),
        ),
    );
  }
}

class MainScroll extends StatelessWidget {
  const MainScroll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          floating: true,
          delegate: _SliverCustomHeaderDelegate(
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.white,
              child: Title()
            ),
            maxHeight: 200, 
            minHeight: 170)
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Item( 'Orange', Color(0xffF08F66) ),
              Item( 'Family', Color(0xffF2A38A) ),
              Item( 'Subscriptions', Color(0xffF7CDD5) ),
              Item( 'Books', Color(0xffFCEBAF) ),
              Item( 'Orange', Color(0xffF08F66) ),
              Item( 'Family', Color(0xffF2A38A) ),
              Item( 'Subscriptions', Color(0xffF7CDD5) ),
              Item( 'Books', Color(0xffFCEBAF) ),
              SizedBox(height: 100,)
            ]
          )
            
        )
      ]
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;
  _SliverCustomHeaderDelegate({@required this.minHeight, @required this.maxHeight, @required this.child});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);
  }

  @override
  double get maxExtent => (maxHeight > minHeight) ? maxHeight : minHeight;

  @override
  double get minExtent => (maxHeight > minHeight) ? minHeight : maxHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || 
           minHeight != oldDelegate.minHeight ||
           child != oldDelegate.child;
  }
}

class Title extends StatelessWidget {
  const Title({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        Container(
          margin: EdgeInsets.symmetric(horizontal:30, vertical:10),
          child: Text('NEW', style: TextStyle(color: Color(0xff532128), fontSize: 50))
        ),
        Stack(
          children: [
            SizedBox(width: 90,),
            Positioned(
              bottom:8,
              child: Container(
                width: 150,
                height: 8,
                color: Color(0xfff7cdd5),
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Color(0xffD93A30), fontSize: 50, fontWeight: FontWeight.bold))),
          ],
        )
      ],
    );
  }
}

class ItemList extends StatelessWidget {
  ItemList({
    Key key,
  }) : super(key: key);

  final items = [
    Item( 'Orange', Color(0xffF08F66) ),
    Item( 'Family', Color(0xffF2A38A) ),
    Item( 'Subscriptions', Color(0xffF7CDD5) ),
    Item( 'Books', Color(0xffFCEBAF) ),
    Item( 'Orange', Color(0xffF08F66) ),
    Item( 'Family', Color(0xffF2A38A) ),
    Item( 'Subscriptions', Color(0xffF7CDD5) ),
    Item( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => items[index],);
  }
}

class Item extends StatelessWidget {
  const Item( this.text, this.color);
  final String text;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(text, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      margin: EdgeInsets.all(10),
      height: 130,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: color
      ),
    );
  }
}