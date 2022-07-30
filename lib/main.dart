import 'package:flutter/material.dart';
import 'package:procura_se_df/configPerfil.dart';
import 'package:procura_se_df/doacoes.dart';
import 'package:procura_se_df/doar.dart';
import 'package:procura_se_df/home.dart';
import 'package:procura_se_df/perfil.dart';
import 'package:procura_se_df/pets.dart';
import 'package:procura_se_df/post_person.dart';
import 'package:procura_se_df/post_pets.dart';
void main(){
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: principal()));
}
class principal extends StatefulWidget {
  const principal({Key? key}) : super(key: key);

  @override
  _principalState createState() => _principalState();
}

class _principalState extends State<principal> {
  List screens = [
   // Home(),
    pets(),
    Doacoes(),
    Perfil()
  ];
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        title: Center(
          child: /*_current == 0 ? Text('Pessoas desaparecidas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow[800]
            ),
          ) :*/
          _current == 0 ? Text('Animais desaparecidos',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.yellow[800]
          )) :
          _current == 1 ? Text('Doações',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[800]
              )) :
               Text('Perfil',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.yellow[800]
                  ))
        ),
      ),
      body: screens[_current],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 3,
        unselectedItemColor: Color.fromRGBO(19, 19, 19, 1),
        selectedItemColor: Colors.white,
        backgroundColor: Colors.yellow[800],
        type: BottomNavigationBarType.fixed,
        currentIndex: _current,
        onTap:(index) => setState(() => _current = index),
        iconSize: 25,
        items: [
         /* BottomNavigationBarItem(
              icon: Icon(
                Icons.pan_tool,),
          label: 'Pessoas',
          ),*/
          BottomNavigationBarItem(
              icon: Icon(
                Icons.pets,),
              label: 'Animais',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.paid,),
              label: 'Doações',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,),
              label: 'Perfil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
       /* if(_current == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => PostPerson()));
        }*/
        if(_current == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => PostPets()));
        }
        if(_current == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => Doar()));
        }
        if(_current == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => Config()));
        }
      },
      child: //_current == 0 ? Icon(Icons.add) :
      _current == 0 ? Icon(Icons.add):
      _current == 1 ? Icon(Icons.paid) :
       Icon(Icons.manage_accounts),
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        foregroundColor: Colors.yellow[800],
      )
    );
  }
}
