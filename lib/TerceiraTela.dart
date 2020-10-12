import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'QuartaTela.dart';



class TerceiraTela extends StatefulWidget {
  String selectedItem;
  double valorTotalConta;
  double numPessoas;

  TerceiraTela({this.selectedItem, this.numPessoas, this.valorTotalConta});
  @override
  _TerceiraTelaState createState() => _TerceiraTelaState(selectedItem: this.selectedItem, numPessoas: this.numPessoas, valorTotalConta: this.valorTotalConta);
}

class _TerceiraTelaState extends State<TerceiraTela> {
  String selectedItem;
  double valorTotalConta;
  double numPessoas;
  _TerceiraTelaState({this.selectedItem, this.numPessoas, this.valorTotalConta});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:home(),
      debugShowCheckedModeBanner: false,
    );
  }

  home()
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagar'),
        backgroundColor: Colors.purple,
      ),
      body: body(),
    );
  }

  body()
  {
    if(selectedItem == 'integral')
    {
        return integral();
    }
    else
    {
      return parcial();
    }
  }

  Widget parcial()
  {
    TextEditingController _txtNumPessoasItem = TextEditingController();
    TextEditingController _txtCustoItem = TextEditingController();
    var _formkey = GlobalKey<FormState>();
    return Container(
        child: Form(
          key: _formkey,
          child: Column(
          children: <Widget>[
             _editText('Quantos vão pagar o item específicos', _txtNumPessoasItem, Icon(Icons.people)),
              _editText('Total do item especifico', _txtCustoItem, Icon(Icons.attach_money)),
              FlatButton(
                onPressed: (){
                  if(_formkey.currentState.validate())
                  {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => QuartaTela(custoItem: double.parse(_txtCustoItem.text),numPessoasItem: double.parse(_txtNumPessoasItem.text), numPessoas: numPessoas, valorTotalConta: valorTotalConta)
                            )
                        );
                  }
                },
                child: Text('Calcular',
                style: TextStyle(
                  color: Colors.purple
                  )
                ),
                color: Colors.white,
              )
            ],
          )
        )
    );
  }

  Widget integral()
  {
    double valorFinal;
    double gorjeta;

    valorFinal = calcularIntegral();
    gorjeta = (valorTotalConta / 10)/numPessoas;
    return Container(
      child: Column(
        children: <Widget>[
          new Row(
              children: <Widget>[
                showInfo('Cada um pagará'),
                Icon(Icons.attach_money),
                Text(
                  valorFinal.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple
                  ),
                )
              ]
          ),
          new Row(
            children: <Widget>[
              showInfo('10% do garçom'),
              Icon(Icons.priority_high),
              Text(
                gorjeta.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  BoxDecoration myBox()
  {
    return BoxDecoration(
      border: Border.all(
        width: 3,
        color: Colors.purple
      ),
      borderRadius: BorderRadius.all(Radius.circular(5.0))
    );
  }

  Widget showInfo(String text)
  {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(5.0),
      decoration: myBox(),
      child: Row(
        children: <Widget>[
          Text(text,
            style: TextStyle(fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          )
        ],
      )
    );
  }

  String _validate(String text, String field)
  {
    if(text.isEmpty || double.parse(text) > valorTotalConta)
    {
      return 'Digite $field';
    }
    return null;
  }

  calcularIntegral() => (valorTotalConta/10+valorTotalConta) / numPessoas;

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

