import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuartaTela extends StatefulWidget
{
  var custoItem;
  var numPessoasItem;
  var valorTotalConta;
  var numPessoas;

  QuartaTela({this.custoItem, this.numPessoasItem, this.valorTotalConta, this.numPessoas});
  @override
  _QuartaTelaState createState() => _QuartaTelaState(custoItem: this.custoItem, numPessoasItem: this.numPessoasItem, valorTotalConta: this.valorTotalConta, numPessoas: this.numPessoas);
}

class _QuartaTelaState extends State<QuartaTela> {
  var custoItem;
  var numPessoasItem;
  var valorTotalConta;
  var numPessoas;

  _QuartaTelaState({this.custoItem, this.numPessoasItem, this.valorTotalConta, this.numPessoas});
  @override
  Widget build(BuildContext context) {
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
    print(valorTotalConta.toString()+" "+numPessoas.toString()+" "+custoItem.toString()+" "+numPessoasItem.toString());
    var gorjeta = (this.valorTotalConta/10)/this.numPessoas;
    var valorFinalTodos =  gorjeta + ((this.valorTotalConta-this.custoItem) / this.numPessoas);
    var valorFinalItem = valorFinalTodos + (this.custoItem/this.numPessoasItem);

    return Container(
      child: Column(
        children: <Widget>[
          new Row(
              children: <Widget>[
                showInfo('Valor geral'),
                Icon(Icons.attach_money),
                Text(
                  valorFinalTodos.toStringAsFixed(2),
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
              showInfo('Valor específico'),
              Icon(Icons.add_circle_outline),
              Text(
                valorFinalItem.toStringAsFixed(2),
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple
                ),
              )
            ],
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
}


