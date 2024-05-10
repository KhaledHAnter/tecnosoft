import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, this.isActive = false});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: isActive ? Colors.black : Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      height: isActive ? 25 : 10,
      width: 5,
    );
  }
}
