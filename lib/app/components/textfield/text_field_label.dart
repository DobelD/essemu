import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';

import '../../themes/typograpy/typo.dart';
import '../link_text/link_text.dart';

enum LabelPosition { top, left, none }

class AppTextFieldLabel extends StatefulWidget {
  const AppTextFieldLabel(
      {Key? key,
      required this.controller,
      this.labelText,
      this.labelPosition = LabelPosition.top,
      this.hintText,
      this.linkText,
      this.linkOnPressed,
      this.enabled = true,
      this.keyboardType,
      this.fillColors = kWhite,
      this.borderColors = true,
      this.isTypeSearch = false,
      this.isTypeAuth = false})
      : minLines = 1,
        maxLines = 1,
        isTypePassword = false,
        assert(labelPosition == LabelPosition.left
            ? linkText == null
            : linkText == linkText),
        assert(
            linkText != null ? linkOnPressed != null : linkOnPressed == null),
        super(key: key);

  const AppTextFieldLabel.textSearch({
    Key? key,
    required this.controller,
    this.labelText,
    this.labelPosition = LabelPosition.top,
    this.hintText,
    this.linkText,
    this.linkOnPressed,
    this.enabled = true,
    this.fillColors = kWhite,
    this.borderColors = true,
    this.keyboardType,
    this.isTypeAuth = false,
    this.isTypeSearch = true,
  })  : minLines = 1,
        maxLines = 1,
        isTypePassword = false,
        assert(labelPosition == LabelPosition.left
            ? linkText == null
            : linkText == linkText),
        assert(
            linkText != null ? linkOnPressed != null : linkOnPressed == null),
        super(key: key);

  const AppTextFieldLabel.textPassword({
    Key? key,
    required this.controller,
    this.labelText,
    this.labelPosition = LabelPosition.top,
    this.hintText,
    this.linkText,
    this.linkOnPressed,
    this.enabled = true,
    this.fillColors = kWhite,
    this.borderColors = true,
    this.keyboardType,
    this.isTypeAuth = true,
    this.isTypeSearch = false,
  })  : minLines = 1,
        maxLines = 1,
        isTypePassword = true,
        assert(labelPosition == LabelPosition.left
            ? linkText == null
            : linkText == linkText),
        assert(
            linkText != null ? linkOnPressed != null : linkOnPressed == null),
        super(key: key);
  const AppTextFieldLabel.textUser({
    Key? key,
    required this.controller,
    this.labelText,
    this.labelPosition = LabelPosition.top,
    this.hintText,
    this.linkText,
    this.linkOnPressed,
    this.enabled = true,
    this.fillColors = kWhite,
    this.borderColors = true,
    this.keyboardType,
    this.isTypeAuth = true,
    this.isTypeSearch = false,
  })  : minLines = 1,
        maxLines = 1,
        isTypePassword = false,
        assert(labelPosition == LabelPosition.left
            ? linkText == null
            : linkText == linkText),
        assert(
            linkText != null ? linkOnPressed != null : linkOnPressed == null),
        super(key: key);

  const AppTextFieldLabel.textArea({
    Key? key,
    required this.controller,
    this.labelText,
    this.labelPosition = LabelPosition.top,
    this.hintText,
    this.linkText,
    this.linkOnPressed,
    this.enabled = true,
    this.maxLines = 3,
    this.minLines = 3,
    this.fillColors = kWhite,
    this.borderColors = true,
    this.isTypeAuth = false,
    this.isTypeSearch = false,
    this.keyboardType = TextInputType.multiline,
  })  : isTypePassword = false,
        assert((maxLines ?? 1) >= (minLines ?? 1)),
        assert(labelPosition == LabelPosition.left
            ? linkText == null
            : linkText == linkText),
        assert(
            linkText != null ? linkOnPressed != null : linkOnPressed == null),
        super(key: key);

  final TextEditingController controller;
  final String? labelText;
  final LabelPosition labelPosition;
  final String? hintText;
  final String? linkText;
  final VoidCallback? linkOnPressed;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final TextInputType? keyboardType;
  final bool isTypePassword;
  final Color fillColors;
  final bool borderColors;
  final bool isTypeAuth;
  final bool isTypeSearch;

  @override
  State<AppTextFieldLabel> createState() => _AppTextFieldLabelState();
}

class _AppTextFieldLabelState extends State<AppTextFieldLabel> {
  bool isObscureText = false;

  @override
  void initState() {
    super.initState();

    isObscureText = widget.isTypePassword;
  }

  bool get isLabelTextDefined => widget.labelText?.isNotEmpty ?? false;

  OutlineInputBorder get _borderStyle => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.w),
        borderSide: BorderSide(
            color: widget.borderColors == true ? kMain : kWhite, width: 1.w),
      );
  OutlineInputBorder get _borderStyleFocused => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.w),
        borderSide:
            BorderSide(color: widget.enabled ? kMain : kWhite, width: 1.2.w),
      );

  int get _minLines => widget.minLines ?? 1;

  int get _maxLines => widget.maxLines ?? _minLines;

  void suffixPasswordOnTap() {
    setState(() {
      isObscureText = !isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelPosition == LabelPosition.top)
          Padding(
            padding: EdgeInsets.only(bottom: 8.w),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isLabelTextDefined
                    ? Text(
                        widget.labelText!,
                        style: AppTextTheme.current.title4
                            .copyWith(color: kSoftBlack),
                      )
                    : const SizedBox.shrink(),
                if (widget.linkText?.isNotEmpty ?? false)
                  RichText(
                    text: LinkText(
                      linkText: widget.linkText!,
                      onPressed: widget.linkOnPressed ?? () {},
                    ),
                  ),
              ],
            ),
          ),
        SizedBox(
          height: 46.w,
          child: TextFormField(
            controller: widget.controller,
            enabled: widget.enabled,
            maxLines: _maxLines,
            minLines: _minLines,
            keyboardType: widget.keyboardType,
            obscureText: isObscureText,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              fillColor: widget.enabled ? widget.fillColors : kSofterGrey,
              hintText: widget.hintText,
              hintStyle: AppTextTheme.current.hintText,
              icon: widget.labelPosition == LabelPosition.left &&
                      isLabelTextDefined
                  ? Text(
                      widget.labelText!,
                      style: AppTextTheme.current.title4
                          .copyWith(color: kSoftBlack),
                    )
                  : null,
              border: _borderStyle,
              enabledBorder: _borderStyle,
              focusedBorder: _borderStyleFocused,
              errorBorder: _borderStyle,
              disabledBorder: _borderStyle,
              focusedErrorBorder: _borderStyle,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.w, horizontal: 8.w),
              enabled: widget.enabled,
              prefixIcon: widget.isTypeAuth
                  ? Icon(
                      widget.isTypePassword ? Icons.lock : Icons.person,
                      size: 20.w,
                      color: kSoftGrey,
                    )
                  : widget.isTypeSearch
                      ? Icon(
                          IconlyLight.search,
                          size: 20.w,
                          color: kSoftGrey,
                        )
                      : null,
              suffixIcon: widget.isTypePassword
                  ? IconButton(
                      onPressed: suffixPasswordOnTap,
                      icon: Icon(
                        isObscureText ? Icons.visibility : Icons.visibility_off,
                        size: 20.w,
                        color: kSoftGrey,
                      ),
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
