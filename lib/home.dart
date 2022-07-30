import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 80,
                  spreadRadius: 0,
                  offset: Offset(0,0),
                )
              ]
            ),
            child: IconButton(
                onPressed: (){},
                icon: Image.asset('images/menina.jpg'
                ),
              padding: EdgeInsets.only(top: 25),
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(bottom: 25, top: 25),
        child: Center(
          child: Text('RANARA LORRANE ALVES DE MELO',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ),),
        Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 80,
                    spreadRadius: 0,
                    offset: Offset(0,0),
                  )
                ]
            ),
            child: IconButton(
                onPressed: (){},
                icon: Image.asset('images/menino.jpg'),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 25, top: 25),
        child: Center(
          child: Text('WOONDALL JUNIO NERO PINA',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        )
      ],
    ),);
  }
}
