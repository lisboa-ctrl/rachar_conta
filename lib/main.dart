import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'SegundaTela.dart';

void main() => runApp(AppDevideConta());

class AppDevideConta extends StatefulWidget {
  @override
  _AppDevideContaState createState() => _AppDevideContaState();
}

class _AppDevideContaState extends State<AppDevideConta> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }
}

body(context)
{
  return Container(
    padding: EdgeInsets.all(16),
    width: double.infinity,
    color: Colors.black,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
      Text('Rachar Conta',
        style: new TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = LinearGradient(
              colors: <Color>[Colors.deepPurple, Colors.lightBlue],
            ).createShader(Rect.fromLTWH(135.0, 50.0, 200.0, 70.0))
          ),
        ),
        RaisedButton(
          color: Colors.black,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(125.0),
              side: BorderSide(color: Colors.deepPurpleAccent)
          ),
          child:
          Text('Next',
          style: TextStyle(
            color: Colors.lightBlue
          ),),
          onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SegundaTela()
              )
            );
          },
        ),
    ],
    ),
  );
}

