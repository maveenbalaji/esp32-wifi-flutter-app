import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

const String esp32IP = 'ESP32_IP_ADDRESS'; // Replace with your ESP32's IP address

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ESP32 Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ControlScreen(),
    );
  }
}

class ControlScreen extends StatefulWidget {
  @override
  _ControlScreenState createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  bool isConnected = false;
  String statusMessage = 'Connecting to ESP32...';

  @override
  void initState() {
    super.initState();
    checkConnection();
  }

  void checkConnection() async {
    try {
      var url = Uri.http('$esp32IP', '/');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          isConnected = true;
          statusMessage = 'Connected to ESP32';
        });
      } else {
        setState(() {
          isConnected = false;
          statusMessage = 'Failed to connect to ESP32';
        });
      }
    } catch (e) {
      setState(() {
        isConnected = false;
        statusMessage = 'Failed to connect to ESP32';
      });
    }
  }

  void sendAction(String device, String action) async {
    var url = Uri.http('$esp32IP', '/control');
    var response = await http.post(
      url,
      body: {'device': device, 'action': action},
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP32 Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(statusMessage),
            SizedBox(height: 20),
            isConnected
                ? Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    sendAction('relay', 'turn_on');
                  },
                  child: Text('Turn On Relay'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    sendAction('relay', 'turn_off');
                  },
                  child: Text('Turn Off Relay'),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    sendAction('motor', 'turn_on');
                  },
                  child: Text('Turn On Motor'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    sendAction('motor', 'turn_off');
                  },
                  child: Text('Turn Off Motor'),
                ),
              ],
            )
                : SizedBox.shrink(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          checkConnection();
        },
        tooltip: 'Check Connection',
        child: Icon(Icons.refresh),
      ),
    );
  }
}
