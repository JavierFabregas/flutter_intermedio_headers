import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:headers/src/widgets/PinterestMenu.dart';
import 'package:provider/provider.dart';
 
class PinterestPage extends StatelessWidget {
  const PinterestPage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width  = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => _MenuModel(),
      child: Scaffold(
        body: Stack(
          children: [
            PinterestGrid(),
            PinteresMenuLocated(width: width),
          ],
        ),
      ),
    );
  }
}

class PinteresMenuLocated extends StatefulWidget {
  const PinteresMenuLocated({
    Key key,
    @required this.width,
  }) : super(key: key);

  final double width;

  @override
  _PinteresMenuLocatedState createState() => _PinteresMenuLocatedState();
}

class _PinteresMenuLocatedState extends State<PinteresMenuLocated> {

  @override
  Widget build(BuildContext context) {
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 30,
      child: Container(
        width: widget.width,
        child: Align(
          child: PinterestMenu(
            mostrar: mostrar,
            // backgroundColor: Colors.red,
            // activeColor: Colors.blue,
            // inactiveColor: Colors.purpleAccent,
            items: [
              PinterestButton(icon: Icons.pie_chart, onPressed: (){print('pie_chart');}),
              PinterestButton(icon: Icons.search, onPressed: (){print('search');}),
              PinterestButton(icon: Icons.notifications, onPressed: (){print('notifications');}),
              PinterestButton(icon: Icons.supervised_user_circle, onPressed: (){print('supervised_user_circle');}),
            ]
          )
        )
      )
    );
  }
}

class PinterestGrid extends StatefulWidget {
  const PinterestGrid({
    Key key,
  }) : super(key: key);

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List<int>.generate(200, (i) =>i);
  ScrollController controller = ScrollController();
  double lastPosition = 0;

  @override
  void initState() { 
    super.initState();
    controller.addListener((){
      print('ScrollListener ${controller.offset}');
      if(controller.offset>lastPosition && controller.offset >150){
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
        print('Ocultar menu');
      }else{
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
        print('Mostrar menu');
      }
      lastPosition = controller.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => PinterestItem(index: index,),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
  
  @override
  void dispose(){
    controller.dispose();
  }
}

class PinterestItem extends StatelessWidget {
  const PinterestItem({
    Key key, this.index,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}

class _MenuModel with ChangeNotifier{
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor){
    this._mostrar = valor;
    notifyListeners();
  }
}