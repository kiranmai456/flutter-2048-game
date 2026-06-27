import 'package:flutter/material.dart';
import '../core/game_engine.dart';
import '../widgets/tile_widget.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final game = GameEngine();

  void update(void Function() fn) {
    setState(fn);
  }

  void swipe(int dir) {
    if (game.isGameOver() || game.isWin()) return;

    switch (dir) {
      case 0:
        update(game.moveUp);
        break;
      case 1:
        update(game.moveDown);
        break;
      case 2:
        update(game.moveLeft);
        break;
      case 3:
        update(game.moveRight);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2048"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() => game.reset());
            },
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              setState(() => game.undo());
            },
          ),
        ],
      ),
      body: GestureDetector(
        onVerticalDragEnd: (d) {
          if (d.primaryVelocity! < 0) swipe(0);
          if (d.primaryVelocity! > 0) swipe(1);
        },
        onHorizontalDragEnd: (d) {
          if (d.primaryVelocity! < 0) swipe(3);
          if (d.primaryVelocity! > 0) swipe(2);
        },
        child: Column(
          children: [
            const SizedBox(height: 20),

            Text(
              "Score: ${game.score}",
              style: const TextStyle(fontSize: 24),
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: 16,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4),
                itemBuilder: (_, i) {
                  final x = i ~/ 4;
                  final y = i % 4;

                  return TileWidget(value: game.grid[x][y]);
                },
              ),
            ),

            if (game.isWin())
              const Text("YOU WIN 🎉",
                  style: TextStyle(fontSize: 24)),

            if (game.isGameOver())
              const Text("GAME OVER 💀",
                  style: TextStyle(fontSize: 24)),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}