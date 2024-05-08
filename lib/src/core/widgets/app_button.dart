import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.child,
    required this.color,
    required this.onTap,
  });
  final Widget child;
  final Color color;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: color,
        ),
        child: child,
      ),
    );
  }
}
