# 🎮 Flutter 2048 Game

A Flutter implementation of the classic **2048 puzzle game** built with **Flutter & Dart**. The game features swipe-based tile movement, tile merging logic, score tracking, game-over detection, reusable widgets, and a clean, modular architecture.

---

## 📱 Overview

Flutter 2048 Game is a logic-based puzzle game where players swipe numbered tiles on a **4×4 grid**. When two tiles with the same value collide, they merge into one tile with double the value. The objective is to create the **2048 tile** while achieving the highest possible score.

This project demonstrates Flutter UI development, gesture handling, game-state management, and algorithm implementation.

---

## ✨ Features

- 🎮 Classic 2048 gameplay
- 👆 Swipe gesture controls
- 🔢 Tile merging algorithm
- 📊 Real-time score tracking
- 🔄 Restart game functionality
- 🚫 Game-over detection
- 📱 Responsive UI
- ♻️ Reusable widgets
- 🏗️ Clean and modular architecture

---

## 🛠️ Tech Stack

- Flutter
- Dart
- Material Design

---

## 📂 Project Structure

```
lib/
│
├── core/
├── models/
├── screens/
├── services/
├── utils/
├── widgets/
└── main.dart
```

### Folder Responsibilities

- **core/** – Game constants and shared configurations.
- **models/** – Data models representing tiles and game state.
- **services/** – Implements game logic including swipe handling, tile movement, merging, score calculation, and game-over detection.
- **screens/** – UI screens for the game.
- **widgets/** – Reusable widgets such as the game board, tiles, score card, and buttons.
- **utils/** – Helper methods and utility functions.
- **main.dart** – Entry point of the application.

---

## 🚀 Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code

### Installation

```bash
git clone https://github.com/kiranmai456/flutter-2048-game.git
```

```bash
cd flutter-2048-game
```

```bash
flutter pub get
```

```bash
flutter run
```

---

## 🎯 How It Works

1. Launch the application.
2. Swipe in any direction.
3. Tiles move toward the swipe direction.
4. Matching tiles merge into one tile with double the value.
5. The score increases after each successful merge.
6. The game ends when there are no empty cells or valid moves remaining.

---

## 💡 Flutter Concepts Used

- StatefulWidget
- Custom Widgets
- GestureDetector
- Grid Layout
- State Management using `setState()`
- Responsive UI
- Modular Architecture

---

## 🎤 Interview Highlights

This project demonstrates:

- Flutter UI Development
- Game-State Management
- Gesture Handling
- Algorithm Design
- Clean Architecture
- Problem Solving
- Reusable Components

---

## 🚀 Future Improvements

- 💾 High score persistence
- ↩️ Undo functionality
- 🎞️ Tile animations
- 🌙 Dark mode
- 📱 Multiple board sizes
- 🔊 Sound effects

---

## 👩‍💻 Author

**Swathi Kiranmai**

GitHub: https://github.com/kiranmai456

---

⭐ If you found this project useful, consider giving it a star!
