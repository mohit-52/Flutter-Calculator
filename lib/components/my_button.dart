
import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {

  final String title;
  final Color bgColor;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.title,
    this.bgColor = const Color(0xffa5a5a5),
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: InkWell(
          onTap: onPressed,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
                color: bgColor,
              shape: BoxShape.circle
            ),
            child: Center(
              child: Text(title, style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}