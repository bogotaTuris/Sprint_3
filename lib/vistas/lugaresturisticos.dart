

import 'dart:ffi';

import 'package:flutter/material.dart';

class lugaresturisticos extends StatefulWidget {
  const lugaresturisticos({Key? key}) : super(key: key);

  @override
  State<lugaresturisticos> createState() => _LugaresTuristicosState();
}

class _LugaresTuristicosState extends State<lugaresturisticos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment(0,1),
            colors: [
              Colors.yellowAccent,
              Color.fromARGB(150, 255, 0, 0)
            ]
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            title: Text("Turist Bogota"),
            backgroundColor: Color.fromARGB(150, 255, 0, 0),

          ),
          backgroundColor: Colors.transparent,
          body: ListView(
          children:[

            Container(
              margin: EdgeInsets.only(bottom: 8, top: 8),
              color: Color.fromARGB(150, 255, 0, 0),
              child: ListTile(
                title: Text('lugares de Bogota'),
                subtitle: Text('Contenido'),
                leading: Icon(
                  Icons.add_location_alt_sharp,
                  color: Colors.green,
              ),
            ),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top:5),
            child: ListTile(
              title: Text('Monserrate'),
              subtitle: Text('Contenido'),
              leading: Icon(
                Icons.add_location_alt_sharp,
                color: Colors.green,
              ),
            ),
          ),
        ]
      ),
      ),
      ),
    );
  }
}
