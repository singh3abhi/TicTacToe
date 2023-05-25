// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

//Player Model
class Player {
  final String nickname;
  final String socketID;
  final double points;
  final String playerType;

  Player({
    required this.nickname,
    required this.socketID,
    required this.points,
    required this.playerType,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nickname': nickname,
      'sockerID': socketID,
      'points': points,
      'playerType': playerType,
    };
  }

  // Generating json serialization With the help of an extension (ctrl + .)
  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      nickname: map['nickname'] ?? '',
      socketID: map['socketID'] ?? '',
      points: map['points']?.toDouble() ?? 0.0,
      playerType: map['playerType'] ?? '',

      // This was giving error of null so we had to use ??
      // nickname: map['nickname'] as String,
      // socketID: map['sockerID'] as String,
      // points: map['points'] as double,
      // playerType: map['playerType'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Player copyWith({
    String? nickname,
    String? socketID,
    double? points,
    String? playerType,
  }) {
    return Player(
      nickname: nickname ?? this.nickname,
      socketID: socketID ?? this.socketID,
      points: points ?? this.points,
      playerType: playerType ?? this.playerType,
    );
  }
}
