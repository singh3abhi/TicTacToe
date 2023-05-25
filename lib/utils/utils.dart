import 'package:flutter/material.dart';
import 'package:my_tictactoe/resources/game_methods.dart';
import 'package:my_tictactoe/screens/main_menu_screen.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

void showGameDialog(BuildContext context, String text) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              GameMethods().clearBoard(context);
              Navigator.pop(context);
            },
            child: const Text(
              'Play Again',
            ),
          )
        ],
      );
    },
  );
}

void showRestartGame(BuildContext context, String text) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.popUntil(context, (route) => false);
              Navigator.pushNamed(context, MainMenuScreen.routeName);
            },
            child: const Text(
              'New Game',
            ),
          )
        ],
      );
    },
  );
}
