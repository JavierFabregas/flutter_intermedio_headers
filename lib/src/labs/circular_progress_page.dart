import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  CircularProgressPage({Key key}) : super(key: key);

  @override
  _CircularProgressPageState createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage> with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentaje = 0.0;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    controller.addListener(() {
      // print('valor controller ${controller.value}');
      setState((){
        porcentaje = lerpDouble(porcentaje,nuevoPorcentaje,controller.value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        backgroundColor: Colors.pink,
        onPressed: (){
          setState((){
            if(porcentaje >= 100){
              porcentaje = 00;
              nuevoPorcentaje = 0.0;
            }else{
              porcentaje = nuevoPorcentaje;
              nuevoPorcentaje += 10;
            }
          });
          controller.forward(from: 0.0);
        },
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.orange,
          child: CustomPaint(
            painter: _MiRadialProgressPainter(porcentaje)
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _MiRadialProgressPainter extends CustomPainter{

  final porcentaje;

  _MiRadialProgressPainter(this.porcentaje);

  @override
  void paint(Canvas canvas, Size size) {

    // final porcentaje = 40;

    final paint = new Paint()
    ..strokeWidth = 4
    ..color = Colors.grey
    ..style = PaintingStyle.stroke;

    final centro = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(centro, radio, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    // Parte coloreada
    double arcAngle = 2 * pi * (porcentaje/100);

    canvas.drawArc(
        Rect.fromCircle(center: centro, radius: radio),
        -pi/2,
        arcAngle,
        false,
        paintArco
      );
    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}