import 'package:flutter/material.dart';
typedef validatorType = String? Function(String?);

class CustomFormField extends StatefulWidget {
  String label;
  TextInputType keyboard;
  bool isPassword;
  validatorType validate;
  TextEditingController controller;
  CustomFormField({required this.label,required this.keyboard,this.isPassword=false,required this.controller,required this.validate});

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isObscured = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validate,
      keyboardType: widget.keyboard,
      obscureText: widget.isPassword==true
      ?isObscured
      :false,
      obscuringCharacter: '*',
      style: Theme.of(context).textTheme.labelSmall?.copyWith(
        fontSize: 18,
      ),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: Theme.of(context).textTheme.labelSmall,
        suffixIcon: widget.isPassword
        ? IconButton(onPressed: (){
          setState(() {
            isObscured = !isObscured;
          });

        }, icon: Icon(
          isObscured
          ? Icons.visibility_off_outlined
          : Icons.visibility_outlined,
          color: Theme.of(context).colorScheme.primary,
          size: 30,
        ))
        : null

      ),
    );
  }
}
