import'package:flutter/material.dart';

class Somos extends StatefulWidget {
  const Somos({Key? key}) : super(key: key);

  @override
  State<Somos> createState() => _SomosState();
}

class _SomosState extends State<Somos> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child:Center(
            child: Column(
              children: [
                _cardOne(),
                _cardTwo(),
                _cardThree(),
              ],
            ),
          ),
        ),
      ),
    );

  }
  Widget _cardOne() {
    return Card(
      elevation: 10,
      child: Container(
          color: Colors.yellowAccent,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text('BogotaTuris',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontFamily: 'Contenido',
                  color: Colors.red,

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'Descripcion de lo que busca la aplicacion, W/le.app_mascota( 7876): Accessing hidden method Ljava/security/spec/ECParameterSpec;->getCurveName()Ljava/lang/String; (light greylist, reflection)')
            ],
          )

      ),
    );
  }
  Widget _cardTwo(){
    return Card(
      elevation: 10,
      child: Container(

        child: Column(
          children: [
            FadeInImage(placeholder: AssetImage('images/Somos5.png'),
                image: AssetImage('images/Somos5.png')
            )
          ],
        )
      ),
    );
  }
  Widget _cardThree(){
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(20),
        color: Colors.red,
        child: Column(
          children: [
            Text('Como funciona?',
            style: TextStyle(
              fontFamily: "Titulo",
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Explicacion de como se usa,D/FirebaseAuth(17619): Notifying "
                "id token listeners about user ( SuJwlwHy01MxSs6pa1J0buPoCEi1 ).")
          ],
        )
      )
    );
  }
}

