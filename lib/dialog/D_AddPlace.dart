import 'package:flutter/material.dart';

class DialogUtils {
  static void showCustomDialog(BuildContext context,
      {@required Function onSubmit}) {
    final _formKey = GlobalKey<FormState>();

    String country = "";

    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: Form(
              key: _formKey,
              child: Container(
                padding: EdgeInsets.all(16),
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                  Column(children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text("Add Place"),
                    ),
                    TextFormField(
                        decoration: InputDecoration(
                          hintText: "Isi nama tempat disini",
                          labelText: "Nama Tempat",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }

                          country = value;
                        }),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel"))),
                      ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              onSubmit(country);
                              Navigator.pop(context);
                            }
                          },
                          child: Text("Submit"))
                    ]),
                  ])
                ]),
              ),
            ),
          );
        });
  }
}
