import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cards'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0), 
          children: returnCards()
        )
    );
  }

  Widget _cardTipo1() {
    return Card(
      elevation: 10,
      /* Para las sombras */
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20)) /* Para las bordes del card */,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Soy el titulo de esta tarjeta'),
            subtitle: Text(
                'If the [style] argument is null, the text will use the style from the closest enclosing [DefaultTextStyle].'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: () {}, child: Text('Cancelar')),
              TextButton(onPressed: () {}, child: Text('Ok'))
            ],
          )
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/073 jar-loading.gif'),
            image: NetworkImage(
                'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 250,
            fit: BoxFit.cover,
          ),
          /* Image(image: NetworkImage('https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg')) */
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Subtitulo cualquiera'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(2, 10))
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: card,
      ),
    );
  }

  List<Widget> returnCards() {
    List<Widget> arrayWidget  = [];

    for (var i = 0; i < 10; i++) {

     arrayWidget..add(_cardTipo1())
                ..add(SizedBox(height: 30))
                ..add(_cardTipo2())
                ..add(SizedBox(height: 30));
    }

    return arrayWidget;
  }
}
