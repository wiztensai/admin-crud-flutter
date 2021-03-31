import 'package:admin_crud_flutter/model/model_country.dart';
import 'package:flutter/material.dart';
import 'package:admin_crud_flutter/dialog/d_crud_place.dart';
import 'dart:async';

import 'package:admin_crud_flutter/helper/helper_db_country.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:admin_crud_flutter/cst.dart';

class SqfliteCrud extends StatefulWidget {
  @override
  _SqfliteCrudState createState() => _SqfliteCrudState();
}

class _SqfliteCrudState extends State<SqfliteCrud> {

  DbHelperCountry dbHelper = DbHelperCountry();
  bool isFirstInit = false;
  List<Country> countries = [];

  void getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isFirstInit = preferences.getBool(CST.IS_FIRST_INIT_B);

    if(isFirstInit == false || isFirstInit == null) {
      for(int i = 0; i<initCountry.length;i++) {
        dbHelper.insertWithId(initCountry[i]);
      }

      preferences.setBool(CST.IS_FIRST_INIT_B, true);
      updateListView();
    } else {
      updateListView();
    }
  }

  @override
  void initState() {
    super.initState();

    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQFlite CRUD')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              DialogUtils.showCustomDialog(context, onSubmit: (country) {
                setState(() {
                  dbHelper.insert({"name":country});
                  updateListView();
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
                            Expanded(child: Text(countries[index].name)),
                            Padding(
                                padding: EdgeInsets.only(right: 8),
                                child: ElevatedButton(
                                  onPressed: () {
                                    DialogUtils.showCustomDialog(context, name: countries[index].name,onSubmit: (country) {
                                      setState(() {
                                        dbHelper.update(Country(countries[index].id, country));
                                        updateListView();
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
                                  dbHelper.delete(countries[index].id);
                                  updateListView();
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

  void addContact(Country country) async {
    int result = await dbHelper.insertWithId(country);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Country>> contactListFuture = dbHelper.getCountry();
      contactListFuture.then((contactList) {
        setState(() {
          this.countries = contactList;
        });
      });
    });
  }

}

List<Country> initCountry = [
  Country(0,'venezuela'),
  Country(1,'madagascar')
];