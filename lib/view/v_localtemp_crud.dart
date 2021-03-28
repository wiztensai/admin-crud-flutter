import 'package:flutter/material.dart';
import 'package:admin_crud_flutter/dialog/D_AddPlace.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titles = [
    'indonesia',
    'bali',
    'eropa',
    'india',
    'malaysia',
    'philipina',
    'myanmar',
    'thailand',
    'jepang'
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
              DialogUtils.showCustomDialog(context, onSubmit: (country) {
                setState(() {
                  titles.insert(titles.length, country);
                });
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