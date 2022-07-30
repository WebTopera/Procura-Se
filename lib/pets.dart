import 'package:flutter/material.dart';
class pets extends StatefulWidget {
  const pets({Key? key}) : super(key: key);

  @override
  _petsState createState() => _petsState();
}

class _petsState extends State<pets> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                icon: Image.asset('images/auaubert einstein.jpg'
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 25, top: 0),
              child: Text('AUAUBERT EINSTEIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
          ),
          Center(
            child: Container(
              height: 245,
              width: 245,
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
                icon: Image.asset('images/pacudinho.jpg'),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 25, top: 25),
              child: Text('PANÇUDINHO',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          )
        ],
      ),);;
  }
}
