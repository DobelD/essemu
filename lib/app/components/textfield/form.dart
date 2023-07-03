import 'package:essemu/app/themes/colors/colors.dart';
import 'package:essemu/app/themes/typograpy/typo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../themes/decoration/app_radius.dart';

enum TypeForm { email, phone, password, normal }

class FormTxt extends StatefulWidget {
  const FormTxt(
      {super.key,
      this.title,
      this.hint,
      this.controller,
      this.isPassword = false});
  const FormTxt.password(
      {super.key,
      this.title,
      this.hint,
      this.controller,
      this.isPassword = true});

  final String? title;
  final String? hint;
  final TextEditingController? controller;
  final bool isPassword;

  @override
  State<FormTxt> createState() => _FormTxtState();
}

class _FormTxtState extends State<FormTxt> {
  bool isObscureText = false;
  String? errorText;
  double containerHeight = 48.h;

  @override
  void initState() {
    super.initState();

    isObscureText = widget.isPassword;
  }

  void suffixPasswordOnTap() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  void validateField(String value) {
    setState(() {
      errorText = FormValidation.validate(getTypeForm(), value);
      if (errorText != null) {
        containerHeight = 72.h;
      } else {
        containerHeight = 48.h;
      }
    });
  }

  TypeForm getTypeForm() {
    if (widget.isPassword) {
      return TypeForm.password;
    } else if (widget.title?.toLowerCase() == 'email') {
      return TypeForm.email;
    } else if (widget.title?.toLowerCase() == 'no telephone') {
      return TypeForm.phone;
    } else {
      return TypeForm.normal;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                  text: widget.title, style: AppTextTheme.current.bodyText),
              TextSpan(text: '*', style: AppTextTheme.current.bodyTextRed),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: containerHeight,
          child: TextFormField(
            controller: widget.controller,
            style: AppTextTheme.current.bodyText,
            cursorColor: kMain,
            obscureText: isObscureText,
            onChanged: validateField,
            decoration: InputDecoration(
                errorText: errorText,
                errorStyle: TextStyle(height: 0),
                filled: true,
                hintText: 'Isi ${widget.hint} disini',
                hintStyle: AppTextTheme.current.hintText,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        onPressed: suffixPasswordOnTap,
                        icon: Icon(
                          isObscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          size: 20.w,
                          color: kSoftGrey,
                        ),
                      )
                    : null,
                border: OutlineInputBorder(
                    borderRadius: AppRadius.icon,
                    borderSide: BorderSide(color: kSofterGrey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: AppRadius.icon,
                    borderSide: BorderSide(
                      color: kSofterGrey,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius: AppRadius.icon,
                    borderSide: BorderSide(
                      color: kSofterGrey,
                    ))),
          ),
        ),
      ],
    );
  }
}

class FormValidation {
  static String? validate(TypeForm type, String? value) {
    switch (type) {
      case TypeForm.email:
        return _validateEmail(value);
      case TypeForm.phone:
        return _validatePhone(value);
      case TypeForm.password:
        return _validatePassword(value);
      case TypeForm.normal:
        return _validateNormal(value);
      default:
        return null;
    }
  }

  static String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email harus diisi';
    } else if (!_isEmailValid(value)) {
      return 'Email tidak valid';
    }
    return null;
  }

  static bool _isEmailValid(String value) {
    final emailRegExp = RegExp(
        r'^[\w-]+(\.[\w-]+)*@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(value);
  }

  static String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Nomor telepon harus diisi';
    } else if (!_isPhoneValid(value)) {
      return 'Nomor telepon tidak valid';
    }
    return null;
  }

  static bool _isPhoneValid(String value) {
    final phoneRegExp = RegExp(r'^[0-9]{10,12}$');
    return phoneRegExp.hasMatch(value);
  }

  static String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password harus diisi';
    } else if (value.length < 6) {
      return 'Password minimal 6 karakter';
    } else if (!_isPasswordValid(value)) {
      return 'Password harus memiliki huruf besar, kecil, angka dan simbol';
    }
    return null;
  }

  static bool _isPasswordValid(String value) {
    final uppercaseRegExp = RegExp(r'[A-Z]');
    final lowercaseRegExp = RegExp(r'[a-z]');
    final numberRegExp = RegExp(r'[0-9]');
    final symbolRegExp = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    return uppercaseRegExp.hasMatch(value) &&
        lowercaseRegExp.hasMatch(value) &&
        numberRegExp.hasMatch(value) &&
        symbolRegExp.hasMatch(value);
  }

  static String? _validateNormal(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field ini harus diisi';
    }
    return null;
  }
}
