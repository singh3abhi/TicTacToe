import 'package:flutter/material.dart';
import 'package:my_tictactoe/provider/room_data_provider.dart';
import 'package:my_tictactoe/widgets/custom_player_board.dart';
import 'package:provider/provider.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlayerBoard(
          playerName: roomDataProvider.player1.nickname,
          playerPoints: roomDataProvider.player1.points.toInt().toString(),
        ),
        PlayerBoard(
          playerName: roomDataProvider.player2.nickname,
          playerPoints: roomDataProvider.player2.points.toInt().toString(),
        ),
      ],
    );
  }
}
