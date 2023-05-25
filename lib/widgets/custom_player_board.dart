import 'package:flutter/material.dart';

class PlayerBoard extends StatelessWidget {
  const PlayerBoard({super.key, required this.playerName, required this.playerPoints});
  final String playerName;
  final String playerPoints;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            playerName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            playerPoints,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
