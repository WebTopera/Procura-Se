import 'package:flutter/material.dart';
class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text('Configurar perfil',
            style: TextStyle(fontSize: 25),
          )
      ),
    );;
  }
}
