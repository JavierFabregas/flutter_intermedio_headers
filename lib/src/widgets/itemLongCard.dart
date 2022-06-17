import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemLongCard extends StatelessWidget {
  const ItemLongCard({Key key,
   @required this.icon,
   @required this.text,
   this.color1 = Colors.grey,
   this.color2 = Colors.blueGrey,
   @required this.onTap
  }) : super(key: key);

  final String text;
  final IconData icon;
  final Color color1;
  final Color color2;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          _Background(color1: color1, color2: color2, icon: icon,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120, width: 40,),
              FaIcon(icon, size: 40, color: Colors.white),
              SizedBox(width: 20),
              Expanded(child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18),)),
              FaIcon(FontAwesomeIcons.chevronRight,  color: Colors.white),
              SizedBox(width: 40),
            ],
          )
        ],
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background({
    Key key, @required this.icon, @required this.color1, @required this.color2,
  }) : super(key: key);

  final IconData icon;
  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.symmetric(horizontal:20, vertical: 10),
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: Offset(4,6),
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient( 
          colors: [
            color1,
            color2
          ]
        )
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
               child: FaIcon(icon, size: 150, color: Colors.white.withOpacity(0.2)),
            )
          ]
        ),
      )
    );
  }
}