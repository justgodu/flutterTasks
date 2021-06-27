import 'dart:ui';

import 'package:final_todo/data/database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Login extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('images/todo_logo.png'),
              height: 100,
            ),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xff66C7C7),
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              // margin: EdgeInsets.symmetric(vertical: 0, horizontal: 40),
              // height: ,
              child: TextField(
                style: TextStyle(
                    backgroundColor: Color(0xff66C7C7),
                  fontSize: 20.0
                ),

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20) ,
                  border: UnderlineInputBorder(borderSide: BorderSide.none),
                  hintText: 'Username',
                ),
                controller: _textEditingController,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xff66C7C7),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                  onPressed: () {
                    Database.userID = _textEditingController.text;
                    Navigator.of(context).pushNamedAndRemoveUntil("/home", (route)=>false);
                  },
                  child: Text(
                    "LOGIN",
                    style: new TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
