import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


class RadialProgress extends StatefulWidget {

final double porcentaje;
final List<Color> colorPrimario;
final Color colorSecundario;
final double grosorPrimario;
final double grosorSecundario;

  RadialProgress({Key key,
    @required this.porcentaje,
    this.colorPrimario = const [Colors.red, Colors.purple, Colors.purpleAccent],
    this.colorSecundario = Colors.grey,
    this.grosorSecundario = 4,
    this.grosorPrimario = 10
  }) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>  with SingleTickerProviderStateMixin{

  AnimationController controller;
  double porcentajeAnterior;

  @override
    void initState() {
      porcentajeAnterior = widget.porcentaje;
      controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
      
      super.initState();
    }

  @override
  Widget build(BuildContext context) {

    controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget child) { 
          return Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            height: double.infinity,
            child: CustomPaint(
              painter: _MiRadialProgressPainter((widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value), widget.colorPrimario, widget.colorSecundario, widget.grosorSecundario, widget.grosorPrimario)
            ),
          );
       },
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
  final List<Color> primaryColor;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;

  _MiRadialProgressPainter(this.porcentaje, this.primaryColor, this.colorSecundario, this.grosorSecundario, this.grosorPrimario);

  @override
  void paint(Canvas canvas, Size size) {

    // final porcentaje = 40;

    final rect = new Rect.fromCircle(center: Offset(0,0), radius: 180);
    final Gradient gradiente = new LinearGradient(
      colors: primaryColor
      // <Color>[
      //   Color(0xffC012FF),
      //   Color(0xff6D05E8),
      //   Colors.red
      // ]
    );

    final paint = new Paint()
    ..strokeWidth = grosorSecundario
    ..color = colorSecundario
    ..style = PaintingStyle.stroke;

    final centro = new Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(centro, radio, paint);

    // Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      // ..color = primaryColor
      ..shader = gradiente.createShader(rect)
      ..strokeCap = StrokeCap.round
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