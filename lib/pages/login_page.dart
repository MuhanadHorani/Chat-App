import 'package:chat_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../wedjets/custem_text_filed.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF274460),
      appBar: AppBar(
        backgroundColor: const Color(0xFF274460),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(children: [
          Column(
            children: [
              Image.asset('assets/images/scholar.png'),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Scholar Chat",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Pacifico',
                  //fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                "Signin",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              CustemTextFiled(hintText: 'Email'),
              const SizedBox(
                height: 16,
              ),
              CustemTextFiled(
                hintText: 'Password',
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(42),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage();
                      },
                    ),
                  );
                },
                child: const Text(
                  "Signin",
                  style: TextStyle(
                    color: Color(0xFF274460),
                  ),
                ),
              ),
              Row(
                children: const [
                  Text(
                    "don't have account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Signup",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
