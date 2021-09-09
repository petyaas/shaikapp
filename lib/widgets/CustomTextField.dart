import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../style.dart';
class CustomTextField extends StatelessWidget {
  final String hint;
  final String? helperText;
  final TextEditingController? controller;
  final bool obscure;
  final bool autoFocus;
  final Widget? actionWidget;
  final Widget? prefixWidget;
  final bool enabled;
  final TextCapitalization textCapitalization;
  final Function(String)? onchange;
  final String? errortext;
  final TextInputType keybord;
  final List<TextInputFormatter>? fomratter;
  CustomTextField(
      {
        this.hint='',
        this.controller,
        this.obscure = false,
        this.autoFocus=false,
        this.enabled=true,
        this.actionWidget,
        this.prefixWidget,
        this.helperText,
        this.textCapitalization = TextCapitalization.sentences,
        this.onchange,
        this.errortext,
        this.keybord=TextInputType.name,
        this.fomratter,
      });


  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: enabled,

      autofocus: autoFocus,
      style: AppColor.headlinebluegray,
      textCapitalization: textCapitalization,
      controller: controller,
      obscureText: obscure,
      textAlign: TextAlign.start,
      keyboardType: keybord,
      inputFormatters: fomratter,

      decoration: InputDecoration(
        errorText: errortext,
        errorMaxLines: 3,
        prefixIcon: prefixWidget ?? null,
        suffixIcon: actionWidget ?? null,
        labelText: hint,
        labelStyle: TextStyle(color: AppColor.greyblue),
        helperStyle: TextStyle(color:AppColor.greyblue),
        alignLabelWithHint: true,
        helperText: helperText,
//        hintText: hint,
      focusedBorder:OutlineInputBorder(
        borderRadius:  const BorderRadius.all(
          const Radius.circular(11.0),

        ),
        borderSide:BorderSide(color: AppColor.greyblue, width: 1.0,
        ),
      ) ,
        // border: OutlineInputBorder(
        //   borderSide: BorderSide(color: Colors.red, width: 5.0),
        //
        enabledBorder: OutlineInputBorder(
          borderRadius:  const BorderRadius.all(
            const Radius.circular(11.0),
          ),
          borderSide: BorderSide(color: AppColor.dark),
        ),
        disabledBorder:OutlineInputBorder(
          borderRadius:  const BorderRadius.all(
            const Radius.circular(11.0),
          ),
          borderSide: BorderSide(color: Colors.teal),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:  const BorderRadius.all(
            const Radius.circular(11.0),
          ),
          borderSide: BorderSide(color: AppColor.red),
        ),
      ),
      onChanged: onchange,

      textInputAction: TextInputAction.next,
    );
  }
}

