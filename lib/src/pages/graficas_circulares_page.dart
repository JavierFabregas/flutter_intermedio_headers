import 'package:flutter/material.dart';
import 'package:headers/src/widgets/radial_progress.dart';

class GraficaCircularPage extends StatefulWidget {
  @override
  _GraficaCircularPageState createState() => _GraficaCircularPageState();
}

class _GraficaCircularPageState extends State<GraficaCircularPage>{

  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                 colorPrimario: [Colors.green, Colors.blue, Colors.yellow],
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                 colorPrimario: [Colors.red, Colors.purple, Colors.brown],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(
                porcentaje: porcentaje,
                 colorPrimario: [Colors.amberAccent, Colors.yellowAccent, Colors.red],
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          porcentaje+=10;
          setState((){});
          if(porcentaje > 100){
            porcentaje = 0;
          }
        },
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {
  
final double porcentaje;
final List<Color> colorPrimario;
final Color colorSecundario;
// final double grosorPrimario;
// final double grosorSecundario;

  const CustomRadialProgress({
    Key key,
    @required this.porcentaje,
    this.colorPrimario = const [Colors.red, Colors.purple, Colors.purpleAccent],
    this.colorSecundario = Colors.grey,
    // this.grosorPrimario,
    // this.grosorSecundario,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('Secundario -> ${colorSecundario.toString()}');
    return Container(
      width: 150,
      height: 150,
      child:RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        grosorPrimario: 10,
        grosorSecundario: 4,
      )
    );
  }
}