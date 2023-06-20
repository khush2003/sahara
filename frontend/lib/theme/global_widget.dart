import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sahara/theme/app_theme.dart';

class NumberTextFormFieldThemed extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const NumberTextFormFieldThemed(
      {super.key,
      required this.hintText,
      this.controller,
      this.obscureText,
      this.autocorrect,
      this.enableSuggestions,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.errorText,
      this.suffixIcon,
      this.keyboardType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      key: key,
      autocorrect: autocorrect ?? true,
      enableSuggestions: enableSuggestions ?? true,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          errorText: errorText,
          hintText: hintText,
          hintStyle: textFromFieldInput(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary))),
      obscureText: obscureText ?? false,
      validator: validator,
      onSaved: onSaved,
      maxLines: 1,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}

class TextFormFieldThemed extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const TextFormFieldThemed(
      {super.key,
      required this.hintText,
      this.controller,
      this.obscureText,
      this.autocorrect,
      this.enableSuggestions,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.errorText,
      this.suffixIcon,
      this.keyboardType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      key: key,
      autocorrect: autocorrect ?? true,
      enableSuggestions: enableSuggestions ?? true,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          errorText: errorText,
          hintText: hintText,
          hintStyle: textFromFieldInput(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.black)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary))),
      obscureText: obscureText ?? false,
      validator: validator,
      onSaved: onSaved,
      maxLines: 1,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}

class AreaTextFormFieldThemed extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<String>? onChanged;
  final String? errorText;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const AreaTextFormFieldThemed(
      {super.key,
      required this.hintText,
      this.controller,
      this.obscureText,
      this.autocorrect,
      this.enableSuggestions,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.errorText,
      this.suffixIcon,
      this.keyboardType,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      key: key,
      autocorrect: autocorrect ?? true,
      enableSuggestions: enableSuggestions ?? true,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8.0),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: suffixIcon,
          errorText: errorText,
          hintText: hintText,
          hintStyle: textFromFieldInput(),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.primary))),
      obscureText: obscureText ?? false,
      validator: validator,
      onSaved: onSaved,
      minLines: 1,
      maxLines: 4,
      onChanged: onChanged,
      style: Theme.of(context).textTheme.displayLarge,
    );
  }
}
