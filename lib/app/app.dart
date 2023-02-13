import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        'LoginPage': (context) => const LoginPage(),
        'HomePage': (context) => const HomePage(),
        'RegisterPage': (context) => const RegisterPage(),
      },
      initialRoute: 'LoginPage',
      //home: const LoginPage(),
    );
  }
}
