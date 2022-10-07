//Guilherme Diniz Lan

import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  void _calculate(){
    setState(() {
      if(_value == 1){
        if(dropdownvalue == 'Menos de R\$1212,00'){
          if(dropdownvalueChildren == '1 a 2 filhos'){
            _infoText = "Auxílio de 2,5 salários + R\$600,00!";
          }
          else if (dropdownvalueChildren == 'Mais de 3 filhos'){
            _infoText = "Auxílio de 3 salários + R\$600,00!";
          }
          else{
            _infoText = "Selecione a quantidade de filhos!";
          }
        }

        else if (dropdownvalue == 'Entre R\$1212,00 - 2424,00'){
          if(dropdownvalueChildren == '1 a 2 filhos'){
            _infoText = "Auxílio de 1,5 salários + R\$600,00!";
          }
          else if (dropdownvalueChildren == 'Mais de 3 filhos'){
            _infoText = "Auxílio de 3 salários + R\$600,00!";
          }
          else{
            _infoText = "Selecione a quantidade de filhos!";
          }
        }

        else {
          _infoText = "Selecione uma renda válida!";
        }
      }

      else if (_value == 2){
        if(dropdownvalue == 'Menos de R\$1212,00'){
          if(dropdownvalueChildren == '1 a 2 filhos'){
            _infoText = "Auxílio de 2,5 salários";
          }
          else if (dropdownvalueChildren == 'Mais de 3 filhos'){
            _infoText = "Auxílio de 3 salários";
          }
          else{
            _infoText = "Selecione a quantidade de filhos!";
          }
        }

        else if (dropdownvalue == 'Entre R\$1212,00 - 2424,00'){
          if(dropdownvalueChildren == '1 a 2 filhos'){
            _infoText = "Auxílio de 1,5 salários";
          }
          else if (dropdownvalueChildren == 'Mais de 3 filhos'){
            _infoText = "Auxílio de 3 salários";
          }
          else{
            _infoText = "Selecione a quantidade de filhos!";
          }
        }

        else {
          _infoText = "Selecione uma renda válida!";
        }
      }
    }
    );
  }
  @override

  String _infoText = "Informe seus dados";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();
  GlobalKey<FormState> _formKey3 = GlobalKey<FormState>();

  TextEditingController litersController = TextEditingController();

  //value radio coffee
  int? _value = 0;

  // Initial Selected Value
  String dropdownvalue = 'Selecione';

  String dropdownvalueChildren = 'Selecione';

  void _resetFields(){
    _formKey = GlobalKey<FormState>();
    setState(() {
      dropdownvalue = 'Selecione';
      dropdownvalueChildren = 'Selecione';
      litersController.text = '';
      _value = 0;
      _infoText = "Informe seus dados";
    });
  }


  // List of items in our dropdown menu
  var itemsCategory = [
    'Selecione',
    'Menos de R\$1212,00',
    'Entre R\$1212,00 - 2424,00',
  ];

  // List of items in our dropdown menu
  var itemsCategoryChildren = [
    'Selecione',
    '1 a 2 filhos',
    'Mais de 3 filhos',
  ];

  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text("Calcula bolsa"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.refresh),
              onPressed: _resetFields
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(50.0, 20.0, 50.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(Icons.family_restroom, size: 90.0, color: Colors.blue,),
            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: SizedBox(
                height: 80,
                width: 100,
                child: Form (
                  key: _formKey2,
                  child: DropdownButtonFormField(
                    style: const TextStyle(fontSize: 18.0, color: Colors.blue, ),
                    decoration: InputDecoration(
                      labelText: "Qual sua renda familiar?",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 3, color: Colors.blue)
                      ),
                    ),

                    value:  dropdownvalue,

                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: itemsCategory.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },

                    validator: (value){
                      if (value == 'Selecione'){
                        return "Insira a renda familiar!";
                      }
                    },
                  ),
                )
              ),
            ),

            Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: SizedBox(
                height: 80,
                width: 100,
                child: Form (
                  key: _formKey3,
                  child: DropdownButtonFormField(
                    style: const TextStyle(fontSize: 18.0, color: Colors.blue, ),
                    decoration: InputDecoration(
                      labelText: "Quantidade de filhos vacinados e na escola",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(width: 3, color: Colors.blue)
                      ),
                    ),

                    value:  dropdownvalueChildren,

                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: itemsCategoryChildren.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalueChildren = newValue!;
                      });
                    },

                    validator: (value){
                      if (value == 'Selecione'){
                        return "Insira a quantidade de filhos!";
                      }
                    },
                  ),
                )
              ),
            ),

            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[

                  Padding(padding: const EdgeInsets.fromLTRB(10, 25, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          SizedBox(
                            child: Text("Você é mulher chefe de família?"),
                          ),
                        ]
                    ),
                  ),

                  Padding(padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        SizedBox(
                          width: 50,
                          child: Radio(value: 1,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value;
                                });
                              },
                          ),
                        ),

                        const SizedBox(width: 72.0,
                          child: Text("SIM"),
                        ),

                        SizedBox(
                          width: 50,
                          child: Radio(value: 2,
                              groupValue: _value,
                              onChanged: (value){
                                setState(() {
                                  _value = value;
                                });
                              }
                          ),
                        ),

                        const SizedBox(width: 90.0,
                          child: Text("NÃO"),
                        ),

                      ],


                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 0.0, bottom: 20.0),
                    child: Container(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate() && _formKey2.currentState!.validate() && _formKey3.currentState!.validate()){
                            _calculate();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                        child: Text("Calcular", style:TextStyle(color: Colors.white, fontSize: 25.0),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "$_infoText",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 16.0),)
                ],


              ),
            ),


          ],
        ),
      ),
    );
  }
}