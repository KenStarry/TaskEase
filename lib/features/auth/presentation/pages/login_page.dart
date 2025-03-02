import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_ease/core/presentation/components/bottomsheets/forgot_password_bottomsheet.dart';
import 'package:task_ease/core/presentation/components/custom_text_field.dart';
import 'package:task_ease/core/presentation/components/snackbars/show_error_snackbar.dart';
import 'package:task_ease/core/util/theme/colors.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  ValueNotifier<bool> passwordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, loginState) {
            if (loginState is LoginFailed) {
              showErrorSnackbar(context,
                  title: "Oh Snap!", message: "Invalid Credentials");
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset("assets/images/undraw/login.svg",
                          width: 250, height: 250)),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text("Login",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontWeight,
                            color:
                                Theme.of(context).textTheme.titleLarge!.color,
                          )),
                      Text("Please Sign In to continue.",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                      controller: emailController,
                      hintText: "Enter Email Address",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      prefixIcon: UnconstrainedBox(
                        child: SvgPicture.asset("assets/images/icons/email.svg",
                            width: 20,
                            height: 20,
                            colorFilter: ColorFilter.mode(
                                Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color!
                                    .withValues(alpha: 0.6),
                                BlendMode.srcIn)),
                      ),
                      filledColor: Theme.of(context).colorScheme.onSecondary),
                  const SizedBox(height: 16),
                  ValueListenableBuilder(
                    valueListenable: passwordVisible,
                    builder:
                        (BuildContext context, bool value, Widget? child) =>
                            CustomTextField(
                                controller: passwordController,
                                hintText: "Enter Password",
                                obscureText: !value,
                                maxLines: 1,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 16.0),
                                prefixIcon: UnconstrainedBox(
                                  child: SvgPicture.asset(
                                      "assets/images/icons/password.svg",
                                      width: 20,
                                      height: 20,
                                      colorFilter: ColorFilter.mode(
                                          Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .color!
                                              .withValues(alpha: 0.6),
                                          BlendMode.srcIn)),
                                ),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      passwordVisible.value = !value;
                                    },
                                    icon: UnconstrainedBox(
                                      child: SvgPicture.asset(
                                          "assets/images/icons/eye${value ? '' : '_off'}.svg",
                                          width: 24,
                                          height: 24,
                                          colorFilter: ColorFilter.mode(
                                              Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .color!
                                                  .withValues(alpha: 0.6),
                                              BlendMode.srcIn)),
                                    )),
                                filledColor:
                                    Theme.of(context).colorScheme.onSecondary),
                  ),
                  // const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet(context: context,
                                isScrollControlled: true,
                                builder: (context) => ForgotPasswordBottomsheet());
                          },
                          style: TextButton.styleFrom(padding: EdgeInsets.zero),
                          child: Text("Forgot password"))
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, loginState) {
                        return FilledButton(
                            onPressed: loginState is LoginLoading
                                ? null
                                : () async {
                                    context.read<LoginBloc>().add(LoginUserEvent(
                                        email: emailController.text,
                                        password: passwordController.text));
                                  },
                            style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12)),
                            child: loginState is LoginLoading
                                ? SpinKitFadingCircle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 30.0,
                                    // duration: Duration(milliseconds: 300),
                                  )
                                : Text("Login",
                                    style: TextStyle(
                                      fontSize: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .fontSize,
                                      fontWeight: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .fontWeight,
                                      color: whiteColor,
                                    )));
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context).textTheme.bodyMedium),
                      TextSpan(
                          text: "Sign Up",
                          style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontWeight,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => context.pushNamed("signup")),
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
