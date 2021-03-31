import 'package:flutter/material.dart';
import 'package:admin_crud_flutter/dialog/d_crud_place.dart';

class Localtemp extends StatefulWidget {
  @override
  _LocaltempState createState() => _LocaltempState();
}

class _LocaltempState extends State<Localtemp> {
  List<String> countries = [
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
      appBar: AppBar(title: Text('Localtemp CRUD')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              DialogUtils.showCustomDialog(context, onSubmit: (country) {
                setState(() {
                  countries.insert(countries.length, country);
                });
              });
            },
            child: Text("Add"),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(child: Text(countries[index])),
                            Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    DialogUtils.showCustomDialog(context, name: countries[index],onSubmit: (country) {
                                      setState(() {
                                        countries[index] = country;
                                      });
                                    });
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
                                  countries.removeAt(index);
                                });
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