import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/pages/forgot_password.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/signup.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  final _formkey = GlobalKey<FormState>();
  bool changeButton = false;

  moveToHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(
        Duration(milliseconds: 2000),
      );
      await Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 234),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Icon(
                  Icons.login,
                  size: 100,
                  color: Colors.deepPurple,
                ),
              ),
              30.heightBox,
              changeButton
                  ? "Welcome ${name}".text.xl4.bold.make()
                  : "Welcome".text.bold.xl4.make(),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Username",
                        icon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                    ).p24(),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        icon: Icon(Icons.lock),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        }
                        return null;
                      },
                    ).p24(),
                    30.heightBox,
                    Material(
                      color: Colors.deepPurple,
                      borderRadius: changeButton
                          ? BorderRadius.circular(50)
                          : BorderRadius.circular(5),
                      child: InkWell(
                        onTap: () => moveToHome(context),
                        child: AnimatedContainer(
                          // decoration: BoxDecoration(
                          //     color: Colors.deepPurple,
                          //     borderRadius: BorderRadius.circular(5)),
                          duration: Duration(milliseconds: 500),
                          height: 50,
                          width: changeButton ? 45 : 90,
                          child: changeButton
                              ? const Center(
                                  child: Icon(
                                  Icons.done,
                                  color: Color.fromARGB(255, 254, 251, 234),
                                ))
                              : Center(
                                  child: "Login"
                                      .text
                                      .color(const Color.fromARGB(
                                          255, 254, 251, 234))
                                      .bold
                                      .xl2
                                      .make()),
                        ),
                      ),
                    ),
                    30.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => ForgotPassword()),
                                (route) => false);
                          },
                          child: "Forgot Password?".text.make(),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(_createRoute());
                            },
                            child: "Sign Up"
                                .text
                                .color(Color.fromARGB(255, 254, 251, 234))
                                .bold
                                .make())
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SignUpPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0, 1);
      var end = Offset.zero;
      var curve = Curves.bounceIn;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
