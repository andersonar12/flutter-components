import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listNumbers = [];
  int _lastItem = 0;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _add10Items();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        /* _add10Items(); */
        _fecthData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas')),
      body: Stack(
        children: [_crearLista(), _crearLoading()],
      ),
    );
  }

  _crearLista() {
    /* Se puede usar para renderizar varios Widgets a partir de un array o un loop customizado */
    return RefreshIndicator(
      onRefresh: getPageOne,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _listNumbers.length,
          itemBuilder: (BuildContext context, int index) {
            final img = _listNumbers[index];
            return FadeInImage(
                placeholder: AssetImage('assets/073 jar-loading.gif'),
                image:
                    NetworkImage('https://picsum.photos/500/300?image=$img'));
          }),
    );
  }

  Future<void> getPageOne() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listNumbers.clear();
      _lastItem++;
      _add10Items();
    });

    return Future.delayed(duration);
  }

  _add10Items() {
    setState(() {
      for (var i = 0; i < 10; i++) {
        _lastItem++;
        _listNumbers.add(_lastItem);
      }
    });
  }

  _fecthData() async {
    isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration,
        _responseHTTP); /* <- Tip: no se coloca el parentesis de la funcion xq eso significa que la ejecutaria en el inatante */
  }

  _responseHTTP() {
    isLoading = false;
    _add10Items();
  }

  _crearLoading() {
    if (isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(height: 15)
        ],
      );
    } else {
      return Container();
    }
  }
}
