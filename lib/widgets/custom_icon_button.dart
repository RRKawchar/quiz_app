import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key, required this.onPressed, required this.icon,
  });
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white54, width: 2)),
      child: IconButton(
        onPressed: onPressed,
        icon:  Icon(
          icon,
          size: 28,
          color: Colors.white,
        ),
      ),
    );
  }
}