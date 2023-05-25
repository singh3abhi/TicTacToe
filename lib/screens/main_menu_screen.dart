import 'package:flutter/material.dart';
import 'package:my_tictactoe/responsive/responsive.dart';
import 'package:my_tictactoe/screens/create_room_screen.dart';
import 'package:my_tictactoe/screens/join_room_screen.dart';
import 'package:my_tictactoe/views/home_tictactoe_board.dart';
import 'package:my_tictactoe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HomeTicTacToeBoard(),
            const SizedBox(
              height: 75,
            ),
            CustomButton(onTap: () => createRoom(context), text: 'Create Room'),
            const SizedBox(
              height: 20,
            ),
            CustomButton(onTap: () => joinRoom(context), text: 'Join Room'),
          ],
        ),
      ),
    );
  }
}
