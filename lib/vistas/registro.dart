import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turistbogota/vistas/lugaresturisticos.dart';
import 'package:turistbogota/vistas/tituloprincipal.dart';
import 'package:turistbogota/repository/registrousuariofirebase.dart';


class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  RegistroUsuarioFirebase objetoRegistroUsuarioFB = RegistroUsuarioFirebase();
  final usuario = TextEditingController();
  final clave = TextEditingController();
  String usu= "";
  String cla= "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bogotaAurora.jpg'),
                fit: BoxFit.cover
          ),
        ),
       child: Scaffold(
          backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.all(10),

          child: ListView(
           children: [
           Container(
            child: Titulo(),
            margin: EdgeInsets.only(bottom: 40),
          ),

           Container(
            child:Text('Registro',
              style: TextStyle(
                color: Colors.white, fontSize: 26,
                fontFamily: 'contenido'
              ),
            ),
            margin: EdgeInsets.only(bottom: 15),

          ),
            txtusuario(),
            txtclave(),
            btnRegistro(),
        ],
      ),
      ),
      ),
      ),
    );
  }
  Container txtusuario(){
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration:BoxDecoration(
        color: Colors.white,
        border: Border.all(color:Colors.yellowAccent, width: 2),
        borderRadius: BorderRadius.circular(2),
      ),
      child: TextFormField(
        style:(TextStyle(fontSize: 20)
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Nombre de usuario'
        ),
        controller: usuario,
      )
    );
  }
  Container txtclave() {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.yellowAccent, width: 2),
          borderRadius: BorderRadius.circular(2),
        ),
        child: TextFormField(
          style: (TextStyle(fontSize: 20)),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Nueva clave'

          ),
          controller: clave,
        ),
    );
  }
  ElevatedButton btnRegistro(){
    return ElevatedButton(
      style: TextButton.styleFrom(
        backgroundColor: Colors.cyanAccent,
      ),
      child: Text('Registrar',
      style: TextStyle(
        fontSize: 22,
        color: Colors.white,

      ),
      ),
      onPressed: ()async {
        usu = usuario.text;
        cla = clave.text;
        final datos = await objetoRegistroUsuarioFB.registrarusuario(usu, cla);
        print(datos);
        if(datos=="weak-password"){
          Fluttertoast.showToast(msg: "La contraseña debe tener minimo 6 caracteres",
              toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
        }
        else if (datos == "email-already-in-use"){
          Fluttertoast.showToast(msg: "E-mail ya existe, ingrese uno diferente",
              toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
        }
        else if (datos == "invalid-email"){
          Fluttertoast.showToast(msg: "Revise si el e-mail cumple requisitos, @ y sin caracteres",
          toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
        }
        else if (datos == "Network-request-failed"){
          Fluttertoast.showToast(msg: "Fallo en la conexión de internet",
          toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
        }
        else if (datos == "user-not-found"){
          Fluttertoast.showToast(msg: "Usuario no encontrado",
              toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER);
        }
        else{
          Fluttertoast.showToast(msg: "Datos registrados", toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
        }
      }
          );
        }
      }



