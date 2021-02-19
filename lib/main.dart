import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool valid = false;

  Color _ColorSquare() {
    if (valid == false) {
      return Color.fromARGB(255, 0, 175, 228);
    } else {
      return UniqueColorGenerator.getColor();
    }
  }

  Color _ColorSquareRounded() {
    if (valid == false) {
      return Color.fromARGB(255, 233, 66, 130);
    } else {
      return UniqueColorGenerator.getColor();
    }
  }

  Color _ColorCircle() {
    if (valid == false) {
      return Color.fromARGB(255, 149, 193, 31);
    } else {
      return UniqueColorGenerator.getColor();
    }
  }

  Color _ChangeColor() {
    valid = true;
    setState(() {});
  }

  void _Reset() {
    valid = false;
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Teste",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
              child:
              Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(MdiIcons.square, size: 75, color: _ColorSquare()),
                    Icon(MdiIcons.squareRounded,
                        size: 75, color: _ColorSquareRounded()),
                    Icon(MdiIcons.circle, size: 75, color: _ColorCircle())
                  ]
              )
          ),
          Container(
            width: 700,
            height: 100,
            child: Image.asset('assets/Images/SpB.png'),
          ),
          Divider(),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: _ChangeColor,
              child: Text(
                'Vai!',
                style: TextStyle(fontSize: 25),
              ),
              color: Colors.pink,
              textColor: Colors.white,
            ),
            RaisedButton(
              padding: EdgeInsets.all(10),
              onPressed: _Reset,
              child: Text(
                'Reset!',
                style: TextStyle(fontSize: 25),
              ),
              color: Colors.pink,
              textColor: Colors.white,
            )
          ])
        ],
      ),
    );
  }
}

class UniqueColorGenerator {
  static Random random = new Random();

  static Color getColor() {
    List<Color> paleta = [
      Color.fromARGB(255, 78, 66, 79),
      Color.fromARGB(255, 139, 139, 137),
      Color.fromARGB(255, 196, 75, 53),
      Color.fromARGB(255, 225, 112, 44),
      Color.fromARGB(255, 237, 181, 12),
      Color.fromARGB(255, 100, 19, 17),
      Color.fromARGB(255, 164, 66, 115),
      Color.fromARGB(255, 233, 66, 130),
      Color.fromARGB(255, 54, 44, 65),
      Color.fromARGB(255, 98, 61, 96),
      Color.fromARGB(255, 4, 119, 161),
      Color.fromARGB(255, 37, 156, 194),
      Color.fromARGB(255, 0, 175, 228),
      Color.fromARGB(255, 38, 104, 52),
      Color.fromARGB(255, 149, 193, 31),
    ];
    return paleta[random.nextInt(paleta.length)];
  }
}
