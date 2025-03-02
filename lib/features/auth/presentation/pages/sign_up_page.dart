import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:task_ease/core/presentation/components/custom_text_field.dart';
import 'package:task_ease/core/presentation/components/snackbars/show_error_snackbar.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';
import 'package:task_ease/core/util/theme/colors.dart';
import 'package:task_ease/features/auth/data/repository/auth_repository_impl.dart';
import 'package:task_ease/features/auth/domain/model/user_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../bloc/login_bloc.dart';
import '../bloc/sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  ValueNotifier<bool> newPasswordVisible = ValueNotifier(false);
  ValueNotifier<bool> confirmPasswordVisible = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, signUpState) {
            if (signUpState is SignUpFailed) {
              showErrorSnackbar(context,
                  title: "Oh Snap!", message: "Something went wron");
            }
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                  parent: BouncingScrollPhysics()),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                            "assets/images/undraw/signup.svg",
                            width: 220,
                            height: 220)),
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      spacing: 8,
                      children: [
                        Text("Register",
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .fontWeight,
                              color:
                                  Theme.of(context).textTheme.titleLarge!.color,
                            )),
                        Text("Glad to have you here",
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      controller: usernameController,
                      hintText: "Username",
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 16.0),
                      prefixIcon: UnconstrainedBox(
                        child: SvgPicture.asset("assets/images/icons/user.svg",
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
                      filledColor: Theme.of(context).colorScheme.onSecondary,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Username is required";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      controller: emailController,
                      hintText: "Email Address",
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
                      filledColor: Theme.of(context).colorScheme.onSecondary,
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Email is required";
                        }

                        if (value != null && !value.isValidEmail) {
                          return "Invalid email address";
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder(
                      valueListenable: newPasswordVisible,
                      builder: (BuildContext context, bool value,
                              Widget? child) =>
                          CustomTextField(
                              controller: newPasswordController,
                              hintText: "New Password",
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
                                    newPasswordVisible.value = !value;
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
                                  Theme.of(context).colorScheme.onSecondary,
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Password is required";
                                }

                                if (value != null && !value.isValidPassword) {
                                  return "Invalid password\n- At least 8 characters\n- At least 1 uppercase letter\n- At least 1 lowercase letter\n- At least 1 number\n- At least 1 special character";
                                }

                                return null;
                              }),
                    ),
                    const SizedBox(height: 16),
                    ValueListenableBuilder(
                      valueListenable: confirmPasswordVisible,
                      builder:
                          (BuildContext context, bool value, Widget? child) =>
                              CustomTextField(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
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
                              confirmPasswordVisible.value = !value;
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
                        filledColor: Theme.of(context).colorScheme.onSecondary,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Password is required";
                          }

                          if (value != null &&
                              value != newPasswordController.text) {
                            return "Passwords don't match";
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: BlocBuilder<SignUpBloc, SignUpState>(
                        builder: (context, signUpState) {
                          return FilledButton(
                              onPressed: signUpState is SignUpLoading
                                  ? null
                                  : () async {
                                      if (formKey.currentState!.validate()) {
                                        final user = UserModel(
                                          userName: usernameController.text,
                                          userEmail: emailController.text,
                                          userAvatar: null,
                                        );

                                        context.read<SignUpBloc>().add(
                                            SignUpUserEvent(
                                                userModel: user,
                                                password: newPasswordController
                                                    .text));
                                      }
                                    },
                              style: FilledButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12)),
                              child: signUpState is SignUpLoading
                                  ? SpinKitFadingCircle(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      size: 30.0,
                                      // duration: Duration(milliseconds: 300),
                                    )
                                  : Text("Sign Up",
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
                            text: "Already have an account? ",
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextSpan(
                            text: "Sign In",
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
                              ..onTap = () => context.pop()),
                      ])),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
