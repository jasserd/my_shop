import 'package:flutter/material.dart';

class KeyboardDismissible extends StatelessWidget {
  const KeyboardDismissible({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: .translucent,
      onTap: FocusManager.instance.primaryFocus?.unfocus,
      child: child,
    );
  }
}
