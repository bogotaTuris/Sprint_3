

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:turistbogota/vistas/detallelugar.dart';

import '../model/lugares.dart';

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
            title: Text("Lugares turisticos Bogota"),
            backgroundColor: Color.fromARGB(150, 255, 0, 0),

          ),
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StreamBuilder<QuerySnapshot>(
               stream:FirebaseFirestore.instance.collection("LugaresTuristicos").snapshots(),
               builder:(context,snapshot) {
                if (snapshot.hasError) {
                  return Text("Error en la consulta");
                }
                if (!snapshot.hasData) {
                  return Text("No existen datos");
                }


                child:
                return ListView.builder(
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      QueryDocumentSnapshot LugaresTuristicosBD = snapshot.data!
                          .docs[index];

                      return Card(
                        child: Column(
                          children:[
                            Container(
                              margin: EdgeInsets.only(bottom: 8, top: 8),

                              child: ListTile(

                                title: Text(LugaresTuristicosBD ["lugar"],
                                  style: TextStyle(fontSize: 22),),
                                subtitle: Text("Zona: "+LugaresTuristicosBD["zona"]+"\n"+
                                    "Guia: "+LugaresTuristicosBD['nombre_guia']+" "+
                                    LugaresTuristicosBD['apellido_guia']+"\n"+
                                    "Correo: "+LugaresTuristicosBD['correo']),
                                leading: Image.network(LugaresTuristicosBD["imagen"]
                                ),
                               onTap: (){
                                  Lugares lugares = Lugares(LugaresTuristicosBD["nombre_guia"],
                                      LugaresTuristicosBD["apellido_guia"],LugaresTuristicosBD["correo"],
                                      LugaresTuristicosBD["celular"], LugaresTuristicosBD["lugar"],
                                      LugaresTuristicosBD["zona"], LugaresTuristicosBD["descripcion1"],
                                      LugaresTuristicosBD["imagen"], LugaresTuristicosBD["imagen2"]);

                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DetalleLugar(lugares)));
                               }
                            ),
                          ),

                        ]
                        ),
                      );
                      Container(
                        color: Colors.white,
                        margin: EdgeInsets.only(top: 5),
                        child: ListTile(
                          title: Text('Monserrate'),
                          subtitle: Text('Contenido'),
                          leading: Icon(
                            Icons.add_location_alt_sharp,
                            color: Colors.green,
                          ),
                        ),
                      );
                    }
                );
              }
          ),
      )
      ),
    ),
    );
  }
}
