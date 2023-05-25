import 'package:flutter/material.dart';
import 'package:my_tictactoe/provider/room_data_provider.dart';
import 'package:my_tictactoe/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    roomIdController = TextEditingController(
      text: Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
    super.initState();
  }

  @override
  void dispose() {
    roomIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Waiting for the player to join'),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          controller: roomIdController,
          hintText: '',
          isReadOnly: true,
        )
      ],
    );
  }
}
