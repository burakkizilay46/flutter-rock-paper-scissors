import 'package:flutter/material.dart';

class WinnerPageComputer extends StatefulWidget {
  @override
  _WinnerPageState createState() => _WinnerPageState();
}

class _WinnerPageState extends State<WinnerPageComputer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 250),
          child: Column(
            children: [
              Text(
                'Winner Computer',
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