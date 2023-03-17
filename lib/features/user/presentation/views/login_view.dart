import 'package:flutter/material.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:puae_app/features/user/presentation/views/dashboard_view.dart';
import 'package:puae_app/features/user/presentation/views/register_view.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final userProvider = ref.read(loginViewProvider);
    final user = TextEditingController();
    final password = TextEditingController();
    final _keyForm = GlobalKey<FormState>();
    String name = '';

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color.fromARGB(255, 223, 220, 220),
      child: Stack(
        children: <Widget>[
          SafeArea(
            bottom: true,
            top: true,
            child: ListView(
              children: [
                Column(
                  children: [
                    const Logo(
                      height: 300,
                      width: 300,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: viewportWidth * 0.9,
                        color: const Color.fromARGB(255, 223, 220, 220),
                        child: Form(
                          key: _keyForm,
                          child: Column(
                            children: [
                              const SizedBox(height: 20),
                              TextFormField(
                                validator: userProvider.validatorUser,
                                controller: user, //todo cambiar nombre
                                onChanged: (String value) {
                                  name = value;
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
                                validator: userProvider.validatorPass,
                                controller: password,
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
                                  onPressed: (() async {
                                    await ref
                                        .read(loginViewProvider)
                                        .getUser(name);
                                    if (_keyForm.currentState!.validate()) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => DashboardView(
                                            user: userProvider.currentUser!.name
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                                  child: const Text(
                                    'Join',
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
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 223, 220, 220),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterView(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
