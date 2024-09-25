import 'package:flutter/material.dart';

class CustomLoginTextFormField extends StatelessWidget {
  const CustomLoginTextFormField({
    super.key,
    required this.ctrl,
    this.hintText,
  });

  final TextEditingController ctrl;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ctrl,
      validator: (value) {
        if (value==null||value.isEmpty) {
          return "please Enter valid $hintText";
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15)
            )
          ),
        hintText: hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15)
            )
          )
        ),
      );
  }
}
// ignore: must_be_immutable
class CustomObscureTextFormField extends StatefulWidget {
  final TextEditingController ctrl;
  bool obscureText;
  final String? hintText;

  CustomObscureTextFormField({super.key,required this.ctrl,
    this.hintText,required this.obscureText});

  @override
  State<CustomObscureTextFormField> createState() => _CustomObscureTextFormFieldState();
}

class _CustomObscureTextFormFieldState extends State<CustomObscureTextFormField> {
  @override
  Widget build(BuildContext context) {
    
    return TextFormField(
      controller: widget.ctrl,
      validator: (value) {
        if (value==null||value.isEmpty) {
          return "please Enter valid ${widget.hintText}";
        }
        return null;
      },
      obscureText: widget.obscureText,
      decoration: InputDecoration(suffixIcon: IconButton(onPressed: (){
        setState(() {
          widget.obscureText=!widget.obscureText;
        });
      }, icon: widget.obscureText?const Icon(Icons.visibility_off):const Icon(Icons.visibility)),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15)
            )
          ),
        
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            topRight: Radius.circular(15)
            )
          )
        ),
      );
  }
}