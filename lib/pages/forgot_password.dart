import 'package:flutter/material.dart';
import 'package:flutter_application/pages/home.dart';
import 'package:flutter_application/pages/login.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 251, 234),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Forgot".text.bold.xl6.color(Colors.deepPurple).make(),
                    "Password ?".text.bold.xl6.color(Colors.deepPurple).make(),
                    50.heightBox,
                    "Enter the email associated with your account"
                        .text
                        .xl2
                        .make(),
                    Form(
                      key: _formkey,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            labelText: "Email ID", icon: Icon(Icons.email)),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This field cannot be empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    20.heightBox,
                    "We'll send you an authentication mail to your mail ID"
                        .text
                        .textStyle(context.captionStyle)
                        .make(),
                    60.heightBox,
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => false);
                      },
                      child: "Submit"
                          .text
                          .bold
                          .color(Color.fromARGB(255, 254, 251, 234))
                          .make(),
                    ).centered()
                  ],
                ).p12(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
