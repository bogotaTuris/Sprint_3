import"package:flutter/material.dart";

import '../model/lugares.dart';

class DetalleLugar extends StatefulWidget {
  final Lugares lugares;
  const DetalleLugar(this.lugares, {Key? key}) : super(key: key);

  @override
  State<DetalleLugar> createState() => _DetalleLugarState();
}

class _DetalleLugarState extends State<DetalleLugar> {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        home:Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title:Text("Lugares Turisticos"),
              leading: Icon(Icons.arrow_back)
            ),
             body:Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment(0,1),
                  colors:[
                    Colors.yellowAccent,
                    Color.fromARGB(150, 255, 0, 0)
                  ]
                )
              ),
                child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            child:Text(widget.lugares.lugar,
                              style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30,
                                fontFamily: 'Titulo', color: Colors.red,
                              ),
                            )
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: Image.network(
                            widget.lugares.imagen
                        )
                        ),
                        _cartaCandelaria()


                      ],
                    )
                )

            )
        )
    );
  }
  Widget _cartaCandelaria(){
    return Card(
      color: Colors.transparent,
        child: Container(

          padding: EdgeInsets.all(8),
          width: 400,
          color: Colors.transparent,
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    width: 160,
                    child: Text('Descripción', style: TextStyle(
                      fontFamily: 'Titulo', fontSize: 22,
                    ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    color: Colors.transparent,
                    width: 160,
                    child: Text(widget.lugares.descripcion1)
                    ),

                ],
              ),
              Container(
                color: Colors.transparent,
                margin: EdgeInsets.only(left: 30),
                width: 170,
                height: 150,
                child: Image.network(widget.lugares.imagen2)
                ),

            ],
          ),
        )
    );
  }
}
