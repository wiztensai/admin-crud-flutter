import 'package:flutter/material.dart';
import 'view/v_localtemp_crud.dart';

void main() {
  runApp(MaterialApp(
    title: "App",
    theme: ThemeData(),
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin CRUD")),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Localtemp();
                  }));
                },
                child: Text("Local Temp CRUD")),
            ElevatedButton(onPressed: () {}, child: Text("SQFlite CRUD")),
          ],
        ),
      ),
    );
  }
}
