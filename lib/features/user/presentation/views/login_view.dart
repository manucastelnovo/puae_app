import 'package:flutter/material.dart';

import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/delivery/presentation/views/delivery_map.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:puae_app/features/user/presentation/views/register_view.dart';
import 'package:puae_app/utils/dio.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewportWidth = MediaQuery.of(context).size.width;
    final userProvider = ref.watch(userViewProvider);
    final user = TextEditingController();
    final password = TextEditingController();
    final _keyForm = GlobalKey<FormState>();

    useEffect(() {
      ref.read(userViewProvider).getUser();
      print('putoooooooooooooooooo${userProvider.currentUser}');
      return;
    }, []);

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
                                controller: user,
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
                              Container(
                                width: viewportWidth * 0.9,
                                child: ElevatedButton(
                                  onPressed: (() {
                                    if (_keyForm.currentState!.validate()) {
                                      print('aprete join');
                                      print(
                                          userProvider.currentUser.toString());
                                      print('sdfsdfs');
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
                                      builder: (context) =>
                                          const RegisterView(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign in',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      decoration: TextDecoration.underline),
                                ),
                              ),
                              ElevatedButton(
                                  onPressed: () async {
                                    Navigator.push<void>(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (BuildContext context) =>
                                            DeliveryMapView(),
                                      ),
                                    );
                                  },
                                  child: const Text('Map'))
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
