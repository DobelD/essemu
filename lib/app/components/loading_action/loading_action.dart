import 'package:essemu/app/themes/colors/colors.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
    required this.isLoading,
    this.child,
  }) : super(key: key);

  final bool isLoading;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: child ?? const SizedBox.shrink(),
        ),
        if (isLoading)
          Positioned.fill(
            child: Container(
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: CircularProgressIndicator(color: kMain),
              ),
            ),
          )
      ],
    );
  }
}
