import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/calendar/Calendar.dart';
import 'package:schedule/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(85,85,85, 1),
          elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.0)
              )
          ),
          title: Text('Домашня сторінка', style: TextStyle(color: Color.fromRGBO(229, 229, 229, 1), fontSize: 20.0, ),),
          actions: <Widget>[
            FlatButton.icon(onPressed: () async{
              await _auth.signOut();
            },
                icon: Icon(Icons.person, color: Color.fromRGBO(229, 229, 229, 1)),
                label: Text("Вийти", style: TextStyle(color: Color.fromRGBO(229, 229, 229, 1), fontSize: 20.0)))
          ],
      ),
      body: Calendar(),
    );
  }
}
