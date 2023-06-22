import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/static/ColorConfig.dart';

import '../logic/AuthLogic.dart';

class LoginDesktopPage extends StatefulWidget {
  const LoginDesktopPage({super.key});

  @override
  State<LoginDesktopPage> createState() => _LoginDesktopPageState();
}

class _LoginDesktopPageState extends State<LoginDesktopPage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    AuthLogic auth = AuthLogic();

    return Center(
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                width: 500,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 50.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Welcome!",
                        style: TextStyle(fontSize: 50),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: SizedBox(
                  width: 500,
                  child: TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        label: Text("Email")),
                  ),
                ),
              ),
              SizedBox(
                width: 500,
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      label: Text("Password")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: SizedBox(
                  width: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 225,
                          height: 40,
                          child: ElevatedButton(
                              style: const ButtonStyle(
                                  shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.black)),
                              onPressed: () {
                                auth.signInUser(
                                    emailController, passwordController);
                              },
                              child: const Text(
                                "Login",
                                style: TextStyle(color: AppColors.mainColor),
                              ))),
                      const SizedBox(width: 50),
                      const SizedBox(
                          width: 225,
                          height: 40,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)))),
                                  backgroundColor: MaterialStatePropertyAll(
                                      AppColors.secondaryColor)),
                              onPressed: null,
                              child: Text(
                                "Sign up",
                                style: TextStyle(color: Colors.black),
                              ))),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 500,
                child: Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextButton(
                        onPressed: null,
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(fontStyle: FontStyle.italic),
                        )),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
