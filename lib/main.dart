import 'package:turistbogota/vistas/vistaprincipal.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);

  runApp(const Inicio());
}

class Inicio extends StatelessWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:  Container(

          decoration: BoxDecoration(
            image: DecorationImage(
                image:AssetImage('images/bogota1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //body: ListaMascotas(),
          body:VistaPrincipal()
          //body: Login(),
        ),
        ),
      );

  }
}
