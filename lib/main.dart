import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocks/provider.dart';
import 'package:formvalidation/src/page/home_page.dart';
import 'package:formvalidation/src/page/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(

      child:     MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'formulario',
        initialRoute: 'login',

        routes: {
          'login': (BuildContext context) => LoginPage(),
          'home': (BuildContext context) => HomePage()
        },

      ),
    );



  }
}
//