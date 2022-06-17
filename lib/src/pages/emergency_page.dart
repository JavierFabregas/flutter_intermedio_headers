import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/widgets/headers.dart';
import 'package:headers/src/widgets/itemLongCard.dart';
import 'package:animate_do/animate_do.dart';

class ItemBoton {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton( this.icon, this.texto, this.color1, this.color2 );
}


class EmergencyPage extends StatelessWidget {
  const EmergencyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
      new ItemBoton( FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5) ),
      new ItemBoton( FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6) ),
      new ItemBoton( FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3) ),
      new ItemBoton( FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D) ),
    ];

    List<Widget> itemMap = items.map(
      (item) => FadeInLeft(
        duration: Duration(milliseconds: 200),
        child: ItemLongCard(
          icon: item.icon,
          onTap: (){print('Tap! ${item.texto}');},
          text: item.texto,
          color1: item.color1,
          color2: item.color2
        ),
      )
    ).toList();
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top:200),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  SizedBox(height: 80),
                  ...itemMap
                ],
              ),
            ),
            PageHeader()
          ],
        )
      )
    );
  }
}

class ItemTemp extends StatelessWidget {
  const ItemTemp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemLongCard(icon: FontAwesomeIcons.accessibleIcon, onTap: (){print('Tap!');}, text: 'Accidente de coche', color1: Colors.red, color2: Colors.redAccent);
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          title: 'Asistencia médica!',
          subTitle: 'Has solicitado',
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
        ),
        Positioned(
          top:40,
          right: 0,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white)
          ),
        )
      ],
    );
  }
}