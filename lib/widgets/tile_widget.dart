import 'package:flutter/material.dart';

class TileWidget extends StatelessWidget {
  final int value;

  const TileWidget({
    super.key,
    required this.value,
  });

  Color _color() {
    switch (value) {
      case 2:
      case 4:
        return const Color(0xFFEEE4DA);
      case 8:
        return const Color(0xFFF2B179);
      case 16:
        return const Color(0xFFF59563);
      case 32:
        return const Color(0xFFF67C5F);
      case 64:
        return const Color(0xFFF65E3B);
      case 128:
        return const Color(0xFFEDCF72);
      case 256:
        return const Color(0xFFEDCC61);
      case 512:
        return const Color(0xFFEDC850);
      case 1024:
        return const Color(0xFFEDC53F);
      case 2048:
        return const Color(0xFFEDC22E);
      default:
        return const Color(0xFFCDC1B4);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 120),
      margin: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: _color(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          value == 0 ? '' : '$value',
          style: TextStyle(
            fontSize: value > 100 ? 18 : 26,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}