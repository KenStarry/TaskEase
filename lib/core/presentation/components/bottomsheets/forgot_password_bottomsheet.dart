import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_ease/core/presentation/components/custom_text_field.dart';
import 'package:task_ease/core/util/extensions/string_extensions.dart';

import '../../../../features/auth/presentation/bloc/reset_password_bloc.dart';
import '../../../../features/auth/presentation/bloc/sign_up_bloc.dart';
import '../../../util/theme/colors.dart';
import '../snackbars/show_error_snackbar.dart';
import '../snackbars/show_success_snackbar.dart';

class ForgotPasswordBottomsheet extends StatefulWidget {
  const ForgotPasswordBottomsheet({super.key});

  @override
  State<ForgotPasswordBottomsheet> createState() =>
      _ForgotPasswordBottomsheetState();
}

class _ForgotPasswordBottomsheetState extends State<ForgotPasswordBottomsheet> {
  final TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener: (context, resetState) {
        if (resetState is ResetPasswordSuccess) {
          Navigator.pop(context);
          showSuccessSnackbar(context,
              title: "Success",
              message:
                  "A password reset link has been sent to your email. Please check your email.");
        }

        if (resetState is ResetPasswordFailed) {
          showErrorSnackbar(context,
              title: "Error",
              message: "Something went wrong. Try again later.");
        }
      },
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          "assets/images/icons/close.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                              Theme.of(context).textTheme.bodyMedium!.color!,
                              BlendMode.srcIn),
                        ),
                      )),
                  Text("Forgot Password?",
                      style: Theme.of(context).textTheme.titleSmall),
                  SizedBox(height: 8),
                  Text(
                      "No worries! Enter your email to receive a link to reset your password!",
                      style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 16),
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
                  SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
                      builder: (context, resetState) {
                        return FilledButton(
                            onPressed: resetState is ResetPasswordLoading
                                ? null
                                : () async {
                                    if (formKey.currentState!.validate()) {
                                      context.read<ResetPasswordBloc>().add(
                                          ResetPasswordUserEvent(
                                              email:
                                                  emailController.text.trim()));
                                    }
                                  },
                            style: FilledButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12)),
                            child: resetState is ResetPasswordLoading
                                ? SpinKitFadingCircle(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    size: 30.0,
                                    // duration: Duration(milliseconds: 300),
                                  )
                                : Text("Reset Password",
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
