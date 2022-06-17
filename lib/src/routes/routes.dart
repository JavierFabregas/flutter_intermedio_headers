import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:headers/src/pages/Headers_page.dart';
import 'package:headers/src/pages/SlideShowPage.dart';
import 'package:headers/src/pages/emergency_page.dart';
import 'package:headers/src/pages/graficas_circulares_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';
import 'package:headers/src/pages/sliver_list_page.dart';
import 'package:headers/src/retos/cuadrado_animado_page.dart';

final pageRoutes = <_Routes>[
  _Routes(icon: FontAwesomeIcons.slideshare,page: SlideShowPage(),titulo: 'SlideShow'),
  _Routes(icon: FontAwesomeIcons.ambulance,page: EmergencyPage(),titulo: 'Emergencias'),
  _Routes(icon: FontAwesomeIcons.heading,page: HeadersPage(),titulo: 'Headers'),
  _Routes(icon: FontAwesomeIcons.peopleCarry,page: CuadradoAnimadoPage(),titulo: 'Cuadrado animado'),
  _Routes(icon: FontAwesomeIcons.circleNotch,page: GraficaCircularPage(),titulo: 'Circulos progreso'),
  _Routes(icon: FontAwesomeIcons.pinterest,page: PinterestPage(),titulo: 'Pinterest'),
  _Routes(icon: FontAwesomeIcons.mobile,page: SliverPage(),titulo: 'Slivers'),
];

class _Routes {
  final IconData icon;
  final String titulo;
  final Widget page;

  _Routes({@required this.icon,@required  this.titulo,@required  this.page});
}