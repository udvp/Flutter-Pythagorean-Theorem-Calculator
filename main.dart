import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

//https://github.com/udvp
var _a = new TextEditingController();
var _b = new TextEditingController();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pythagorean Theorem"),
        backgroundColor: Color.lerp(Colors.blue, Colors.black, .8),
      ),
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
        padding: const EdgeInsets.all(25.0),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomRight,
                colors: [Colors.redAccent, Colors.yellowAccent])),
        child: (Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            CupertinoTextField(
              keyboardType: TextInputType.number,
              controller: _a,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
              placeholder: "Side a",
              placeholderStyle: (TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoTextField(
              keyboardType: TextInputType.number,
              controller: _b,
              padding: EdgeInsets.all(22),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25),
              placeholder: "Side b",
              placeholderStyle: (TextStyle(
                color: Colors.black,
              )),
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: Text("Calculate"),
              color: Colors.black,
              //textColor: Colors.white,
              onPressed: () {
                //Calculate
                var a = double.parse(_a.text) * double.parse(_a.text);
                var b = double.parse(_b.text) * double.parse(_b.text);
                var c = pow(a + b, 0.5);
                var alert = new CupertinoAlertDialog(
                  title: Text(
                    "Result:",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  content: Text(c.toString(),
                      style: TextStyle(color: Colors.black87, fontSize: 15)),
                  actions: <Widget>[
                    CupertinoDialogAction(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                );
                showDialog(
                    context: context, builder: (BuildContext context) => alert);
              },
            ),
          ],
        )),
      )),
    );
  }
}
