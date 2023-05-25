import 'package:flutter/material.dart';
import 'package:my_tictactoe/widgets/custom_grid_base.dart';

class HomeTicTacToeBoard extends StatelessWidget {
  const HomeTicTacToeBoard({super.key});
  static const Color bColor = Color.fromARGB(255, 102, 72, 196);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      width: 350,
      height: 350,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: const GridBase(),
      ),
    );
  }
}
