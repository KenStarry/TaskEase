import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:task_ease/core/util/theme/colors.dart';

void showSuccessSnackbar(BuildContext context,
    {required String title, required String message}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        titleTextStyle: TextStyle(
          fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
          fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight,
          color: whiteColor,
        ),
        contentType: ContentType.success,
      ),
    ));
}
