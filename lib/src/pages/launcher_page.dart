import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:headers/src/routes/routes.dart';

class LauncherPage extends StatelessWidget {
  const LauncherPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diseños'),
      ),
      body: _ListaOpciones(),
      drawer: _MenuPrincipal(),
    );
  }
}

class _MenuPrincipal extends StatelessWidget {
  const _MenuPrincipal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Column(
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text('JF', style: TextStyle(fontSize: 50),)
                ),
              ),
            ),
            Expanded(
              child: _ListaOpciones(),
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline, color: Colors.blue),
              title: Text('Dark mode'),
              trailing: Switch.adaptive(
                onChanged: (bool val){},
                value: true,
                activeColor: Colors.blue,
                ),
            ),
            SafeArea(
              bottom: true,
              top:false,
              left: false,
              child: ListTile(
                leading: Icon(Icons.add_to_home_screen, color: Colors.blue),
                title: Text('Custom theme'),
                trailing: Switch.adaptive(
                  onChanged: (bool val){},
                  value: true,
                  activeColor: Colors.blue,
                  ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class _ListaOpciones extends StatelessWidget {
  const _ListaOpciones({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    
    return ListView.separated(
      itemCount: pageRoutes.length,
      physics: BouncingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: Colors.blue
      ),
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: FaIcon(pageRoutes[index].icon, color: Colors.blue),
        title: Text(pageRoutes[index].titulo),
        trailing: Icon(Icons.chevron_right, color: Colors.blue),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => pageRoutes[index].page)),
      ),
    );
  }
}