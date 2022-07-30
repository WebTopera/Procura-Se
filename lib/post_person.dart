import 'dart:io';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class PostPerson extends StatefulWidget {
  const PostPerson({Key? key}) : super(key: key);

  @override
  _PostPersonState createState() => _PostPersonState();
}

class _PostPersonState extends State<PostPerson> {

  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();
  TextEditingController text7 = TextEditingController();
  DateTime date = DateTime.now();
  File ? _image;
  Future getImage(ImageSource) async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        this._image = imageTemporary;
      });
    } on PlatformException catch(e){
      print('Erro em pegar a imagem: ${e}');
    }
  }
  var maskFormatter = new MaskTextInputFormatter(
  mask: '(##) #####-####',
  filter: { "#": RegExp('[0-9]') },
  type: MaskAutoCompletionType.eager
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(19, 19, 19, 1),
        title: Center(child: Text('Desapareceu ?',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellow[800]),
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: text1,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Digite o nome da pessoa'),
                ),
                style: TextStyle(
                  color: Colors.yellow[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                readOnly: true,
                controller: text2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Data do desaparecimento'),
                ),
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(19, 19, 19, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              child: Text('Selecione a data',
                style: TextStyle(color: Colors.yellow[800]),
              ),
              onPressed: () async {
                DateTime ? newDate = await showDatePicker(
                    context: context,
                    initialDate: date,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now());
                if(newDate == null) return;
                setState(() {
                  date = newDate;
                  text2.text = '${date.day}/${date.month}/${date.year}';
                });
              },
            ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: text3,
                keyboardType: TextInputType.number,
                maxLength: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Idade atual'),
                ),
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: text4,
                keyboardType: TextInputType.number,
                maxLength: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Idade de desaparecimento'),
                ),
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: text5,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Região'),
                ),
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                inputFormatters: [maskFormatter],
                controller: text6,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Número para contato'),
                ),
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: text7,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Informações adicionais'),
                ),
                style: TextStyle(
                    color: Colors.yellow[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(15),
              child: _image != null 
                ? Image.file(
                _image!,
                width: 250,
                height: 250,
                fit: BoxFit.cover,
              ) : Image.network('https://www.tenda.com/eudouconta/wp-content/uploads/2021/09/Pessoa-fisica-mobile.jpg')),
            Padding(padding: EdgeInsets.all(15),
              child: ButtonCustum(
                  title: 'Escolha uma imagem da galeria',
                  icon: Icons.image_outlined,
                  onClick: () { getImage(ImageSource.gallery);
                  }),),
            Padding(padding: EdgeInsets.all(15),
              child: ButtonCustum(
                  title: 'Escolha uma imagem da galeria',
                  icon: Icons.camera,
                  onClick: (){
                    getImage(ImageSource.camera);
                  }),),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(19, 19, 19, 1),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )
                ),
                child: Container(
                  width: 100,
                  child: Row(
                    children: [
                      Icon(Icons.send, color: Colors.yellow[800],),
                      SizedBox(width: 20,),
                      Text('Postar',
                        style: TextStyle(color: Colors.yellow[800]),
                      ),
                    ],
                  ),
                ),
                onPressed: (){
                  print(
                      'Nome: ${text1.text}\n'
                      'Data de dasaparecimento: ${text2.text}\n'
                      'Idade atual: ${text3.text}\n'
                      'Idade de desaparecimento: ${text4.text}\n'
                      'Região: ${text5.text}\n'
                      'Número: ${text6.text}\n'
                      'Detalhes: ${text7.text}\n'
                      'Imagem: ${_image.toString()}'
                  );
                },
              ),
            )
          ],
        ),
      ),
      );
  }
}
Widget ButtonCustum({
  required String title,
  required IconData icon,
  required VoidCallback onClick
}){
  return Container(
    width: 280,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Color.fromRGBO(19, 19, 19, 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          )
      ),
      onPressed: onClick,
      child: Row(
        children: [
          Icon(icon, color: Colors.yellow[800],),
          SizedBox( width: 20),
          Text(title,
          style: TextStyle(color: Colors.yellow[800]),
          ),
        ],
      )
    ),
  );
}
