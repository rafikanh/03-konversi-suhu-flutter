//Nama  : Rafika Nurhayati
//Kelas : MI2F
//NIM   : 2031710081

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'widget/convert.dart';
import 'widget/input.dart';
import 'widget/result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  TextEditingController etInput = new TextEditingController();
  //state
  double _inputUser = 0;
  double _kelvin = 0;
  double _reamur = 0;

  konversi() {
    //set state
    setState(() {
      _inputUser = double.parse(etInput.text);
      _kelvin = _inputUser + 273;
      _reamur = 4 / 5 * _inputUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Konverter Suhu (2031710081 - Rafika Nurhayati)"),
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(etInput: etInput),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Result(result: _kelvin, title: "Suhu dalam Kelvin"),
                  Result(result: _reamur, title: "Suhu dalam Reamur"),
                ],
              ),
              Convert(
                konversi: konversi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
