import 'package:flutter/material.dart';
import 'package:flutter_riverpod/src/change_notifier_provider.dart';
import 'package:puae_app/core/widgets/logo.dart';
import 'package:puae_app/features/user/presentation/controllers/login_view_controller.dart';
import 'widgets/login_form.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
      return;
    }, []);

    return Container(
      width: double.infinity,
      height: double.infinity,
      // color: Color.fromARGB(255, 89, 11, 2),
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
                        child: LoginForm(
                            keyForm: _keyForm,
                            userProvider: userProvider,
                            user: user,
                            password: password,
                            viewportWidth: viewportWidth),
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
