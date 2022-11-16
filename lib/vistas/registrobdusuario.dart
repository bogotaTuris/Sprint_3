import'package:flutter/material.dart';

class RegistroBDUsuario extends StatefulWidget {
  const RegistroBDUsuario({Key? key}) : super(key: key);

  @override
  State<RegistroBDUsuario> createState() => _RegistroBDUsuarioState();
}

class _RegistroBDUsuarioState extends State<RegistroBDUsuario> {
  final _nombre= TextEditingController();
  final _apellido= TextEditingController();
  final _correo= TextEditingController();
  final _celular= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6, vertical: 8),
        child: Center(
          child:SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                Container(

                ),
                TextFormField(
                  controller: _nombre,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText:'Nombre'
                  )
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _apellido,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                        labelText: 'apellido'
                  ),
                ),
                TextFormField(
                  controller: _correo,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo',

                  ),
                ),
                TextFormField(
                  controller: _celular,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Celular'
                  ),
                )
              ]
            )
          )
        )
      )
    );
  }
}
