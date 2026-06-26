import 'package:flutter/material.dart';
import 'package:my_2048_app/widgets/tile_widget.dart';

class Board extends StatelessWidget {
  final List<List<int>> grid;

  const Board({super.key, required this.grid});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFFBBADA0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 16,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
          ),
          itemBuilder: (context, index) {
            final row = index ~/ 4;
            final col = index % 4;

            return TileWidget(value: grid[row][col]);
          },
        ),
      ),
    );
  }
}
