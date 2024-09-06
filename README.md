# ESP32 Control App

**Overview**

The ESP32 Control App is a Flutter-based mobile application designed to remotely control the on/off state of an ESP32 board. Using the app, users can easily send commands over an HTTPS connection to the ESP32, allowing them to control devices connected to the board wirelessly. This app is perfect for IoT projects where remote device control is necessary.

## Features

- **Remote Control**: Turn the ESP32 board on or off from anywhere using the app.
- **HTTPS Communication**: Secure communication between the Flutter app and the ESP32 using HTTPS.
- **Real-time Updates**: Get real-time feedback on the status of the ESP32 directly in the app.
- **User-friendly Interface**: Simple and intuitive UI to control the ESP32 with just a tap.
  
## Tech Stack

- **Flutter**: Cross-platform framework for building the mobile app.
- **Dart**: Programming language for the Flutter application.
- **ESP32**: Microcontroller that is controlled via the app.
- **HTTPS**: Secure protocol for sending control commands to the ESP32.

## How It Works

1. **ESP32 Setup**: The ESP32 board is programmed to handle HTTP requests and control its pins based on the commands received.
2. **Flutter App**: The app communicates with the ESP32 via its HTTPS address, sending a command (on/off) that the board interprets to control its GPIO pins.
3. **Real-time Control**: Once a command is sent from the app, the ESP32 immediately responds and updates its state, allowing the user to control the devices connected to the board.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/maveenbalaji/esp32-wifi-flutter-app.git
   ```

2. Navigate to the project directory:
   ```bash
   cd esp32-control-app
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Set the ESP32 HTTPS URL in the app:
   - In the app's source code, replace the placeholder HTTPS URL with the actual address of your ESP32 board.

5. Run the app:
   ```bash
   flutter run
   ```

## ESP32 Configuration

1. Set up the ESP32 with a web server to listen for HTTPS requests.
2. The ESP32 should handle two endpoints:
   - `/on` for turning the device on.
   - `/off` for turning the device off.
3. Upload the code to the ESP32 and note the HTTPS address to configure in the app.

## Future Enhancements

- **Authentication**: Add user authentication to restrict access to the app.
- **Multiple Device Control**: Support controlling multiple ESP32 boards or other IoT devices.
- **Scheduler**: Add a feature to schedule on/off operations.
