import 'package:flutter/material.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
    required GlobalKey<FormState> keyForm,
    required this.userProvider,
    required this.user,
    required this.password,
    required this.viewportWidth,
  })  : _keyForm = keyForm,
        super(key: key);

  final GlobalKey<FormState> _keyForm;
  final UserViewController userProvider;
  final TextEditingController user;
  final TextEditingController password;
  final double viewportWidth;

  @override
  Widget build(BuildContext context) {
    return Form(
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
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 13, 106, 8))),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 89, 11, 2),
                  ),
                ),
                prefixIcon: Icon(Icons.person_rounded,
                    color: Color.fromARGB(255, 0, 0, 0)),
                hintText: 'Username',
                hintStyle:
                    TextStyle(color: Color.fromARGB(255, 223, 220, 220))),
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
                hintStyle:
                    TextStyle(color: Color.fromARGB(255, 223, 220, 220))),
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
                }
              }),
              child: const Text(
                'Join',
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(255, 63, 18, 1),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
