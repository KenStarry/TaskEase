import 'package:flutter/material.dart';
import 'package:task_ease/core/presentation/components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 24,
          children: [
            CustomTextField(controller: usernameController, hintText: "Username"),
            CustomTextField(controller: passwordController, hintText: "Password"),
            FilledButton(onPressed: (){}, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
