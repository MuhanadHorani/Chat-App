//import 'package:chat_app/pages/home_page.dart';
//import 'package:chat_app/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper.dart';
import '../wedjets/custem_text_filed.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = GlobalKey();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF274460),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: loginKey,
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
                CustemTextFiled(
                  hintText: 'Email',
                  onChange: (value) {
                    email = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustemTextFiled(
                  hintText: 'Password',
                  obscure: true,
                  onChange: (value) {
                    password = value;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () async {
                    if (loginKey.currentState!.validate()) {
                      try {
                        var auth = FirebaseAuth.instance;
                        await signInUser();
                        showSnackBarMessge(
                            context, "User Logedin successfully");
                        Navigator.popAndPushNamed(
                          context,
                          'HomePage',
                          arguments: email,
                        );
                      } on FirebaseAuthException catch (ex) {
                        if (ex.code == 'weake-password') {
                          showSnackBarMessge(context,
                              "Weak Password please select Strong Password !");
                        } else {
                          if (ex.code == 'email-already-in-use') {
                            showSnackBarMessge(
                                context, "This Email alrady in use");
                          } else {
                            showSnackBarMessge(context,
                                "Something went wrong please try agin!");
                          }
                        }
                      } catch (ex) {
                        showSnackBarMessge(context, "There was error!!");
                      }
                    } else {}
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
      ),
    );
  }

  Future<void> signInUser() async {
    UserCredential user =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
