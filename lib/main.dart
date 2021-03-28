import 'package:flutter/material.dart';
import 'dialog/D_AddPlace.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData(), home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titles = [
    'bike',
    'boat',
    'bus',
    'car',
    'railway',
    'run',
    'subway',
    'transit',
    'walk'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin CRUD')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              DialogUtils.showCustomDialog(context, callbacktest: () {
                setState(() {
                  titles.insert(titles.length, 'Planet');
                });

                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("oi")));
              });
            },
            child: Text("Add"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: titles.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(child: Text(titles[index])),
                            Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    // final snackBar =
                                    // SnackBar(content: Text(titles[index]));
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(snackBar);
                                  },
                                  child: Text("Edit"),
                                )),
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.red)),
                              onPressed: () {
                                setState(() {
                                  titles.removeAt(index);
                                });

                                // final snackBar =
                                // SnackBar(content: Text(titles[index]));
                                // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },
                              child: Text("Delete"),
                            ),
                          ],
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
