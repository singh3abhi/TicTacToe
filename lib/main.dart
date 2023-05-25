import 'package:flutter/material.dart';
import 'package:my_tictactoe/provider/room_data_provider.dart';
import 'package:my_tictactoe/screens/create_room_screen.dart';
import 'package:my_tictactoe/screens/game_screen.dart';
import 'package:my_tictactoe/screens/join_room_screen.dart';
import 'package:my_tictactoe/screens/main_menu_screen.dart';
import 'package:my_tictactoe/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We will create a class which will extend to ChangeNotifier,
    // whenever some changes are made in that class
    // then you need to change some part of that app which ever
    // uses that class and provider
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          GameScreen.routename: (context) => const GameScreen(),
        },
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
