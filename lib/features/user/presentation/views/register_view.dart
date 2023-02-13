import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/user/domain/models/user.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';
import 'package:puae_app/features/user/presentation/controllers/register_controller.dart';
import 'package:puae_app/features/user/presentation/views/dashboard_view.dart';

Dio dio = Dio();

class RegisterView extends HookConsumerWidget {
  RegisterView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userProvider = ref.watch(loginViewProvider);
    final viewportWidth = MediaQuery.of(context).size.width;
    final viewportHeight = MediaQuery.of(context).size.height;
    final registerController = ref.watch(registerProvider);
    String? userName;
    String? userPassword;
    String? userEmail;

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
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const SizedBox(height: 120),
                              TextFormField(
                                validator: registerController.validatorUser,
                                onSaved: (newValue) {
                                  userName = newValue;
                                },
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
                                validator: registerController.validatorEmail,
                                onSaved: (newValue) {
                                  userEmail = newValue;
                                },
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
                                validator: registerController.validatorPass,
                                onSaved: (newValue) {
                                  userPassword = newValue;
                                },
                                obscureText: true,
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
                                validator: registerController.validatorPass,
                                obscureText: true,
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
                              SizedBox(
                                width: viewportWidth * 0.9,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    print('estoy afu');
                                    // if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    print('entre');
                                    try {
                                      final newUser = User(
                                          name: userName!,
                                          email: userEmail!,
                                          password: userPassword!);

                                      final response = await dio.post(
                                          "https://fc84-2803-2a00-9-b97f-b176-e933-afd2-df78.sa.ngrok.io/api/users/",
                                          data: newUser.toJson());

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DashboardView(
                                            user: userProvider.currentUser!.name
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    } on DioError catch (e) {
                                      print(e);
                                    } catch (e) {
                                      print(e);
                                    }
                                  },
                                  // },
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
