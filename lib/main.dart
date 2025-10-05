import 'package:flutter/material.dart';

void main() {
  runApp(JewelForm());
}

class JewelForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JewelForm',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey, // Modern, neutral color
        scaffoldBackgroundColor: Colors.grey[100], // Clean background
      ),
      home: UsernameFormScreen(),
    );
  }
}

class UsernameFormScreen extends StatefulWidget {
  @override
  _UsernameFormScreenState createState() => _UsernameFormScreenState();
}

class _UsernameFormScreenState extends State<UsernameFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Username'),
        centerTitle: true, // Modern, centered title
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0), // Simple padding for clean layout
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(), // Modern input style
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0), // Spacing for clarity
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Username: $_username')),
                    );
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0), // Modern button size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}