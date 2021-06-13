import 'package:flutter/material.dart';
import 'package:flutter_midterm_2/data/database.dart';

class Login  extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(icon: Icon(Icons.account_box)),
                controller: _textEditingController,
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: TextButton(
                onPressed: (){
                  Database.userID = _textEditingController.text;
                  Navigator.of(context)
                      .pushNamed("/home");
                },
                child: Text("Login")
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
