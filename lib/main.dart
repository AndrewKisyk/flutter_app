import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.white;
  var _rnd = new Random();

  void setRndCollor() {
    setState(() {
      _color = randomColor();
    });
  }

  Color randomColor() {
    return Color.fromRGBO(
      _rnd.nextInt(256),
      _rnd.nextInt(256),
      _rnd.nextInt(256),
      _rnd.nextDouble(), //transparency from 0.0 to 1.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: double.infinity,
        height: double.infinity,
        color: _color,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        child: InkWell(
          onTap: setRndCollor,
          child: Center(
            child: Text(
              'Hey there',
            ),
          ),
        ),
      ),
    );
  }
}
