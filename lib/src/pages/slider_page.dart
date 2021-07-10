import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSLider = 100;
  bool _blockCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              _crearSlider(),
              _crearCheckBox(),
              _crearSwitch(),
              Expanded(child: _crearImagen())
            ],
          )),
    );
  }

  _crearSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Tamaño de la imagen',
        /* divisions: 20, */
        value: _valorSLider,
        min: 10,
        max: 400,
        onChanged: (_blockCheck)
            ? null
            : (valor) => setState(() {
                  _valorSLider = valor;
                }));
  }

  _crearImagen() {
    return Image(
        image: NetworkImage(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTffY2_D5YjjG8Mn3NnOFrXG2Piu72Ff5rbyHiyZXFvkWWtE3pLojAwOXpxAbC7PZa0JpU&usqp=CAU '),
        width: _valorSLider,
        fit: BoxFit.contain);
  }

  _crearCheckBox() {
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (val) => setState(() {
              _blockCheck = val!;
            }));
  }

  _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _blockCheck,
        onChanged: (val) => setState(() {
              _blockCheck = val;
            }));
  }
}
