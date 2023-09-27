import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginDemoMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                backgroundImage: AssetImage('assets/images/Amir.jpg'),
              ),
              Text(
                'Amir.H Yz',
                style: TextStyle(
                    fontFamily: "Lobster",
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: "SourceSansPro",
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[100],
                  letterSpacing: 2.5,
                ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  thickness: 1,
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 20,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: new ListTile(
                  leading: Icon(
                    Icons.phone,
                    size: 40,
                    color: Colors.teal[800],
                  ),
                  title: Text(
                    ' +98 913 123 4567',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal[700],
                        fontFamily: 'SourceSansPro'),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                elevation: 20,
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: ListTile(
                  leading: Icon(
                    Icons.email_rounded,
                    size: 40,
                    color: Colors.teal[800],
                  ),
                  title: Text(
                    ' Amir.lk1234@gmail.com',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.teal[700],
                        fontFamily: 'SourceSansPro'),
                  ),
                ),
              ),
            ],
          ), // can use challenge or myTest as child
        ),
      ),
    );
  }
}
