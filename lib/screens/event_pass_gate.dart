


import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:flutter/services.dart';
import 'package:sentinova_hackfest/screens/dashboard.dart';
import 'package:sentinova_hackfest/screens/qr_scanner_screen.dart';

import '../dataclass/event_model.dart';

class EventPasswordGate extends StatefulWidget {
  final Event event;

  const EventPasswordGate({super.key, required this.event});

  @override
  State<EventPasswordGate> createState() => _EventPasswordGateState();
}

class _EventPasswordGateState extends State<EventPasswordGate> {
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool isScanning = false;

  void _checkPassword(String input) {
    if (input.trim() == widget.event.location) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>Dashboard(event: widget.event)// EventHomePage(event: widget.event), // Your main event page
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Incorrect password')),
      );
    }
  }

  void _startScanQR() async {
    setState(() {
      isScanning = true;
    });

    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => QRScannerScreen(onScan: (result) {
        Navigator.pop(context);
        _checkPassword(result);
      })),
    );

    setState(() {
      isScanning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.event.name ?? "Enter Password")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Enter event password to continue", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              onSubmitted: _checkPassword,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _checkPassword(_passwordController.text),
              icon: const Icon(Icons.lock_open),
              label: const Text("Unlock"),
            ),
            const SizedBox(height: 10),
            const Text("or"),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _startScanQR,
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text("Scan QR Code"),
            ),
          ],
        ),
      ),
    );
  }
}
