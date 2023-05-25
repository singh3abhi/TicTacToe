import 'package:flutter/material.dart';
import 'package:my_tictactoe/models/player.dart';

// ChangeNotifier is provided by flutter itself (material.dart)
class RoomDataProvider extends ChangeNotifier {
  // NotifyListener
  // Which ever widget uses this class and listens to it will
  // be notified of the changes

  // room which we are getting from server/mongodb is a map
  Map<String, dynamic> _roomData = {};
  final List<String> _displayElements = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  // It will keep track of how many displayElements are filled
  int _filledBoxes = 0;

  Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );

  Player _player2 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  //Create a getter
  Map<String, dynamic> get roomData => _roomData;
  Player get player1 => _player1;
  Player get player2 => _player2;
  List<String> get displayElements => _displayElements;
  int get filledBoxes => _filledBoxes;

  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    // Wherever we are using RoomDataProivder with provider
    // and listening will be notified that roomData has been
    // Updated and they should rebuild their widget
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    //It will convert player1 Data to a map and store it in private field _player1
    // which can be accesed through player1 getter
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    //It will convert player2 Data to a map and store it in private field _player2
    // which can be accesed through player1 getter
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }

  void updateDisplayElements(int index, String choice) {
    _displayElements[index] = choice;
    _filledBoxes += 1;
    notifyListeners();
  }

  void setFilledBoxesTo0() {
    _filledBoxes = 0;
  }
}
