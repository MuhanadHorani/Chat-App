//import 'package:chat_app/pages/login_page.dart';
//import 'package:chat_app/pages/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';

import '../helper.dart';
import '../wedjets/custem_text_filed.dart';
//import 'home_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      backgroundColor: const Color(0xFF274460),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Form(
          key: formkey,
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
                  onChange: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                CustemTextFiled(
                  hintText: 'Password',
                  onChange: (data) {
                    password = data;
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
                    if (formkey.currentState!.validate()) {
                      try {
                        var auth = FirebaseAuth.instance;
                        await registerUser();
                        user.add({
                          'email': email,
                          'password': password,
                        });
                        showSnackBarMessge(context, "User added successfully");

                        Navigator.popAndPushNamed(context, 'HomePage',
                            arguments: email);
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
                  children: const [
                    Text(
                      "don't have account?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueAccent,
                      ),
                    )
                  ],
                ),
                // CircularProgressIndicator(
                //   color: Colors.lime,
                //   semanticsValue: 'hello',
                // )
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    UserCredential user =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
