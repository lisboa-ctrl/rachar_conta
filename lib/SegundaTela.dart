import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'TerceiraTela.dart';


class SegundaTela extends StatefulWidget {
  @override
  _SegundaTelaState createState() => _SegundaTelaState();
}

class _SegundaTelaState extends State<SegundaTela> {

  //VARIAVEIS
  List<String> _currencies = ['integral', 'parcial'];
  String selectedItem = 'integral';
  var _formKey = GlobalKey<FormState>();
  var _txtNumeroPessoas = TextEditingController();
  var _txtValorConta = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home:coletarDados(),
      debugShowCheckedModeBanner: false,
    );
  }

  coletarDados()
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dados da conta'),
        backgroundColor: Colors.purple
      ),
      body: body(),
    );
  }

  body()
  {
      return Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Row(
                children: <Widget>[
                  Text(
                    'Tipo de divisão: ',
                    style: TextStyle(
                    fontSize: 18,
                    ),
                  ),
                  DropdownButton<String>(
                  items: _currencies.map((String dropDownStringItem)
                  {
                   return DropdownMenuItem<String>(
                     value: dropDownStringItem,
                     child: Text(
                         dropDownStringItem,
                         style: TextStyle(
                             fontSize: 18
                         )
                     ),
                   );
                 }).toList(),
                 onChanged: (String newSelectedItem)
                 {
                   setState(() {
                     this.selectedItem = newSelectedItem;
                   });
                 },
                 value: selectedItem,
                  ),
                ],
              ),
              RaisedButton.icon(
                onPressed: (){
                  createDialog(context);
                },
                icon: Icon(Icons.info_outline),
                label: Text('Info'),
                color: Colors.white,
              ),
              _editText('Número de pessoas que vão pagar', _txtNumeroPessoas, Icon(Icons.people)),
              _editText('Valor total da conta', _txtValorConta, Icon(Icons.attach_money)),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(125.0),
                  side: BorderSide(color: Colors.deepPurpleAccent)
              ),
              child: Text('Calcular'),
              onPressed: (){
                  if(_formKey.currentState.validate())
                    {
                      Navigator.push(context,
                          MaterialPageRoute(
                              builder: (context) => TerceiraTela(selectedItem: selectedItem, numPessoas: double.parse(_txtNumeroPessoas.text),valorTotalConta: double.parse(_txtValorConta.text),
                              )
                          )
                      );
                    }
               },
            ),
           ],
          )
        )
      );
  }

  createDialog(BuildContext context)
  {
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text('Divisão de conta',
        style: TextStyle(
          color: Colors.lightBlue
          ),
        ),
        content: Container(
          width: 400,
          height: 100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Parcial: Itens específicos serão divididos entre alguns',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('\n\nIntegral: A conta será divida entre todos igualmente',
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            elevation: 5.0,
            child: Text('ok',
                style: TextStyle(
                color: Colors.lightBlue
              ),
            ),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      );
    });
  }

  String _validate(String text, String field)
  {
    if(text.isEmpty)
      {
        return 'Digite $field';
      }
    return null;
  }

  _editText(String field, TextEditingController controller, Widget icon)
  {
    return TextFormField(
      controller: controller,
      validator: (s) => _validate(s, field),
      keyboardType: TextInputType.number,
      style: TextStyle(
        fontSize: 14,
        color: Colors.blue,
      ),
      decoration: InputDecoration(
        labelText: field,
        icon: icon,
      labelStyle: TextStyle(
        fontSize: 17,
        color: Colors.grey,
      ),
    ),
    );
  }
}

