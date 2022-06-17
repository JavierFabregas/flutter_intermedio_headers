import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      )
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  @override
  void initState() {
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0,end: 2.0 * Math.pi).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacidad = Tween(begin: 0.1,end:1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    opacidadOut = Tween(begin: 1.0,end:0.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1, curve: Curves.easeOut))
    );

    moverDerecha = Tween(begin: 0.0,end:100.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );
    agrandar = Tween(begin: 0.0,end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    controller.addListener(() {
      
      if(controller.status == AnimationStatus.completed){
        // controller.reset();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Play
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget child){
        return Transform.scale(
          scale: agrandar.value,
          child: Transform.translate(
            offset: Offset(moverDerecha.value,0),
            child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: !(opacidad.value == 1) ? opacidad.value : opacidadOut.value,
                child: child
                )
            ),
          ),
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
        color: Colors.red,
      ),
    );
  }
}