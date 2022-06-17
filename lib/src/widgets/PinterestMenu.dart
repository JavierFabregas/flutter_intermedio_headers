import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PinterestMenu extends StatelessWidget {
  PinterestMenu({this.mostrar, this.backgroundColor : Colors.white, this.activeColor: Colors.greenAccent, this.inactiveColor: Colors.grey,@required this.items});
  final bool mostrar;

  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final List<PinterestButton> items;
  
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 200),
        opacity: (mostrar) ? 1 : 0,
        child: Builder(
          builder: (BuildContext context) {
              Provider.of<_MenuModel>(context).backgroundColor = backgroundColor;
              Provider.of<_MenuModel>(context).activeColor = activeColor;
              Provider.of<_MenuModel>(context).inactiveColor = inactiveColor;
              return  _MenuBackground(child: _MenuItems(items: items,),);
            },
          )
      )
    );
  }
}

class _MenuBackground extends StatelessWidget {
  const _MenuBackground({
    Key key,
    @required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    _MenuModel model = Provider.of<_MenuModel>(context);
    return Container(
      width: 250,
      height: 60,
      child: child,
      decoration: BoxDecoration(
        color: model.backgroundColor,
        borderRadius: BorderRadius.circular(100),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black38,
            blurRadius: 10,
            spreadRadius: -5
            ),
          
        ]
      ),
    );
  }
}

class _MenuItems extends StatelessWidget {
  const _MenuItems({
    Key key, this.items,
  }) : super(key: key);
  final List<PinterestButton> items;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(items.length, (i) => _PinterestMenuButton(index:i,pinterestButton:items[i] )),
    );
  }
}

class _PinterestMenuButton extends StatelessWidget {
  const _PinterestMenuButton({Key key,@required this.index,@required this.pinterestButton}) : super(key: key);
  final int index;
  final PinterestButton pinterestButton;
  @override
  Widget build(BuildContext context) {
    _MenuModel model = Provider.of<_MenuModel>(context);
    return GestureDetector(
      onTap: (){
        model.itemSeleccionado = index;
        pinterestButton.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        child: Icon(
          pinterestButton.icon,
          size: (model.itemSeleccionado ==  index) ? 35 : 25,
          color: (model.itemSeleccionado ==  index)
            ? model.activeColor
            : model.inactiveColor
        ),
      ),
    );
  }
}

class PinterestButton{
  final Function onPressed;
  final IconData icon;

  PinterestButton({@required this.onPressed,@required this.icon});
}

class _MenuModel with ChangeNotifier{
  int _itemSeleccionado = 0;
  Color _backgroundColor;
  Color _activeColor;
  Color _inactiveColor;

  int get itemSeleccionado => this._itemSeleccionado;

  set itemSeleccionado(int index){
    this._itemSeleccionado = index;
    notifyListeners();
  }
  
  Color get backgroundColor => this._backgroundColor;

  set backgroundColor(Color value){
    this._backgroundColor = value;
  }
  
  Color get activeColor => this._activeColor;

  set activeColor(Color value){
    this._activeColor = value;
  }
  
  Color get inactiveColor => this._inactiveColor;

  set inactiveColor(Color value){
    this._inactiveColor = value;
  }
}