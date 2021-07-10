import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
          child: ElevatedButton(
        //Ejemplo de un boton primary de Material Design
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            primary: Colors.blue),
        child: Text(
          'Mostrar Alerta',
          style: TextStyle(color: Colors.white),
        ),

        onPressed: () => _mostrarlert(context),
      )),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  _mostrarlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {

          return AlertDialog(
              title: Text('Titulo'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Contenido del column en la alerta'),
                  FlutterLogo(size: 100,)
                ],
              ),
              actions: [
                TextButton(onPressed: ()=> Navigator.of(context).pop(), child: Text('Cancelar')),
                TextButton(onPressed: ()=> Navigator.of(context).pop(), child: Text('Ok'))
              ],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              );
        });
  }
}
