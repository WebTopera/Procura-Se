import 'package:flutter/material.dart';
class Doacoes extends StatefulWidget {
  const Doacoes({Key? key}) : super(key: key);

  @override
  _DoacoesState createState() => _DoacoesState();
}

class _DoacoesState extends State<Doacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(

              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 25),
            child: Text('MANTENHA O PROJETO ATIVO!',
              style: TextStyle(color: Colors.yellow[800],
                fontWeight: FontWeight.bold,
                fontSize: 27
              ),
            ),
          )),
          Center(
            child:Text('Dezenas de pessoas são ajudadas todos os dias pelo Procura-se,\najude-nos também com uma doação!',
    style: TextStyle(color: Color.fromRGBO(19, 19, 19, 1),
    fontSize: 23,
    ),
              textAlign: TextAlign.center,
          ),
            )
        ],
      ),
    );
  }
}
