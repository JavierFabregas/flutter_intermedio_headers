import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatefulWidget {
  CuadradoAnimadoPage({Key key}) : super(key: key);

  @override
  _CuadradoAnimadoPageState createState() => _CuadradoAnimadoPageState();
}

class _CuadradoAnimadoPageState extends State<CuadradoAnimadoPage> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      ),
    );
  }

}

class _CuadradoAnimado extends StatefulWidget {
  @override
  __CuadradoAnimadoState createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>  with SingleTickerProviderStateMixin{
   AnimationController controller;

  Animation<double> moverDerecha;

  Animation<double> moverArriba;

  Animation<double> moverIquierda;

  Animation<double> moverAbajo;

  @override
  void initState() {
    
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    
    moverDerecha = Tween(begin: 0.0, end:80.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.bounceOut))
    );
    
    moverArriba = Tween(begin: 0.0, end:80.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.25, 0.5, curve: Curves.bounceOut))
    );
    
    moverIquierda = Tween(begin: 0.0, end:80.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.5, 0.75, curve: Curves.bounceOut))
    );
    
    moverAbajo = Tween(begin: 0.0, end:80.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.bounceOut))
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    controller.forward();
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child){
        return Transform.translate(
          offset: Offset(moverDerecha.value - moverIquierda.value, moverAbajo.value - moverArriba.value),
          child: child,
        );
      }
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}



class _Rectangulo extends StatelessWidget {
  const _Rectangulo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.green,
      ),
    );
  }
}