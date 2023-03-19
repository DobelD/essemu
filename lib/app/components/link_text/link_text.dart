import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../themes/typograpy/typo.dart';

class LinkText extends TextSpan {
  LinkText({
    required this.linkText,
    required this.onPressed,
    this.textStyle,
  }) : super(
          text: linkText,
          style: (textStyle ?? _defaultLinkStyle).copyWith(
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = onPressed,
        );

  static TextStyle get _defaultLinkStyle => AppTextTheme.current.link;

  final String linkText;
  final VoidCallback onPressed;
  final TextStyle? textStyle;
}
