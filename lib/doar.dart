import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:procura_se_df/post_person.dart';
class Doar extends StatefulWidget {
  const Doar({Key? key}) : super(key: key);

  @override
  _DoarState createState() => _DoarState();
}

class _DoarState extends State<Doar> {
  TextEditingController doacao = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(19, 19, 19, 1),
          title: Center(
            child: Text('Doar',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow[800])
            ),
          ),
        ),
        body: Column(

          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: TextFormField(
                controller: doacao,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Digite o valor a ser doado'),
                ),
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
        Container(
          width: 120,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(19, 19, 19, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  )
              ),
              onPressed: (){
                print('Valor doado: ${doacao.text} reais');
              },
              child: Row(
                children: [
                  Icon(Icons.paid, color: Colors.yellow[800],),
                  SizedBox( width: 20),
                  Text('Doar',
                    style: TextStyle(color: Colors.yellow[800]),
                  ),
                ],
              )
          ),
        ),
          ],
        ),
      );
  }
}
