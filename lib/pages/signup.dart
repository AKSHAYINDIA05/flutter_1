import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application/Services/AuthenticationServices.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/login.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formkey = GlobalKey<FormState>();
  final AuthenticationServices _auth = AuthenticationServices();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 254, 251, 234),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.person_add,
                  size: 100,
                  color: Colors.deepPurple,
                  shadows: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 3,
                      color: Colors.deepPurple.withOpacity(0.5),
                      offset: Offset(3.0, 3.0),
                    ),
                  ],
                ),
              ),
              "Create your Account".text.extraBold.xl4.make(),
              60.heightBox,
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        labelText: "Name",
                        icon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* required field";
                        }
                        return null;
                      },
                    ).pLTRB(12, 12, 12, 12),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: "Phone Number",
                        icon: Icon(Icons.phone_android),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* required field";
                        }
                        return null;
                      },
                    ).pLTRB(12, 12, 12, 12),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "Email ID",
                        icon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* required field";
                        }
                        return null;
                      },
                    ).pLTRB(12, 12, 12, 12),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter your desired password",
                        icon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "* required field";
                        }
                        return null;
                      },
                    ).pLTRB(12, 12, 12, 12),
                    ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            createUser();
                          }
                        },
                        child: "Sign Up"
                            .text
                            .color(Color.fromARGB(255, 254, 251, 234))
                            .bold
                            .make())
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _emailController.text, _passwordController.text);
    if (result == null) {
      print("Email is not valid");
    } else {
      print(result.toString());
    }
  }
}
