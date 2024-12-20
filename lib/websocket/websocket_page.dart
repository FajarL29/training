import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/status.dart' as status;

class WebSocketPage extends StatefulWidget {
  const WebSocketPage({Key? key}) : super(key: key);

  @override
  State<WebSocketPage> createState() => _WebSocketPageState();
}

class _WebSocketPageState extends State<WebSocketPage> {
  late WebSocketChannel _channel;
  String _receivedData = '';

  @override
  void initState() {
    super.initState();
    _channel = WebSocketChannel.connect(Uri.parse('wss://echo.websocket.org/ws'));
    _channel.stream.listen((data) {
      setState(() {
        _receivedData = data;
      });
    });
  }

  void _sendMessage(String message) {
    _channel.sink.add(message);
  }

  @override
  void dispose() {
    _channel.sink.close(status.normalClosure);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Received Data:'),
            Text(
              _receivedData,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _sendMessage('Hello, WebSocket!');
              },
              child: const Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: WebSocketPage(),
  ));
}
