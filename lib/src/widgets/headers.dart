import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}
class HeaderRedondeado extends StatelessWidget {
  const HeaderRedondeado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderFormaPainer(),
      ),
    );
  }
}

class _HeaderFormaPainer extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = new Rect.fromCircle(
      center: Offset(150.0,0.0),
      radius: 200
    );
    final Gradient gradient = new LinearGradient(
      colors: <Color>[
        // Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ]
    );
      final paint = Paint()..shader = gradient.createShader(rect);

      // Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 10;

      final path  = Path();
      
      // Dibujar con el paint y el path
      path.moveTo(0, 0);
      path.lineTo(0, size.height*0.25);
      path.quadraticBezierTo(size.width*0.25, size.height*0.3,size.width*0.5, size.height*0.25);
      path.quadraticBezierTo(size.width*0.75, size.height*0.2,size.width, size.height*0.25);
      path.lineTo(size.width, size.height*0.25);
      path.lineTo(size.width, 0);
      path.lineTo(0, 0);

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    throw true;
  }
}

class IconHeader extends StatelessWidget {

  final IconData icon;
  final String title;
  final String subTitle;
  final Color color1;
  final Color color2;

  const IconHeader(
    {Key key,
     @required this.icon,
     @required this.title,
     @required this.subTitle,
     this.color1 = Colors.blue,
     this.color2 = Colors.blueAccent
    }) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
  Color whiteColor = Colors.white.withOpacity(0.7);
    return Stack(
      children: [
        _IconHeaderBackground(color1: color1, color2: color2,),
        Positioned(
          top:-50,
          left: -60,
          child: FaIcon(
            // FontAwesomeIcons.plus,
            icon,
            size: 250,
            color: Colors.white.withOpacity(0.2)
          ),
        ),
        Column(
          children: [
            SizedBox(height: 80,width: double.infinity,),
            Text(title, style: TextStyle(fontSize: 20, color: whiteColor)),
            SizedBox(height: 20,),
            Text(subTitle, style: TextStyle(fontSize: 25, color: whiteColor, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            FaIcon(
              // FontAwesomeIcons.plus,
              icon,
              size: 50,
              color: Colors.white
            ),
          ],
        )
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  const _IconHeaderBackground({
    Key key, this.color1, this.color2,
  }) : super(key: key);
  final Color color1;
  final Color color2;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)) ,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            color1,
            color2
          ]
        )
      ),
    );
  }
}