import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';

class RegisterView extends HookConsumerWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final viewportHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: const Color.fromARGB(255, 223, 220, 220),
          child: SafeArea(
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(
                              top: viewportHeight * 0.02,
                              left: viewportWidth * 0.05),
                          child: const Logo(
                            height: 50,
                            width: 50,
                          ),
                        ),
                        Container(
                          width: viewportWidth * 0.8,
                          padding: EdgeInsets.only(
                              top: viewportHeight * 0.02,
                              left: viewportWidth * 0.05),
                          child: const Center(
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontFamily: 'Lato',
                                fontSize: 58,
                                color: Color.fromRGBO(255, 63, 18, 1),
                              ), // 4, 178, 217, 1
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: viewportWidth * 0.9,
                        color: const Color.fromARGB(255, 223, 220, 220),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(height: 120),
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Username',
                                    labelStyle: TextStyle(color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color.fromARGB(
                                                255, 13, 106, 8))),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 89, 11, 2),
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.person_rounded,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    hintText: 'Username',
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 223, 220, 220))),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 13, 106, 8),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 89, 11, 2),
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.email_rounded,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    hintText: 'Email',
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 223, 220, 220))),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 13, 106, 8),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 89, 11, 2),
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password_rounded,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 223, 220, 220))),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: TextStyle(color: Colors.black),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 13, 106, 8),
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color.fromARGB(255, 89, 11, 2),
                                      ),
                                    ),
                                    prefixIcon: Icon(Icons.password_rounded,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                    hintText: 'Password',
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(
                                            255, 223, 220, 220))),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: viewportWidth * 0.9,
                                child: ElevatedButton(
                                  onPressed: (() {}),
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color.fromRGBO(255, 63, 18, 1),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
