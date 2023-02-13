import 'package:chat_app/pages/home_page.dart';
import 'package:chat_app/pages/register_page.dart';
import 'package:flutter/material.dart';

import '../wedjets/custem_text_filed.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF274460),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/scholar.png'),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Scholar Chat",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Pacifico',
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Signin",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              const CustemTextFiled(hintText: 'Email'),
              const SizedBox(
                height: 16,
              ),
              const CustemTextFiled(
                hintText: 'Password',
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, 'HomePage');
                },
                child: const Text(
                  "Signin",
                  style: TextStyle(
                    color: Color(0xFF274460),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "don't have account?",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'RegisterPage');
                    },
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
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
