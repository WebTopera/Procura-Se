import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:procura_se_df/post_person.dart';
class PostPets extends StatefulWidget {
  const PostPets({Key? key}) : super(key: key);

  @override
  _PostPetsState createState() => _PostPetsState();
}

class _PostPetsState extends State<PostPets> {
  TextEditingController text1 = TextEditingController();
  TextEditingController text2 = TextEditingController();
  TextEditingController text3 = TextEditingController();
  TextEditingController text4 = TextEditingController();
  TextEditingController text5 = TextEditingController();
  TextEditingController text6 = TextEditingController();
  TextEditingController text7 = TextEditingController();
  TextEditingController text8 = TextEditingController();
  DateTime date = DateTime.now();
  File ? _imagepets;
  Future getImage(ImageSource) async{
    try {
      final image = await ImagePicker().pickImage(source: ImageSource);
      if (image == null) return;
      final imageTemporarypets = File(image.path);
      setState(() {
        this._imagepets = imageTemporarypets;
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
                  label: Text('Digite o nome do animal'),
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
                controller: text2,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Animal'),
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
                controller: text3,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  label: Text('Raça do animal'),
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
                controller: text4,
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
                    text4.text = '${date.day}/${date.month}/${date.year}';
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: text5,
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
                controller: text6,
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
                controller: text7,
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
                controller: text8,
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
                child: _imagepets != null
                    ? Image.file(
                  _imagepets!,
                  width: 250,
                  height: 250,
                  fit: BoxFit.cover,
                ) : Image.network('https://i.pinimg.com/280x280_RS/11/f2/c8/11f2c864da7a66bc52183738c5b02bad.jpg')),
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
                          'Animal: ${text2.text}\n'
                          'Raça do animal: ${text3.text}\n'
                          'Data de desaparecimento: ${text4.text}\n'
                          'Idade atual: ${text5.text}\n'
                          'Região: ${text6.text}\n'
                          'Número: ${text7.text}\n'
                          'Detalhes: ${text8.text}\n'
                          'Imagem: ${_imagepets.toString()}'
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
