import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/services/auth.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 215, 204, 1),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(71, 79, 63, 1),
          elevation: 0.0,
          title: Text('Home', style: TextStyle(color: Color.fromRGBO(223, 215, 204, 1), fontSize: 20.0),),
          textTheme: GoogleFonts.montserratTextTheme(),
          actions: <Widget>[
            FlatButton.icon(onPressed: () async{
              await _auth.signOut();
            },
                icon: Icon(Icons.person, color: Color.fromRGBO(223, 215, 204, 1)),
                label: Text("Log out", style: TextStyle(color: Color.fromRGBO(223, 215, 204, 1), fontSize: 20.0)))
          ],
      )
    );
  }
}
