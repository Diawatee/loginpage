import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key key, this.title}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          children: [
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                  print(username);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box),
                  labelText: 'Username',
                  hintText: 'Enter Username',
                  filled: true,
                  fillColor: Colors.grey[300],
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue[300],
                  )),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              width: 250,
              padding: EdgeInsets.all(16),
            ),
            
            Container(
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                  print(password);
                },
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                  filled: true,
                  fillColor: Colors.grey[300],
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.blue[300],
                  )),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ),
              width: 250,
              padding: EdgeInsets.all(16),
            ),
            RaisedButton(
              onPressed: () {
                validateTextField(context);
              },
              child: Text('Submit'),
              color: Colors.blue[700],
              textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }

  void validateTextField(BuildContext context) {
    print(username);
    print(password);
    if (username == null ||
        username.trim().isEmpty ||
        password == null ||
        password.trim().isEmpty) {
      AlertDialog alert = AlertDialog(
        title: Text('Alert Dialog'),
        content: Container(child: Text('Please Fill the empty textbox.')),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      );
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }
}
