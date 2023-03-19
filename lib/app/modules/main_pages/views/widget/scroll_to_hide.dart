import 'package:flutter/material.dart';

class ScrollToHide extends StatefulWidget {
  const ScrollToHide(
      {super.key,
      required this.controller,
      required this.child,
      this.duration = const Duration(milliseconds: 200)});

  final ScrollController controller;
  final Widget child;
  final Duration? duration;

  @override
  State<ScrollToHide> createState() => _ScrollToHideState();
}

class _ScrollToHideState extends State<ScrollToHide> {
  bool isVisible = true;
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(listen);
  }

  @override
  void dispose() {
    widget.controller.removeListener(listen);
    super.dispose();
  }

  void listen() {
    if (widget.controller.position.pixels >= 200) {
      show();
    } else {
      hide();
    }
  }

  void show() {
    if (!isVisible) setState(() => isVisible = true);
  }

  void hide() {
    if (isVisible) setState(() => isVisible = false);
  }

  @override
  Widget build(BuildContext context) => AnimatedContainer(
      duration: widget.duration!,
      height: isVisible ? kBottomNavigationBarHeight : 0,
      child: widget.child);
}
