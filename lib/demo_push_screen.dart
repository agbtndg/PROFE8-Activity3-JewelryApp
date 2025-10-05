import 'package:flutter/material.dart';

class DemoPushScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Push'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'This screen was added using push()',
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            Text(
              'Pressing back will return to the previous screen.',
              style: TextStyle(fontSize: 16.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/demo_push_replacement');
              },
              child: Text('Go to PushReplacement Screen (push)'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/demo_push_replacement');
              },
              child: Text('Go to PushReplacement Screen (pushReplacement)'),
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