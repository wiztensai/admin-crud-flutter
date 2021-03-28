import 'package:flutter/material.dart';

class DialogUtils {
  static void showCustomDialog(BuildContext context, {@required Function callbacktest}) {
    showDialog(context: context, builder: (_) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Container(
          // height: 300.0,
          // width: 300.0,
          padding: EdgeInsets.all(16),
          child: Column(children: <Widget>[
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

                    // totalKeuntungan = int.parse(value);
                  },
                  keyboardType: TextInputType.number),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: ElevatedButton(onPressed: () {}, child: Text("Cancel"))),
                ElevatedButton(
                    onPressed: () {
                      callbacktest();
                    },
                    child: Text("Submit"))
              ]),
            ])
          ]),
        ),
      );
    });
  }
}
