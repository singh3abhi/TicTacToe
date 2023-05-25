import 'package:flutter/material.dart';
import 'package:my_tictactoe/widgets/custom_grid_container.dart';

class GridBase extends StatelessWidget {
  const GridBase({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      children: const [
        CustomContainer(text: 'T', kcolor: Color.fromARGB(255, 235, 22, 78)),
        CustomContainer(text: 'I', kcolor: Color.fromARGB(255, 255, 207, 53)),
        CustomContainer(text: 'C', kcolor: Color.fromARGB(255, 235, 22, 78)),
        CustomContainer(text: 'T', kcolor: Color.fromARGB(255, 255, 207, 53)),
        CustomContainer(text: 'A', kcolor: Color.fromARGB(255, 235, 22, 78)),
        CustomContainer(text: 'C', kcolor: Color.fromARGB(255, 255, 207, 53)),
        CustomContainer(text: 'T', kcolor: Color.fromARGB(255, 235, 22, 78)),
        CustomContainer(text: 'O', kcolor: Color.fromARGB(255, 255, 207, 53)),
        CustomContainer(text: 'E', kcolor: Color.fromARGB(255, 235, 22, 78)),
      ],
    );
  }
}
