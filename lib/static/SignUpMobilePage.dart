import 'package:flutter/material.dart';
import 'package:recipie_saver_flutter/logic/AuthLogic.dart';

import 'ColorConfig.dart';

class SignUpMobilePage extends StatefulWidget {
  const SignUpMobilePage({super.key});

  @override
  State<SignUpMobilePage> createState() => _SignUpMobilePageState();
}

class _SignUpMobilePageState extends State<SignUpMobilePage> {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    const double basicGap = 50.0;
    final formKey = GlobalKey<FormState>();

    AuthLogic auth = AuthLogic();

    // void SignIn() async {
    //   await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: emailController.text, password: passwordController.text);
    // }

    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(65), topRight: Radius.circular(65)),
        child: Container(
          width: width,
          color: AppColors.mainColor,
          child: Center(
              child: SizedBox(
            width: 300,
            child: Form(
                key: formKey,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          bottom: basicGap, top: basicGap * 1.5),
                      child: Text(
                        "Create an Account",
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            label: Text("Email")),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: basicGap / 2),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 30),
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            label: Text("Password")),
                      ),
                    ),
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              auth.signUpNewUser(
                                  emailController, passwordController);
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColors.secondaryColor),
                            ),
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(color: AppColors.black),
                            ),
                          ),
                        )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: basicGap),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 12,
                                  color: AppColors.black),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "LOG IN",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                    color: AppColors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                  ],
                )),
          )),
        ));
  }
}
