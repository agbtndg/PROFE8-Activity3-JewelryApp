import 'package:flutter/material.dart';

class DemoPushReplacementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo PushReplacement'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This screen was added using push() or pushReplacement()',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'If push(), back goes to Demo Push.\nIf pushReplacement(), back skips Demo Push.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/demo_push');
              },
              child: Text('Go to Push Screen (push)'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/demo_push');
              },
              child: Text('Go to Push Screen (pushReplacement)'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}