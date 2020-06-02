import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/screens/authenticate/register.dart';
import 'package:schedule/services/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  //text field state

  String email = '';
  String password = '';
  String error = '';
  FocusNode myFocusNode = new FocusNode();
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(229, 229, 229, 1),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30.0)
          )
        ),
        backgroundColor: Color.fromRGBO(85,85,85, 1),
        elevation: 0.0,
        title: Text('Вхід до системи',
            style: TextStyle(color:
            Color.fromRGBO(229, 229, 229, 1),
                fontSize: 19.0,
                fontWeight: FontWeight.w400)),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
              widget.toggleView();
            },
              icon: Icon(Icons.person, color: Color.fromRGBO(223, 215, 204, 1)),
              label: Text('Реєстрація', style: TextStyle(color: Color.fromRGBO(223, 215, 204, 1), fontSize: 18.0)))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.network("http://www.viti.edu.ua/img/viti.png"),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Дані введено некорректно!' : null,
                decoration: new InputDecoration(
                    hintText: 'Введіть тут...',
                    labelText: 'Е-пошта',
                    labelStyle: TextStyle(
                      color: myFocusNode.hasFocus ? Color.fromRGBO(71, 79, 63, 1) : Color.fromRGBO(111, 109, 97, 1)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(111, 109, 97, 1)), borderRadius: BorderRadius.circular(10.0))

                ),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Пароль має бути не менш ніж 6 символів!' : null,
                decoration: new InputDecoration(
                    hintText: 'Введіть тут...',
                    labelText: 'Пароль',
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus ? Color.fromRGBO(71, 79, 63, 1) : Color.fromRGBO(111, 109, 97, 1)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(111, 109, 97, 1)), borderRadius: BorderRadius.circular(10.0))
                ),
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Color.fromRGBO(71, 79, 63, 1),
                child: Text("Увійти", style: TextStyle(color: Color.fromRGBO(223, 215, 204, 1))),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _authService.signInWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'Invalid password or email';
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
