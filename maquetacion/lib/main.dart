import 'dart:math';
import 'dart:ui' as prefix0;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
        .copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            _fondoApp(),
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _titulos(),
                  _botonesRedondeados(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(context),
      ),
    );
  }

  Widget _fondoApp() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.6),
            end: FractionalOffset(0.0, 1),
            colors: [
              Color.fromRGBO(52, 54, 101, 1.0),
              Color.fromRGBO(35, 37, 57, 1.0)
            ]),
      ),
    );

    final cajaRosa = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        height: 340.0,
        width: 340.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(236, 98, 188, 1.0),
              Color.fromRGBO(241, 142, 172, 1.0)
            ]),
            borderRadius: BorderRadius.circular(90.0)),
      ),
    );

    return Stack(
      children: <Widget>[
        gradiente,
        Positioned(child: cajaRosa, top: -80.0),
      ],
    );
  }

  Widget _titulos() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Classify transaction",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10.0,
            ),
            Text("Classify this transaction into a particular category",
                style: TextStyle(color: Colors.white, fontSize: 18.0)),
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
          primaryColor: Colors.pinkAccent,
          textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(115, 117, 152, 1.0)),
              )),
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_today,
              size: 30.0,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bubble_chart,
              size: 30.0,
            ),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.supervised_user_circle,
              size: 30.0,
            ),
            title: Container(),
          ),
        ],
      ),
    );
  }

  Widget _botonesRedondeados() {
    return Table(
      children: <TableRow>[
        TableRow(children: [
          _crearBotonRedondeado(Colors.blue, Icons.border_all, "General"),
          _crearBotonRedondeado(Colors.purpleAccent, Icons.directions_bus, "Bus"),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.pinkAccent, Icons.shop, "Buy"),
          _crearBotonRedondeado(Colors.orange, Icons.insert_drive_file, "File"),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.blueAccent, Icons.movie_filter, "Entertainment"),
          _crearBotonRedondeado(Colors.green, Icons.cloud, "Grocery"),
        ]),
        TableRow(children: [
          _crearBotonRedondeado(Colors.red, Icons.collections, "Photos"),
          _crearBotonRedondeado(Colors.teal, Icons.help_outline, "Help"),
        ]),
      ],
    );
  }

  Widget _crearBotonRedondeado(Color color, IconData icono, String texto) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(70.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Container(
          height: 180.0,
          margin: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 66, 107, 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 3.0,
              ),
              CircleAvatar(
                radius: 35.0,
                backgroundColor: color,
                child: Icon(icono, color: Colors.white, size: 40.0),
              ),
              Text(
                texto,
                style: TextStyle(color: color),
              ),
              SizedBox(
                height: 3.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
