import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final TextInputAction? inputAction;
  final Color? filledColor;
  final Color? textColor;

  final double? fontSize;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final double? hintFontSize;
  final Color? borderColor;
  final bool? readOnly;
  final bool? autoFocus;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;

  final bool? obscureText;
  final EdgeInsets? contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? fieldFormatters;
  final bool? enableCopy;

  const CustomTextField(
      {super.key,
      required this.controller,
        this.autoFocus,
      this.keyboardType,
      this.inputAction,
      this.filledColor,
      this.fontSize,
        this.hintStyle,
        this.textStyle,
      required this.hintText,
      this.hintFontSize,
      this.borderColor,
      this.readOnly,
      this.onTap,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.minLines,
      this.prefix,
      this.validator,
      this.onChanged,
        this.onFieldSubmitted,
      this.obscureText,
      this.textColor,
      this.contentPadding,
      this.fieldFormatters,
      this.enableCopy});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      onTap: onTap,
      autofocus: autoFocus ?? false,
      onChanged: onChanged,
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      textInputAction: inputAction ?? TextInputAction.done,
      cursorColor: theme.colorScheme.tertiary.withOpacity(0.6),
      onFieldSubmitted: onFieldSubmitted,
      minLines: minLines,
      maxLines: maxLines,
      style: textStyle ?? TextStyle(
        fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
        fontWeight:
        Theme.of(context).textTheme.bodyMedium!.fontWeight,
        color: Theme.of(context).textTheme.bodyMedium!.color,
      ),
      decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
            child: prefixIcon,
          )
              : null,
          suffixIcon: suffixIcon != null
              ? Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8.0, top: 2.0, bottom: 2.0),
            child: suffixIcon,
          )
              : null,
          filled: true,
          fillColor: filledColor ?? Colors.transparent,
          hintText: hintText,
          errorMaxLines: null,
          errorStyle: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
            fontWeight: Theme.of(context).textTheme.bodyLarge!.fontWeight,
            color: Colors.red,
          ),
          hintStyle: hintStyle ?? TextStyle(
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            fontWeight:
            Theme.of(context).textTheme.bodyMedium!.fontWeight,
            color: Theme.of(context).textTheme.bodyMedium!.color!.withValues(alpha: 0.5),
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: borderColor ??
                      Colors.transparent,
                  width: 1)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: borderColor ??
                      Colors.transparent,
                  width: 1)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                  color: borderColor ??
                      Colors.transparent,
                  width: 1)),
          prefix: prefix,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      inputFormatters: fieldFormatters,
      enableInteractiveSelection: enableCopy,
    );
  }
}
