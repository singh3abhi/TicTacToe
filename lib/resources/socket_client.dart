import 'package:socket_io_client/socket_io_client.dart' as IO;

/*Singelton Class
  In software engineering, the singleton pattern is a 
  software design pattern that restricts the instantiation
  of a class to a singular instance.
  And that singular instance can be used in whole app
  */

class SocketClient {
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._internal() {
    socket = IO.io('http://yourip:3000', <String, dynamic>{
      'transports': [
        'websocket'
      ],
      'autoConnect': false,
    });
    socket!.connect();
  }

  static SocketClient get instance {
    _instance ??= SocketClient._internal();
    return _instance!;
  }
}
