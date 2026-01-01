import 'package:flutter/material.dart';

import '../core/constants/api_colors.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.hint, required this.isPassword, required this.controller});
  final String hint;
  final bool isPassword;
  final TextEditingController controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;
  @override
  void initState() {
    super.initState();
    _obscureText= widget.isPassword;
  }
  void _togglePassword(){
    setState(() {
      _obscureText= ! _obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 10,
      cursorColor: AppColors.primary,
      validator: (v){
        if(v==null|| v.isEmpty){
          return"please fill ${widget.hint}";
        }
        return null;
      },
      obscureText: _obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white)
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: widget.hint,
        suffixIcon: widget.isPassword?
        GestureDetector(
          onTap: _togglePassword,
            child: Icon(Icons.remove_red_eye_outlined,color: Colors.white,)):null
      ),
    );
  }
}
