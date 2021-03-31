import 'dart:ui';
import 'package:admin_crud_flutter/view/v_sqflite_crud.dart';
import 'package:flutter/material.dart';
import 'v_localtemp_crud.dart';

void main() {
  runApp(MaterialApp(
    title: "App",
    theme: ThemeData(),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin CRUD")),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.only(top: 40),
        child: Column(
          children: [
            SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return Localtemp();
                    }));
                  },
                  child: Text("Local Temp CRUD")),
            ),
            SizedBox(
              width: 200,
              child: ElevatedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return SqfliteCrud();
                }));
              }, child: Text("SQFlite CRUD")),
            ),
          ],
        ),
      ),
    );
  }
}
