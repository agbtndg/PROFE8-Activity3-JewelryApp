import 'package:flutter/material.dart';

class CustomizationScreen extends StatefulWidget {
  @override
  _CustomizationScreenState createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _engravingText = '';
  bool _giftBox = false;
  bool _expressDelivery = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customize Jewelry'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Engraving Text',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (value) {
                  setState(() {
                    _engravingText = value;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Checkbox(
                    value: _giftBox,
                    onChanged: (value) {
                      setState(() {
                        _giftBox = value ?? false;
                      });
                    },
                  ),
                  Text('Include Gift Box'),
                ],
              ),
              Row(
                children: [
                  Switch(
                    value: _expressDelivery,
                    onChanged: (value) {
                      setState(() {
                        _expressDelivery = value;
                      });
                    },
                  ),
                  Text('Express Delivery'),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Engraving: $_engravingText, Gift Box: $_giftBox, Express Delivery: $_expressDelivery',
                        ),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}