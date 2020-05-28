import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:schedule/models/user.dart';
import 'package:schedule/screens/authenticate/authenticate.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    //return either Home or Auth widget
    if (user == null){
      return Authenticate();
    }
    else
      return Home();
  }
}
