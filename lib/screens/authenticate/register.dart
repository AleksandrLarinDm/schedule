import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:schedule/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String email = '';
  String password = '';
  String group = '';
  String error = '';
  FocusNode myFocusNode = new FocusNode();
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(223, 215, 204, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(71, 79, 63, 1),
        elevation: 0.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30.0)
              )
          ),
        title: Text('Реєстрація',
            style: TextStyle(color: Color.fromRGBO(223, 215, 204, 1),
                fontSize: 19.0,
                fontWeight: FontWeight.w400)),
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleView();
          },
              icon: Icon(Icons.person, color: Color.fromRGBO(223, 215, 204, 1)),
              label: Text('Увійти', style: TextStyle(color: Color.fromRGBO(223, 215, 204, 1), fontSize: 18.0)))
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Center(
                child: Image.network("http://www.viti.edu.ua/img/viti.png"),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Дані введені некорректно!' : null,
                decoration: new InputDecoration(
                    hintText: 'Введіть тут...',
                    labelText: 'E-пошта',
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
              TextFormField(
                keyboardType: TextInputType.numberWithOptions(),
                validator: (val) => val.length > 3 ? 'Номер групи складається з трьох цифр!' : null,
                decoration: new InputDecoration(
                    hintText: 'Введіть тут...',
                    labelText: 'Номер групи',
                    labelStyle: TextStyle(
                        color: myFocusNode.hasFocus ? Color.fromRGBO(71, 79, 63, 1) : Color.fromRGBO(111, 109, 97, 1)
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(2.0)),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(111, 109, 97, 1)), borderRadius: BorderRadius.circular(10.0))
                ),
                onChanged: (val){
                  setState(() {
                    group = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Color.fromRGBO(71, 79, 63, 1),
                child: Text("Зареєструватись", style: TextStyle(color: Color.fromRGBO(223, 215, 204, 1), fontSize: 18.0)),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    dynamic result = await _authService.registerWithEmailAndPassword(email, password);
                    if(result == null){
                      setState(() {
                        error = 'SERVER_ERROR_0x00312';
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
