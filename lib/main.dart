import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:teste_app/widget_to_image.dart';
import './utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:gallery_saver/gallery_saver.dart';

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

  GlobalKey key1;
  Uint8List bytes1;

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetToImage(
              builder: (key) {
                this.key1 = key;
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.square,
                                    size: 75, color: _ColorSquare()),
                                Icon(MdiIcons.squareRounded,
                                    size: 75, color: _ColorSquareRounded()),
                                Icon(MdiIcons.circle,
                                    size: 75, color: _ColorCircle())
                              ])),
                      Container(
                        width: 700,
                        height: 100,
                        child: Image.asset('assets/Images/SpB.png'),
                      ),
                    ],
                  ),
                );
              },
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: elevatedButtonstyle,
                      onPressed: _ChangeColor,
                      child: Text(
                        'Vai!',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                    ElevatedButton(
                      style: elevatedButtonstyle,
                      onPressed: _Reset,
                      child: Text(
                        'Reset!',
                        style: TextStyle(fontSize: 25),
                      ),
                    )
                  ]),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: elevatedButtonstyle,
                child: Text(
                  'Caputure',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () async {
                  final bytes1 = await Utils.capture(key1);
                  setState(() {
                    this.bytes1 = bytes1;
                  });
                },
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Image",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            buildImage(bytes1),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: ElevatedButton(
                style: elevatedButtonstyle,
                child: Text(
                  'Save on gallery',
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () async {
                  _saveScreenshot(bytes1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveScreenshot(pngBytes) async {
    try {
      //extract bytes

      //create file
      final String dir = (await getApplicationDocumentsDirectory()).path;
      final String fullPath = '$dir/${DateTime.now().millisecond}.png';
      File capturedFile = File(fullPath);
      await capturedFile.writeAsBytes(pngBytes);
      print(capturedFile.path);

      await GallerySaver.saveImage(capturedFile.path).then((value) {
        setState(() {});
      });
    } catch (e) {
      print(e);
    }
  }

  Widget buildImage(Uint8List bytes1) =>
      bytes1 != null ? Image.memory(bytes1) : Container();
}

final ButtonStyle elevatedButtonstyle = ElevatedButton.styleFrom(
    padding: EdgeInsets.all(10), primary: Colors.pink, onPrimary: Colors.white);

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
