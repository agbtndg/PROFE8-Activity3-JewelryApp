import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to JewelForm'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Custom Jewelry Design Studio!',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Home'),
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