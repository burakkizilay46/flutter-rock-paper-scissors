import 'package:flutter/material.dart';

class WinnerPageGamer extends StatefulWidget {
  @override
  _WinnerPageGamerState createState() => _WinnerPageGamerState();
}

class _WinnerPageGamerState extends State<WinnerPageGamer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 250),
          child: Column(
            children: [
              Text(
                'Winner Gamer',
                style: TextStyle(
                  fontSize: 50,
                ),
              ),
              SizedBox(
                height: 200,
              ),
              RaisedButton(
                  child: Text("Return Home Page"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      ),
    );
  }
}