import 'package:components_flutter/src/providers/menu_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    /* menuProvider.cargarData().then((opciones) {
      print(opciones);
    }); */

    /*  */

    return FutureBuilder(
      future: menuProvider.cargarData(),
      /* initialData: [], */
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List? data, BuildContext context) {
    final List<Widget> opciones = [];

    data?.forEach((opt) {
      var code = int.parse(opt["icon"]);
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: returnIcon(code),
        trailing: returnIcon(0xe355),
        onTap: () {
          Navigator.pushNamed((context), opt['ruta']);
          /* final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route); */
        },
      );

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }

/* IconData(57418, fontFamily: 'MaterialIcons') 
IconData(57404, fontFamily: 'MaterialIcons') 
IconData(58020, fontFamily: 'MaterialIcons')
IconData(57411, fontFamily: 'MaterialIcons')
IconData(0xe355, fontFamily: 'MaterialIcons')*/
  Icon returnIcon(int codigo) {
    return Icon(IconData(codigo, fontFamily: 'MaterialIcons'),
        color: Colors.blue);
  }
}
